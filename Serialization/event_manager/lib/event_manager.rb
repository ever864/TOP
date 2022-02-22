require 'date'
require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'time'
# frozen_string_literal: true


def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_home_phone(homephone)
  gsub_homephone = homephone.gsub('-', '')
  if gsub_homephone.length.equal?(10)
    gsub_homephone
  elsif gsub_homephone.length.equal?(11) && gsub_homephone[0].equal?('1')
    gsub_homephone[1..]
  else
    'this number phone is wrong'
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials
  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

  def max_date(array)
    array.max_by {|a| array.count(a)}
  end

  puts 'Event Manager Initialized!'

  contents = CSV.open(
    'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

array_hour = []
array_day = []

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  date = row[:regdate]
  d = DateTime.strptime(date, "%m/%d/%y %H:%M")
    array_hour << d.hour
    array_day << d.day
  home_phone = clean_home_phone(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
end

puts "Peak hour is: #{max_date(array_hour)}"
puts "PeaK day is: #{Time.new(max_date(array_day)).strftime("%A")}"