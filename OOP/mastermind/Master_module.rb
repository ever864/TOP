module MasterModule
  
  def print_table_game(code_pegs, keys_pegs)
    lg_code = code_pegs.join.length/2
    lg_keys = keys_pegs.join.length/2
    print_code_pegs = "|-" + "#{"-" * lg_code}"  + "-[Code-Pegs]" + "#{"-" * lg_code}"
    print_keys_pegs = "#{"-" * lg_keys}" + "-[Keys-Pegs]"+ "#{"-" * lg_keys}"+ "|"
   
   puts header_printer(lg_code,lg_keys)
   puts  print_code_pegs +"-+"+ print_keys_pegs
   puts results_printer(code_pegs,keys_pegs)
   puts footer_printer(lg_code,lg_keys)
  end

  def header_printer(lg_code,lg_keys)
     "+"+"#{"---"*lg_code}" + "-¡Master Mind!-"+"#{"--"*lg_keys}" + "---+"
  end

  def footer_printer(lg_code,lg_keys)
   "|" + "-" * (header_printer(lg_code,lg_keys).length - 2) + "|"
  end

  def results_printer(code_pegs,keys_pegs)
    print_body_cps = code_pegs.collect{|elem|"[#{elem}]"}.join("|")
    print_body_kys = keys_pegs.collect{|elem|"[#{elem}]"}.join("|")
     "#{"|-" + print_body_cps + "-|-" + print_body_kys + "-|"}"

  end



end