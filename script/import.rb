#!/usr/bin/env ruby

require 'csv'

require ::File.expand_path('../../config/environment', __FILE__)

SALUTATION = 1
FIRST = 2
LAST = 3
STREET = 4
APT = 5
CITY = 6
STATE = 7
ZIP = 8

STDERR.puts 'destroying things'
[
  Contact,
  Event,
  ContactsEvent,
].map(&:destroy_all)

events = Event.create!([
  {
    name: 'Christmas Card, 2015',
    description: 'Emily and Jack send a Christmas card!',
  },{
    name: 'Wedding',
    description: 'Emily and Jack get married!',
  }
])

STDERR.puts 'reading csv'
addresses = CSV.read('./addresses.csv')

STDERR.puts 'unshifting headers'
STDERR.puts Hash[addresses.shift.each_with_index.to_a].invert


STDERR.puts 'loading contacts'
addresses.each do |addr|
  Contact.create!({
    salutation: addr[SALUTATION],
    first_name: addr[FIRST],
    last_name: addr[LAST],
    street: addr[STREET],
    apt: addr[APT],
    city: addr[CITY],
    state: addr[STATE],
    zip: addr[ZIP],
    events: events,
  })
end; nil

