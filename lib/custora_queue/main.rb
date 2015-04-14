=begin
  This is the main module.
=end
module CustoraQueue

=begin
  The class to deal with game processing.
=end
  class GameReactor

    attr_accessor :game, :machine

=begin
  This function is used to initialize the game processing.
=end
    def initialize
      @game = Game.new
      @machine = Machine.new(game)
    end

=begin
  This function is used to run the gane reactor.
=end
    def run
      @turn = Turn.new(game)
      while @turn.instance_variable_get("@status") != 'completed'

        jobs_found = @turn.instance_variable_get("@jobs").size
        print_turn_text(jobs_found)

       if (@turn.instance_variable_get("@current_turn") % 25) == 0
        @machine.destroy
       end
        
        @turn.assign_jobs(machine)    
        @turn.next_turn
      end

      @game = @game.reload
      print_game_text(@game)
    end   

  end

end