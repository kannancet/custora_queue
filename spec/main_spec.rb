=begin
  Test to desribe Main spec
=end
require "spec_helper"

describe CustoraQueue::GameReactor do 

  before do
  	@game_reacor = CustoraQueue::GameReactor.new
  end

  it "Should initialize the reactor" do
  	game = @game_reacor.instance_variable_get("@game")
  	machine = @game_reacor.instance_variable_get("@machine")
  	
  	expect(game.kind_of? Game).to eq true
  	expect(machine.kind_of? Machine).to eq true
  end

  it "Should run the reactor" do
  	thread = Thread.new do
	  @game_reacor.run
	end	

	while thread.alive?
	  expect(thread.alive? != nil)
	  thread.kill
	end
    
  end
end