class Admin < ApplicationRecord
self.primary_key = "id"	
has_secure_password
end
