class NatsWorker
  extend Dry::Initializer
  # include LogHelper

  class Contract < ServiceContract
    params do
      # your required fields
    end
  end

  def self.start_lisent(**args)
    contract = self::Contract.new.call(args)
    raise ServiceError::Invalidation, contract.errors.to_h if contract.failure?

    new(**args).start_lisent
  end

  def start_lisent
    raise NotImplementedError
  end
end
