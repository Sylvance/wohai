# frozen_string_literal: true

module Clients
  class Client
    NET_HTTP_ERRORS = [
      Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError
    ].freeze

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

      http_call
    end

    private

    def error_for(result, error)
      OpenStruct.new(result: result, error: error)
    end

    def validation_check
      true
    end

    def http_call
      response = http.request(request)
      result = JSON.parse(response.read_body).with_indifferent_access
      OpenStruct.new(result: result, error: nil)
    rescue *NET_HTTP_ERRORS => e
      Rails.logger.error("#{e.message} #{e.backtrace}")
      OpenStruct.new(result: nil, error: e)
    end

    def http
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http
    end

    def url
      @url ||= URI("https://api.randomurl.com/resources/#{param2}/#{param1}")
    end

    def request
      Net::HTTP::Get.new(url)
    end
  end
end
