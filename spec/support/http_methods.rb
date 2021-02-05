# frozen_string_literal: true

module HTTPMethods
  module_function

  def all
    @all ||= ActionDispatch::Request::HTTP_METHODS
  end

  def update_methods
    @update_methods ||= %w[PATCH PUT]
  end

  def fetch_methods
    @fetch_methods ||= %w[GET HEAD]
  end

  def non_fetch_methods
    @non_fetch_methods ||= all.without(*fetch_methods)
  end
end
