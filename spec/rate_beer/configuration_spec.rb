require 'helper'

describe 'configuration' do
  subject { RateBeer }
  
  context "default configuration" do
    RateBeer::Configuration::VALID_CONFIG_KEYS.each do |key|
      describe ".#{key}" do
        it 'should return the default value' do
          expect(subject.send(key)).to eq(RateBeer::Configuration.const_get("DEFAULT_#{key.upcase}"))
        end
      end
    end
  end

  context "custom configuration" do
   RateBeer::Configuration::VALID_CONFIG_KEYS.each do |key|
      it "should set the #{key}" do
        subject.configure do |config|
          config.send("#{key}=", key)
          expect(subject.send(key)).to equal(key)
        end
      end
    end 
  end
end
