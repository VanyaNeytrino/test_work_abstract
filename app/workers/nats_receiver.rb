require 'nats/client'
require 'uri'

class NatsReceiver < NatsWorker
  extend Dry::Initializer
  option :nats_client, default: proc { NATS.connect('0.0.0.0:4222') }
  option :topic_name
  option :reply, optional: true
  option :reply_message, optional: true

  class Contract < ServiceContract
    params do
      required(:topic_name).filled(:str?)
      optional(:reply).filled(:bool?)
      optional(:reply_message).filled(:str?)
    end
  end

  def start_lisent
    Rails.logger.debug "start lisent bls"
    # данный код по факту не работает. Вероятно из-за ошибки в библиотеки вот тут https://github.com/nats-io/nats-pure.rb/blob/main/lib/nats/io/subscription.rb#L77
    # переменная wait_for_msgs_cond всегда nil. Хотя если вызвать у subscriber метод(attr_accessor) received, то он покажет сколько сообщений пришло
    # Пока не разобрался в чем дело=(
    nats_client.subscribe(topic_name) do |msg, reply|
      Rails.logger.debug "Received on '#{msg.subject}': '#{msg.data}' with headers: #{msg.header}"
      
    end
  end
end
