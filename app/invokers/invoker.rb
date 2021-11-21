# frozen_string_literal: true

module Invokers
  class Invoker
    # @abstract
    def call
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    # @abstract
    def on_validate=(_)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    # @abstract
    def on_start=(_)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    # @abstract
    def on_finish=(_)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
