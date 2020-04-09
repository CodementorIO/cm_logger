require 'spec_helper'

describe 'CmLogger::SidekiqFormatter' do
  describe '#call(severity, time, program_name, message)' do
    let(:formatter) do
      CmLogger::SidekiqFormatter.new
    end
    let(:severity) { "INFO" }
    let(:message) { "xxx" }
    let(:time) { Time.now }
    let(:program_name) { "program_name" }

    it "should return log in logfmt style" do
      args = [severity, time, program_name, message]

      result = formatter.call(*args)

      tid = Thread.current.object_id.to_s(36)
      pid = ::Process.pid
      expect(result).to eq("time=#{time.utc.iso8601(3)} pid=#{pid} tid=#{tid} severity=#{severity} message=\"#{message}\"\n")
    end
  end
end