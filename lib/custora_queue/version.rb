module CustoraQueue
  VERSION = "0.0.1"
  HOST = 'http://job-queue-dev.elasticbeanstalk.com'


	  def object_generator(json_info, this)
		  json_data = JSON.parse(json_info)
		  json_data.map{|key,val|  instance_variable_set("@#{key}", val)}
	  end
end
# this.instance_eval("@#{key} = '#{val}'")