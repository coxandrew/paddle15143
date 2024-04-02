# frozen_string_literal: true

require "rspec"
require_relative "../app/schedule"

describe Schedule do
  let(:schedule) { Schedule.new }
  let(:team_a) { 'Team A' }
  let(:team_b) { 'Team B' }
  let(:team_c) { 'Team C' }
  let(:match1) { double('Match', home_team: team_a, away_team: team_b) }
  let(:match2) { double('Match', home_team: team_b, away_team: team_a) }
  let(:match3) { double('Match', home_team: team_a, away_team: team_c) }

  before do
    schedule.matches << match1
    schedule.matches << match2
  end

  describe "#times_hosted" do
    it "returns the number of times the team has hosted a match" do
      expect(schedule.times_hosted(team_a)).to eq(2)
    end
  end

  describe '#scheduled_opponents' do
    it 'returns the teams that the specified team is scheduled to play against' do
      expect(schedule.scheduled_opponents(team_a)).to contain_exactly(team_b, team_c)
    end
  end
end
