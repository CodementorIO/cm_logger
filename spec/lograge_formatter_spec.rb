require 'spec_helper'

describe 'CmLogger::LogrageFormatter' do
  describe '#call' do
    let(:formatter) do
      CmLogger::LogrageFormatter.new
    end

    it "should foramt hash" do
      data = { foo: "bar", baz: 123 }

      result = formatter.call(data)

      expect(result).to eq("foo='bar' baz=123")
    end

    it "should replace newline with \t" do
      data = { foo: "bar\n123", baz: 123 }

      result = formatter.call(data)

      expect(result).to eq("foo='bar\t123' baz=123")
    end

    it "should adjust float format" do
      data = { foo: "bar", baz: 123.45678 }

      result = formatter.call(data)

      expect(result).to eq("foo='bar' baz=123.46")
    end
  end
end