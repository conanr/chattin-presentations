set :stages, %w(vagrant linode production)
require 'capistrano/ext/multistage'
require 'bundler/capistrano'