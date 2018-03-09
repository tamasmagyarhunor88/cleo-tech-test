require_relative './merchandise'
require_relative './change'
require_relative './printer'
require_relative './dispense'
require_relative './reload'

class Machine
  VALID_DENOMINATIONS = [200, 100, 50, 20, 10, 5, 2, 1]
  attr_reader :merchandise, :change, :printer, :user_selection, :change_due

  def initialize
    @merchandise = Merchandise.new
    @change = Change.new
    @printer = Printer.new
    @user_selection = nil
  end

  def start
    loop do
      display_menu
      assign_user_selection
      process_user_selection
    end
  end

  def display_menu
    @printer.print_welcome_message
    @printer.print_product_selection(@merchandise)
    @printer.print_options_message
  end

  def assign_user_selection
    input = STDIN.gets.chomp.downcase
    if input == 'reload' || input == 'exit'
      @user_selection = input
    else
      @user_selection = input.to_i - 1
    end
  end

  def process_user_selection
    dispense(Dispense.new(@user_selection, @merchandise, @change)) if @user_selection.class == Integer
    reload(Reload.new(@merchandise, @change)) if @user_selection == 'reload'
    exit if @user_selection == 'exit'
  end

  def dispense(dispense)
    dispense.dispense
  end

  def reload(reload)
    reload.assign_product_or_change
  end
end
