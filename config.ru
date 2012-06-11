$:.unshift File.expand_path("..", __FILE__)

require 'active_record'
use ActiveRecord::ConnectionAdapters::ConnectionManagement

require 'service'
run Service
