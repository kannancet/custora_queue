require_relative "custora_queue/common"
require_relative "custora_queue/version"
require_relative "custora_queue/main2"
require_relative "custora_queue/models/game"
require_relative "custora_queue/models/machine"
require_relative "custora_queue/models/turn"

require 'json'
require 'rest-client'
require 'dish/ext'

module CustoraQueue
  
  @game_reactor = GameReactor.new
  @game_reactor.run

end
