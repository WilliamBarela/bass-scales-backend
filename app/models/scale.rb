class Scale < ApplicationRecord
  has_many :feelings

  def self.sanitized_id_and_limit(scale, limit)
    scale_id = (scale.id.is_a? Integer) ? scale.id : 1
    limit = (limit.is_a? Integer) ? limit : 10
    {:scale_id => scale_id, :limit => limit }
  end
end
