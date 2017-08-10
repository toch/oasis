# Require this file for feature tests on API
require_relative "./spec_helper"

require "rack/test"

module Rack
  module Test
    class Session
      def follow_redirect!
        unless last_response.redirect?
          raise Error, 'Last response was not a redirect. Cannot follow_redirect!'
        end
        if last_response.status == 307
          content = last_request.params.empty? ? last_request.body : last_request.params
          send(last_request.request_method.downcase.to_sym, last_response['Location'], content, 'HTTP_REFERER' => last_request.url)
        else
          get(last_response['Location'], {}, 'HTTP_REFERER' => last_request.url)
        end
      end
    end
  end
end

class MiniTest::Spec
  include Rack::Test::Methods

  def app
    Hanami.app
  end
end
