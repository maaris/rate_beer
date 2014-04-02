module RateBeer
  module Configuration
    VALID_CONNECTION_KEYS = [:endpoint, :user_agent].freeze
    VALID_OPTIONS_KEYS = [:api_key].freeze
    VALID_CONFIG_KEYS = VALID_OPTIONS_KEYS + VALID_CONNECTION_KEYS

    DEFAULT_API_KEY = nil
    DEFAULT_USER_AGENT = "RateBeer API Ruby Gem #{RateBeer::VERSION}"
    DEFAULT_ENDPOINT = 'http://ratebeer.com/json'

    attr_accessor *VALID_CONFIG_KEYS

    def self.extended(base)
      base.reset
    end

    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

    def configure
      yield self
    end

    def reset
      self.api_key = DEFAULT_API_KEY
      self.user_agent = DEFAULT_USER_AGENT
      self.endpoint = DEFAULT_ENDPOINT
    end
  end
end
