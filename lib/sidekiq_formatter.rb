require 'logger'
require 'time'

module CmLogger
  class SidekiqFormatter < Logger::Formatter
    def call(severity, time, program_name, message)
      clean_message = message.gsub('"', '\'').gsub("\n", ' ').slice(0, 100)

      log_hash = {
        time: time.utc.iso8601(3),
        pid: ::Process.pid,
        tid: Thread.current.object_id.to_s(36),
        severity: severity,
        message: "\"#{clean_message}\""
      }.merge(context)

      log_hash.keys.map do |key|
        "#{key}=#{log_hash[key]}"
      end.join(" ") + "\n"
    end

    def context
      c = Thread.current[:sidekiq_context]
      if c && c.any?
        tokens = c.map(&:split).flatten
        worker_name = tokens.find { |token| token.end_with?('Worker') }
        jid = tokens.find { |token| token.start_with?('JID') }

        {
          worker_name: worker_name,
          jid: jid
        }.compact
      else
        {}
      end
    end
  end
end