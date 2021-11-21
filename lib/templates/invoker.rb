# frozen_string_literal: true

module Invokers
  class {{Invoker}} < Invoker
    attr_reader :rule1, :rule2

    def self.call(rule1:, rule2:)
      new(rule1, rule2).call
    end

    def initialize(rule1, rule2)
      @rule1 = rule1
      @rule2 = rule2
    end

    def call
      return error_for(nil, 'rule1 argument is missing.') if rule1.blank?
      return error_for(nil, 'rule2 argument is missing.') if rule2.blank?
      return error_for(nil, 'validation checks did not pass.') unless validation_check

      run_commands
    end

    def on_validate=(validator)
      @on_validate = validator
    end

    def on_start=(command)
      @on_start = command
    end

    def on_finish=(callback)
      @on_finish = callback
    end

    private

    def error_for(result, error)
      OpenStruct.new(result: result, error: error)
    end

    def validation_check
      true
    end

    def run_commands
      @on_validate.call if @on_validate.is_a? Validator
      @on_start.call if @on_start.is_a? Command
      @on_finish.call if @on_finish.is_a? Callback
    end
  end
end
