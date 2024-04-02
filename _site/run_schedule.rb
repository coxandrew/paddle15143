#!/usr/bin/env ruby

require "./schedule"

teams = [
  "Haymakers",
  "Beaver Street Bullies",
  "Duncan's Donuts",
  "Cox Slashers",
  "Tri-Borough Deuces",
  "Party All The Time"
]
locations = {
  "Haymakers" => "Edgeworth Club",
  "Beaver Street Bullies" => "Allegheny Country Club",
  "Duncan's Donuts" => "Sewickley YMCA",
  "Cox Slashers" => "Edgeworth Club",
  "Tri-Borough Deuces" => "Allegheny Country Club",
  "Party All The Time" => "Sewickley YMCA"
}

schedule = Scheduler.new(teams, locations, 7)
schedule.generate
schedule.display
