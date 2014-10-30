$:.unshift File.expand_path("./../../lib", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'simplecov'
require 'nokogiri'
require 'app'

SimpleCov.start
