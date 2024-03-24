module UserapiAi
  class Client
    extend UserapiAi::HTTP

    SERVICES = {
      midjourney: {
        get: [:status],
        post: [:imagine, :describe, :upscale, :upsample, :variation, :inpaint, :blend, :reroll, :zoom, :pan, :info]
      }
    }

    def initialize(access_token: nil, uri_base: nil, request_timeout: nil, service: nil, extra_headers: {})
      UserapiAi.configuration.access_token = access_token if access_token
      UserapiAi.configuration.uri_base = uri_base if uri_base
      UserapiAi.configuration.request_timeout = request_timeout if request_timeout
      UserapiAi.configuration.extra_headers = extra_headers
      UserapiAi.configuration.service = service if service

      SERVICES[service].each do |http_method, actions|
        actions.each do |action|
          method_name = action
          method_name = "#{http_method}_#{action}" if methods.include? method_name.to_sym
          define_singleton_method method_name.to_sym do |parameters|
            UserapiAi::Client.public_send("json_#{http_method}", path: action, parameters: parameters)
          end
        end
      end
      
    end
  end
end
