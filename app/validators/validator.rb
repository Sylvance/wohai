# frozen_string_literal: true

module Validators
  class Validator
    # @abstract
    def call
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
