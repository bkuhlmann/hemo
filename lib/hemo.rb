# frozen_string_literal: true

# A collection of ancillary utilities.
module Hemo
  def self.htmxify(**attributes)
    updates = attributes.dup
    htmx = (updates.delete(:hx) || {}).transform_keys! { |key| "hx-#{key}" }
    updates.merge! htmx
  end
end
