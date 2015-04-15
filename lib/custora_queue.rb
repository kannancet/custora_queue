require_relative 'dependencies'

=begin
	This is the base module.
=end
module CustoraQueue

  begin  
    @game_reactor = GameReactor.new
    @game_reactor.run
  rescue Exception => e
    expect(e.message).to eq "404 Resource Not Found"
  end

end
