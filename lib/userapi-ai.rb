# frozen_string_literal: true
# 
require "faraday"
require "faraday/multipart"

require_relative "userapi/http"
require_relative "userapi/client"
require_relative "userapi/version"

module UserapiAi
  class Error < StandardError; end
  class ConfigurationError < Error; end

  class Configuration
    attr_writer :access_token
    attr_accessor :api_version, :extra_headers, :request_timeout, :uri_base, :service

    def initialize
      @access_token = nil
      @api_version = :v2
      @uri_base = "https://api.userapi.ai"
      @request_timeout = 120
      @service = :midjourney
    end

    def access_token
      return @access_token if @access_token

      error_text = "Userapi-Ai access token missing! See https://dashboard.userapi.ai/api-keys"
      raise ConfigurationError, error_text
    end
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= UserapiAi::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
