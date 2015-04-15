=begin
  Test to desribe Machine spec
=end
require 'spec_helper'

describe Machine do

  before do
  	game = Game.new
  	@machine = Machine.new(game)
  	@host = CustoraQueue::HOST
  end

  it "Should create new Machine" do

  	machine_id = @machine.instance_variable_get("@id")
  	expect(machine_id.kind_of? Integer).to eq true
  end

  it "Should destroy a Machine" do
  	machine_id = @machine.instance_variable_get("@id")
  	game_id = @machine.instance_variable_get("@game_id")
  	@machine.destroy

  	begin
  	  RestClient.get("#{@host}/games/#{game_id}/machines/#{machine_id}")
  	rescue Exception => e
  		expect(e.message).to eq "404 Resource Not Found"
  	end
  	
  end
	
end