# frozen_string_literal: true

module Commands
  class {{Command}}Exception < StandardError
    def initialize(msg='This is a custom exception', exception_type='custom')
      @exception_type = exception_type
      super(msg)
    end
  end

  class {{Command}} < Command
    ERROR_LIST = [Commands::{{Command}}Exception].freeze

    attr_reader :param1, :param2

    def self.call(param1:, param2:)
      new(param1, param2).call
    end

    def initialize(param1, param2)
      @param1 = param1
      @param2 = param2
    end

    def call
      return error_for(nil, 'param1 argument is missing.') if param1.blank?
      return error_for(nil, 'param2 argument is missing.') if param2.blank?
      return error_for(nil, 'validation checks did not pass.') unless validation_check

      run_command
    end

    private

    def error_for(result, error)
      OpenStruct.new(result: result, error: error)
    end

    def validation_check
      true
    end

    def run_command
      OpenStruct.new(result: nil, error: nil)
    rescue *ERROR_LIST => e
      Rails.logger.error("#{e.message} #{e.backtrace}")
      OpenStruct.new(result: nil, error: e)
    end
  end
end
