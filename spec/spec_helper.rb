require 'rack/test'
require 'rspec'
require 'pry'
require "rspec/json_expectations"

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Orelrb end
end

# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }
