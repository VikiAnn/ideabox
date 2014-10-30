require 'bundler'
Bundler.require(:default, :test)
require 'minitest/autorun'
require 'minitest/pride'
$:.unshift File.expand_path("../../lib", __FILE__)

SimpleCov.start
