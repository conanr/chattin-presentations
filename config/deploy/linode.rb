# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# require 'rvm/capistrano'
# set :rvm_ruby_string, '1.9.3'
# set :rvm_type, :user

require 'bundler/capistrano'
set :application, "chattin-presentations"
set :scm, :git
set :repository,  "git@github.com:conanr/chattin-presentations.git"

# server "localhost", :app, :db, :primary => true
set :host, ENV['LINODE'] # We need to be able to SSH to that box as this user.
role :web, host
role :app, host
# ssh_options[:port] = 443
# ssh_options[:keys] = "~/.rvm/gems/ruby-1.9.3-p125@testdeploy/gems/vagrant-1.0.3/keys/vagrant"

set :user, "deployer"
set :deploy_to, "~/apps/#{application}"

# set :use_sudo, true
set :use_sudo, false
set(:run_method) { use_sudo ? :sudo : :run }

# This is needed to correctly handle sudo password prompt
default_run_options[:pty] = true

set :deploy_via, :copy
set :copy_strategy, :export

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end