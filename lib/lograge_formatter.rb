module CmLogger
  class LogrageFormatter
    def call(data)
      fields_to_display(data)
        .map { |key| format(key, data[key]) }
        .join(' ')
    end

    protected

    def fields_to_display(data)
      data.keys
    end

    def format(key, value)
      "#{key}=#{parse_value(key, value)}"
    end

    def parse_value(key, value)
      if value.is_a? Float
        Kernel.format('%.2f', value)
      elsif value.is_a? String
        safe_value = value.gsub("\n", "\t")
        "'#{safe_value}'"
      else
        value
      end
    end
  end
end