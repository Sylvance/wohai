# frozen_string_literal: true

module Commands
  class Command
    # @abstract
    def call
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
