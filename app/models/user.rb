class User < ApplicationRecord
validates_uniqueness_of :email	
has_secure_password

before_create :confirmation_token
attr_accessor :confirmation_token, :reset_token, :email_confirmed
before_create { generate_token(:auth_token) }





def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end


  def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
  end



  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end






  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end




private
	def confirmation_token
	      if self.confirm_token.blank?
	          self.confirm_token = SecureRandom.urlsafe_base64.to_s
	      end
    end


end
