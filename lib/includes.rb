Dir["#{File.dirname(__FILE__)}/DB/*.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/*.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/**/*.rb"].each {|r| load r }
