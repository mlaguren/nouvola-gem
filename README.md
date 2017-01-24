# Nouvola Gem

This gem is  a client wrapper for  Nouvala's API.

## USAGE

Require the gem:

  require 'nouvola'
  
Bundler:

  gem 'nouvola', '1.0.0'
  

## Examples

    key = '3x5mpl3str1ng'
    plan_id = 4101
    test = Nouvola::Divecloud.new(key)
    response = test.run(4101)

