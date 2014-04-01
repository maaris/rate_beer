module RateBeer
  module Configuration
    VALID_CONNECTION_KEYS = [:endpoint, :user_agent, :method].freeze
    VALID_OPTIONS_KEYS = [:api_key].freeze
    VALID_CONFIG_KEYS = VALID_OPTIONS_KEYS + VALID_CONNECTION_KEYS

    DEFAULT_API_KEY = nil
    DEFAULT_USER_AGENT = "RateBeer API Ruby Gem #{RateBeer::VERSION}"
    DEFAULT_METHOD = :get
    DEFAULT_ENDPOINT = 'http://ratebeer.com/json'

    attr_accessor *VALID_CONFIG_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def reset
      self.api_key = DEFAULT_API_KEY
      self.user_agent = DEFAULT_USER_AGENT
      self.method = DEFAULT_METHOD
      self.endpoint = DEFAULT_ENDPOINT
    end
  end
end
