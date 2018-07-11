# frozen_string_literal: true

module SubdomainConstraints
  NON_ACCOUNT_SUBDOMAINS = %w[admin www].freeze

  # Routing constraint
  class Account
    def self.matches?(request)
      parent.could_be_account?(request.subdomain)
    end
  end

  # Routing constraint
  class NotAccount
    def self.matches?(request)
      !parent.could_be_account?(request.subdomain)
    end
  end

  module_function

  def could_be_account?(subdomain)
    return false if subdomain.blank?

    !NON_ACCOUNT_SUBDOMAINS.include? subdomain
  end
end
