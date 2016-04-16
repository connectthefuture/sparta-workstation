require 'rubygems'
require 'irb/completion'

begin
  require 'logger'
rescue LoadError => err
  warn "Couldn't load logger gem"
end

# Load Brice (was wirble) (colouring etc in irb)
begin
  require 'brice/init'
rescue LoadError => err
  warn "Couldn't load brice"
end

# Load Hirb (pretty formatting in irb)
begin
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  warn "Couldn't load hirb"
end

# awesome print
begin
  require 'ap'
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load awesome_print"
end

# irb history
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")


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

# Add require_relative and guid
module Kernel
  def require_relative(file)
    $:.unshift Dir.pwd
    require file
  end

  def guid(s)
    s.scan(/[a-f0-9-]{36}/).first
  end
end

#Set up Aliasses
alias q exit

# IRB settings
IRB.conf[:AUTO_INDENT] = true
