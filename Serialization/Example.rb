# frozen_string_literal: true

require 'open-uri'

remote_base_url = 'http://en.wikipedia.org/wiki'
remote_page_name = 'Ada_Lovelace'
remote_full_url = "#{remote_base_url}/#{remote_page_name}"

remote_data = URI.open(remote_full_url).read
my_local_file = open('my-downloaded-page.html', 'w')

my_local_file.write(remote_data)
my_local_file.close
