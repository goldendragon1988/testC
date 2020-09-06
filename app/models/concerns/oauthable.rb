module Oauthable
  extend ActiveSupport::Concern

  module ClassMethods
    def find_for_oauth(auth, user = nil)
      @@auth = auth
      @@user = user

      if provider = find_provider
        provider.update_attributes(token: auth.credentials[:token])
        provider.user
      else
        send auth.provider
        build_provider
        @@user.save
        @@user
      end
    end

  private
    #def facebook
      #if @@user.nil?
        #@@user = User.new(email:        @@auth.info.email,
                          #password:     Devise.friendly_token(8),
                          #first_name:   @@auth.info.name.split[0..-2].join(" "),
                          #last_name:    @@auth.info.name.split[-1])
      #end
    #end

    def google_oauth2
      if @@user.nil?
        @@user = User.new(email:        @@auth.info.email,
                          password:     Devise.friendly_token(8),
                          first_name:   @@auth.info.first_name,
                          last_name:    @@auth.info.last_name)
      end
    end


    def find_provider
      Provider.where(name: @@auth.provider, uid: @@auth.uid).first
    end

    def build_provider
      @@user.providers.build( provider_hash )
    end

    def provider_hash
      {
        name:         @@auth.provider,
        uid:          @@auth.uid,
        token:        @@auth.credentials[:token]
      }
    end

  end

  def self.included(base)
    base.send :extend, ClassMethods
  end
end

