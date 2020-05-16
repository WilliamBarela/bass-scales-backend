class Feeling < ApplicationRecord
  belongs_to :scale

  scope :count_by_scale, ->(scale) { find_by_sql ["SELECT adjective, COUNT(*) AS count, :scale_id as SCALE_ID FROM feelings WHERE scale_id=:scale_id GROUP BY adjective ORDER BY count DESC;", {:scale_id => (scale.id.is_a? Integer) ? scale.id : 1}] }
 
  # READ: https://www.postgresql.org/docs/9.6/functions-matching.html#FUNCTIONS-POSIX-TABLE
  # scope :find_author, ->(search_params) { where("first_name ~* ?", "^#{search_params[:query]}")}
end
