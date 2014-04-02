require 'helper'

describe RateBeer::Client do 
  subject { described_class.new  }

  before do
    @keys = RateBeer::Configuration::VALID_CONFIG_KEYS
  end

  describe 'with module configuration' do
    before do
      RateBeer.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      RateBeer.reset
    end

    it "should inherit module configuration" do
      api = RateBeer::Client.new
      @keys.each do |key|
        expect(api.send(key)).to equal(key)
      end
    end

    describe 'with class configuration' do
      before do
        @config = {
          :api_key    => 'ak',
          :endpoint   => 'ep',
          :user_agent => 'ua',
          :method     => 'hm',
        }
      end

      it 'should override module configuration' do
        api = RateBeer::Client.new(@config)
        @keys.each do |key|
          expect(api.send(key)).to equal(@config[key])
        end
      end

      it 'should override module configuration after' do
        api = RateBeer::Client.new

        @config.each do |key, value|
          api.send("#{key}=", value)
        end

        @keys.each do |key|
          expect(api.send("#{key}")).to equal(@config[key])
        end
      end
    end
  end

  it "should include http party" do
    expect(RateBeer::Client).to include(HTTParty)
  end

  it "shold have correct base uri" do
    expect(RateBeer::Client.base_uri).to eq(RateBeer::Configuration::DEFAULT_ENDPOINT)
  end


  let(:client) { described_class.new(api_key: "secret123") }

  describe "#get_beer_by_id" do
    before do 
      stub_request(:get, "http://ratebeer.com/json/bff.asp?bd=12345&k=secret123").
         to_return(:status => 200, :body => beer_response, :headers => {})
    end

    let(:response) { client.get_beer_by_id("12345") }

    it "should return hash" do
      expect(response).to be_a(Array)
    end

    # describe "response" do 
    #   it "should return correct values" do
    #     expect(response.beer_id).to eq(12345)
    #   end
    # end
  end
end