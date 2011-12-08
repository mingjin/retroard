require 'stringio'
require 'cramp'
require 'yajl'  
require 'redis_connection'
require 'helpers/json_helper'

class WebsocketController < Cramp::Websocket
  include JSonHelper

  on_start :create_redis
  on_finish :handle_leave, :destroy_redis
  on_data :handle_data

  def create_redis
    @pub = RedisConnection.new
    @sub = RedisConnection.new
    render ({:content => "Welcome to Team Retro, improve all the time", :user => "haha"}).to_json
  end

  def handle_leave
  end

  def destroy_redis
  end

  def handle_data
  end

  private

  def subscribe
  end

  def publish message
  end

  def unsubscribe
  end

end
