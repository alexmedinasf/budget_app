# frozen_string_literal: true

# This is the base model class that all other model classes will inherit from.
# It is used to share common configurations and methods across all models.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
