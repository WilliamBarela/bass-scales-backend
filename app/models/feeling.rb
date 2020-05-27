class Feeling < ApplicationRecord
  belongs_to :scale

  validates :adjective,
    presence: true

  validate :valid_adjective_length?
  validate :adjective_single_word?
  validate :adjective_alphabetic_only?

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

  def valid_adjective_length?
    errors.add(:adjective, "must be between 3 and 20 characters.") unless self.adjective.length.between?(3,20)
  end

  def adjective_single_word?
    errors.add(:adjective, "must be a single word.") if self.adjective.include?(" ")
  end

  def adjective_alphabetic_only?
    errors.add(:adjective, "must contain only alphabetic characters.") unless self.adjective.match?(/\A[a-zA-Z]+\.?\z/)
  end

  # READ: https://www.postgresql.org/docs/9.6/functions-matching.html#FUNCTIONS-POSIX-TABLE
  # scope :find_author, ->(search_params) { where("first_name ~* ?", "^#{search_params[:query]}")}
end
