gem 'oauth'
require 'oauth/consumer'

class OauthController < ApplicationController
  def start
    redirect_to client.web_server.authorize_url(
      :redirect_uri => oauth_callback_url
    )
  end

  def callback
    access_token = client.web_server.get_access_token(
      params[:code], :redirect_uri => oauth_callback_url
    )

    user_json = access_token.get('/me')
    # in reality you would at this point store the access_token.token value as well as 
    # any user info you wanted
    render :json => user_json
  end

  protected
    def client
      @client ||= OAuth2::Consumer.new(
        'c3a5af57acfc49629f14372c8203052b', 'e38149db0f384fbf8ed63965e7fd8160', :site => 'http://api.gowalla.com'
      )
    end
end
