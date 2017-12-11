class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :order_asc, ->{ order(id: :asc) }
  scope :order_desc, ->{ order(id: :desc) }
end
