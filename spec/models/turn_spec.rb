=begin
  Test to desribe Game spec
=end
require 'spec_helper'
describe Turn do 

  before do
  	game = Game.new
  	@turn = Turn.new(game)
  	@machine = Machine.new(game)
  end

  it "Should create a new turn" do
    turn_id = @turn.instance_variable_get("@current_turn")

    expect(turn_id.kind_of? Integer).to eq true
  end

  it "Should roll to next turn" do
  	old_turn_id = @turn.instance_variable_get("@current_turn")
  	next_turn_id = @turn.next_turn[0][0]["turn"]

  	expect(next_turn_id - old_turn_id).to eq 1
  end

  it 'Should assign jobs to machine' do
  	job = @turn.assign_jobs(@machine)
  	job_hash = JSON.parse(job)
  	key1, key2 = job_hash.has_key?("queued"),  job_hash.has_key?("running")

  	expect(key1).to eq true
  	expect(key2).to eq true
  end

end