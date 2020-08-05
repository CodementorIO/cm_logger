require 'sidekiq'

module CmLogger
  class SidekiqFormatter < ::Sidekiq::Logger::Formatters::Base
    def call(severity, time, program_name, message)
      log_hash = {
        time: time.utc.iso8601(3),
        pid: ::Process.pid,
        tid: tid,
        severity: severity,
        message: message,
        worker_name: extract_worker_name,
        jid: extract_jid,
        elapsed: extract_elapsed
      }.compact

      log_hash.keys.map do |key|
        "#{key}=#{sanitize(log_hash[key])}"
      end.join(" ") + "\n"
    end

    private

    def sanitize(message)
      result = message.to_s.gsub('"', '\'').gsub("\n", ' ').slice(0, 100)

      if /\s/.match?(result)
        "\"#{result}\""
      else
        result
      end
    end

    def extract_worker_name
      ctx[:class]
    end

    def extract_jid
      ctx[:jid]
    end

    def extract_elapsed
      ctx[:elapsed]
    end
  end
end
