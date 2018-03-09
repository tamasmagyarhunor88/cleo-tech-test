class Printer
  def print_welcome_message
    STDOUT.puts 'Welcome to the World\'s Best Vending Machine(TM).'
    STDOUT.puts 'Did you know that the first known vending existed in Alexandria, Egypt, in the first century? Bet you didn\'t.
    '
  end

  def print_product_selection(merchandise)
    merchandise.products.each_with_index do |product, index|
      print_product(product, index)
    end
  end

  def print_product(product, index)
    STDOUT.puts "#{index + 1}. #{product.name}. Price: #{product.price}"
  end

  def print_options_message
    STDOUT.puts 'Please enter a number to make your selection, \'Reload\' if you would like to add more products to the machine, or \'Exit\' if you do not wish to be trapped inside a command-line vending machine for all eternity.'
  end

  def request_coins
    STDOUT.puts 'Please insert coins.'
  end

  def invalid_coin_inserted
    STDOUT.puts 'Sorry, that is not a valid denomination.'
  end

  def print_reload_options
    STDOUT.puts 'Would you like to reload products or change?'
  end

  def request_quantity
    STDOUT.puts 'How many would you like to reload?'
  end

  def request_coin_selection
    STDOUT.puts 'What denomination of coin would you like to reload? Please input either 1, 2, 5, 10, 20, 50, 100, or 200.'
  end
end
