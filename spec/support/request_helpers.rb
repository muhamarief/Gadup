module Request
  module HeadersHelpers
    def api_header(version = 1)
      request.headers['Accept'] = "application/vnd.gadup.com; version=#{version}"
    end

    def api_response_format(format = Mime::JSON)
      request.headers['Accept'] = "#{request.headers['Accept']},#{format}"
      request.headers['Content-Type'] = format.to_s
    end

    def api_authorization_header(api_key)
      request.headers['Authorization'] =  "Bearer #{api_key.access_token}"
    end

    def include_default_accept_headers
      api_header
      api_response_format
    end
  end
end
