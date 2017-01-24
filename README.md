# Nouvola Gem

This gem is  a client wrapper for  Nouvala's API.

## USAGE

Require the gem:

  require 'nouvola'
  
Bundler:

  gem 'nouvola', '1.0.0'
  

## Examples

To start a test:

    `
    key = '3x5mpl3str1ng'
    plan_id = 4101
    test = Nouvola::Divecloud.new(key)
    response = test.run(plan_id)
    `
    
To Get Test Results

    `
    key = '3x5mpl3str1ng'
    plan_id = 4101
    test = Nouvola::Divecloud.new(key)
    results = test.results(plan_id)
    `