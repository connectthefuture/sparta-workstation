# Awesome Print
begin
  require 'ap'
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "Couldn't load awesome_print 😞"
end

# Aliasses
Pry.commands.alias_command 'q', 'exit'

# Allows the use of the disable-pry command to break out of loops etc, but doesn't disable it permanantly.
Pry::Commands.block_command('enable-pry', 'Enable `binding.pry` feature') do
  ENV['DISABLE_PRY'] = nil
end


# Add Interesting Methods method.
class Object
  def imethods
    if self.class.to_s == "Module"
      self.methods false
    elsif self.class.to_s == "Class"
      self.methods false
    else
      self.public_methods false
    end
  end
end
