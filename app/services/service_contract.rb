class ServiceContract < Dry::Validation::Contract
  config.messages.default_locale = :en
  config.messages.backend = :i18n
end
