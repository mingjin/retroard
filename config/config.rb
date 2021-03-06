require 'rubygems'
require 'bundler/setup'
require 'mongo_mapper'

module RbConfig

  def self.setup
    setup_mongomapper
    # More application setup can go here...
  end

  def self.setup_mongomapper
    MongoMapper.connection = new_mongo_connection
    MongoMapper.database = environment_config['mongo_database']
  end

  def self.new_mongo_connection
    length = environment_config["mongo_host"].length
    if length == 1
      host = environment_config["mongo_host"][0]
      Mongo::Connection.new(host['hostname'], host['port'])
    else
      hosts = Array.new length
      (0...length).each do |index|
        host = environment_config["mongo_host"][index]
        hosts[index] = "#{host['name']}:#{host['port']}"
      end
      puts hosts
      Mongo::ReplSetConnection.new(hosts)
    end
  end

  def self.drop_database
    database_name = environment_config["mongo_database"]
    new_mongo_connection.drop_database(database_name)
    database_name
  end

  def self.environment_config
    env_config = config[environment]
    unless env_config
      raise "Environment config not found for #{environment.inspect}"
    end
    env_config
  end

  def self.environment
    if @environment
      @environment
    else
      @environment = if Object.const_defined?("Sinatra")
        Sinatra::Base.environment.to_s
      else
        ENV['RACK_ENV'] || 'development'
      end
    end
  end

  def self.environment=(env)
    @environment = env
  end

  def self.environments
    config.keys
  end

  def self.config
    if @config
      @config
    else
      file = File.join(File.dirname(__FILE__), "config.yml")
      @config = YAML.load_file(file)
    end
  end

end