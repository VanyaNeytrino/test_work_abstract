class Service
  extend Dry::Initializer
  # include LogHelper

  class Contract < ServiceContract
    params do
      # your required fields
    end
  end

  def self.call(**args)
    contract = self::Contract.new.call(args)
    raise ServiceError::Invalidation, contract.errors.to_h if contract.failure?

    new(**args).call
  end

  def call
    raise NotImplementedError
  end
end
