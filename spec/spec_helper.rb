# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
require 'minitest_reporters_helper'

require 'coveralls'
Coveralls.wear!

Hanami.boot
