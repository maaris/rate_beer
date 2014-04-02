require 'uri'

module RateBeer
  class Client
    include HTTParty

    SORT_OPTIONS = {
      latest: 1,
      top_raters: 2,
      highest_ratings: 3
    }.freeze

    DEFAULT_OPTIONS = {
      page: 1,
      sort_by: SORT_OPTIONS[:latest]
    }.freeze

    base_uri Configuration::DEFAULT_ENDPOINT

    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options = {})
      merged_options = RateBeer.options.merge(options)

      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end

    def beer_info_by_id(beer_id)
      response = self.class.get("/bff.asp?bd=#{beer_id}&k=#{api_key}")
      parsed_response(response)
    end

    def beer_info_by_name(beer_name)
      beer_name = URI.escape(beer_name)
      response = self.class.get("/bff.asp?bn=#{beer_name}&k=#{api_key}&vg=1&rc=1")
      parsed_response(response)
    end

    def beer_reviews(beer_id, options = {})
      options = merge_with_default_options(options)
      response = self.class.get("/gr.asp?bid=#{beer_id}&s=#{options[:sort_by]}&p=#{options[:page]}&k=#{api_key}")
      parsed_response(response)
    end

    private

    def merge_with_default_options(options)
      DEFAULT_OPTIONS.merge(options)
    end

    def parsed_response(response)
      parsed_array = JSON.parse(response.body)
      parsed_array.each_with_index do |hash, index|
        hash = hash_with_transformed_keys(hash)
        hash = transformed_to_mash(hash)
        parsed_array[index] = hash
      end
      parsed_array
    end

    def hash_with_transformed_keys(hash)
      hash.inject({}){|memo,(k,v)| memo[k.underscore] = v; memo}
    end

    def transformed_to_mash(hash)
      Hashie::Mash.new(hash)
    end
  end
end
