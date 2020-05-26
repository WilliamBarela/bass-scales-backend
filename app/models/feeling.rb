class Feeling < ApplicationRecord
  belongs_to :scale

  validates :adjective,
    presence: true

  scope :count_by_scale, ->(scale, limit = 10) { 
                           find_by_sql [
                             "SELECT adjective, COUNT(*) AS count, :scale_id as SCALE_ID
                              FROM feelings
                              WHERE scale_id=:scale_id
                              GROUP BY adjective
                              ORDER BY count DESC
                              LIMIT :limit;",
                              Scale.sanitized_id_and_limit(scale, limit)
                           ] }

  # READ: https://www.postgresql.org/docs/9.6/functions-matching.html#FUNCTIONS-POSIX-TABLE
  # scope :find_author, ->(search_params) { where("first_name ~* ?", "^#{search_params[:query]}")}
end
