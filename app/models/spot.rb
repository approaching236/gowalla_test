
class Spot < ActiveResource::Base
  self.site = "http://api.gowalla.com/"
  self.user = "approaching236"
  self.password = "sillypass"
  self.format = :json
end
