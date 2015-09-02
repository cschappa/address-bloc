require_relative "../models/address_book.rb"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View Entry Number n"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter you selection: "

    selection = gets.to_i
    puts "You picked #{selection}"

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      view_entry_n
      main_menu
    when 3
      system "clear"
      create_entry
      main_menu
    when 4
      system "clear"
      search_entries
      main_menu
    when 5
      system "clear"
      read_csv
      main_menu
    when 6
      puts "Good-bye"
      exit(0)
    else
      system "clear"
      puts "Sorry, that entry is not valid"
      main_menu      
    end
  end

  def view_all_entries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"    
  end

  def view_entry_n
    num_entries = @address_book.entries.count
    system "clear"

    # check to make sure we have entries to display
    if num_entries == 0
      puts "AddressBloc is empty, Please add entries"
      return
    end
    
    # prompt user until we get a valid input
    loop do

      puts "Please enter a vaild entry number between 0 - #{num_entries-1}"
      print "Which entry number would you like to view?: "
      index = gets.chomp
      
      if index == "m"
        # user want to return to main menu, break out of loop and return
        system "clear"
        break
      end

      if (0...num_entries).include?(index.to_i)
        puts @address_book.entries[index.to_i].to_s
        break
      else
        # index isn't valid, give some quidance and lets try again
        system "clear"
        puts "Invalid entry: #{index}"
        puts "enter m to return to the main menu"
      end

    end
    
  end
 
  def create_entry
    puts "New AddressBloc Entry"
      
    print "Name: "
    name = gets.chomp

    print "Phone Number: "
    phone_number = gets.chomp
    
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone_number, email)
    system "clear"

    puts "New entry created"

  end
 
  def search_entries
  end
 
  def read_csv
  end

  def entry_submenu(entry)

    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
 
    selection = gets.chomp

    case selection
    when "n"
    when "d"
    when "e"
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid entry"
      entry_submenu(entry)
    end
  end

end