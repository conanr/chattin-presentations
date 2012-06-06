$:.unshift File.expand_path("..", __FILE__)

require 'service'
require 'active_record'
use ActiveRecord::ConnectionAdapters::ConnectionManagement
run Service