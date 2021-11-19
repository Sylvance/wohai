# frozen_string_literal: true

module Invokers
  class InvokerException < StandardError
    def initialize(msg='This is a custom exception', exception_type='custom')
      @exception_type = exception_type
      super(msg)
    end
  end

  class Invoker
    ERROR_LIST = [Invokers::InvokerException].freeze

    attr_reader :param1, :param2

    def self.call(param1:, param2:)
      new(param1, param2).call
    end

    def before_start=(validator)
      @before_start = validator
    end

    def on_start=(command)
      @on_start = command
    end

    def after_start=(validator)
      @after_start = validator
    end

    def before_finish=(validator)
      @before_finish = validator
    end

    def on_finish=(command)
      @on_finish = command
    end

    def after_finish=(callback)
      @after_finish = callback
    end

    def initialize(param1, param2)
      @param1 = param1
      @param2 = param2
    end

    def call
      return error_for(nil, 'param1 argument is missing.') if param1.blank?
      return error_for(nil, 'param2 argument is missing.') if param2.blank?
      return error_for(nil, 'validation checks did not pass.') unless validation_check

      run_commands
    end

    private

    def error_for(result, error)
      OpenStruct.new(result: result, error: error)
    end

    def validation_check
      true
    end

    def run_commands
      @before_start.call if @before_start.is_a? Validator
      @on_start.call if @on_start.is_a? Command
      @after_start.call if @after_start.is_a? Command
      @before_finish.call if @before_finish.is_a? Validator
      @on_finish.call if @on_finish.is_a? Command
      @after_finish.call if @after_finish.is_a? Callback
    end
  end
end
