=begin
	This class represnets Game Model.
=end
	class Game
		include CustoraQueue

=begin
	This method is used create a game object.
=end
	  def initialize
			json_info = RestClient.post("#{HOST}/games",{}).body
			object_generator(json_info, self)
	  end

=begin
	This method is used to reload game object.
=end
		def reload
			game_id = self.instance_variable_get("@id")
			json_info = RestClient.get("#{HOST}/games/#{game_id}").body
			object_generator(json_info, self)
		end

	end
