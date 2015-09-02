require_relative "entry.rb"

class AddressBook
  attr_accessor :entries

  def initialize()
    @entries = []
    
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end

    @entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|
      if name == entry.name
        # we found the entry to remove
        break
      end
      # didn't find the entry, let's look at the next one
      index += 1
    end
    # now remvoe the entry - this probably breaks if we never find the entry!
    @entries.delete_at(index)
  end
end