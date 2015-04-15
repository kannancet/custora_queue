=begin
  Test to desribe Game spec
=end
require 'spec_helper'
describe Game do 

  before do
  	@game = Game.new
  	@game_id = @game.instance_variable_get("@id")
  end

  it "Should create a new Game" do

  	expect(@game_id.kind_of? Integer).to eq true
  end

  it "Should reload current Game" do

  	@game_reloaded = @game.reload
  	new_game_id = @game_reloaded[0]
    
  	expect(new_game_id).to eq @game_id
  end

end