# frozen_string_literal: true

require "rspec"
require_relative "../app/scheduler.rb"

# rubocop:disable Style/StringLiterals
describe Scheduler do
  before(:each) do
    @teams = [
      Team.new("ACC 1", "Allegheny Country Club"),
      Team.new("ACC 2", "Allegheny Country Club"),
      Team.new("EC 1", "Edgeworth Club"),
      Team.new("EC 2", "Edgeworth Club"),
      Team.new("YMCA 1", "Sewickley YMCA"),
      Team.new("YMCA 2", "Sewickley YMCA")
    ]
    @match_weeks = 6
    @scheduler = Scheduler.new(@teams, @match_weeks)
    @scheduler.generate
  end

  it "generates a schedule" do
    expect(@scheduler.instance_variable_get(:@schedule)).not_to be_empty
  end

  it "gets unique locations from teams" do
    expect(@scheduler.locations.uniq.size).to eq(3)
  end

  fit "gets unique opponents for a given team" do
    @teams.each do |team|
      opponents = @schedule.opponents_for(team)
      binding.pry
    end
  end

  fit "ensures each team plays each other team at least once in a 7 week season" do
    @teams.each do |team|
      opponents = @scheduler.opponents_for(team)
      expect(opponents.uniq.size).to be >= (@teams.size - 1)
    end
  end

  it "ensures each team plays each other team at least once in a 7 week season" do

    @teams.each do |team|
      opponents = schedule.flatten(1).select { |match| match.include?(team) }.map { |match| match.reject { |t| t == team } }.flatten
      puts "Team: #{team}"
      expect(opponents.uniq.size).to be >= (@teams.size - 1)
    end
  end

  it "ensures each match is at a unique location" do
    @schedule.instance_variable_get(:@schedule).each do |week_matches|
      locations = week_matches.map { |match| @locations[match[0]] }
      expect(locations.uniq.size).to eq(locations.size)
    end
  end

  it "ensures no team plays itself" do
    @schedule.instance_variable_get(:@schedule).each do |week_matches|
      week_matches.each do |match|
        expect(match[0]).not_to eq(match[1])
      end
    end
  end

  it "ensures the season is 7 weeks long" do
    expect(@schedule.instance_variable_get(:@schedule).size).to eq(7)
  end
end
# rubocop:enable Style/StringLiterals
