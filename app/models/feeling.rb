class Feeling < ApplicationRecord
  belongs_to :scale

  # FIXME: https://www.w3resource.com/sql/aggregate-functions/count-with-group-by.php
  scope :count_by_scale_id, ->(scale_id) { find_by_sql ["SELECT adjective, COUNT(*) AS fcount, :scale_id as SCALE_ID FROM feelings WHERE scale_id=:scale_id GROUP BY adjective ORDER BY fcount DESC;", {:scale_id => scale_id}] }

  # READ: https://www.postgresql.org/docs/9.6/functions-matching.html#FUNCTIONS-POSIX-TABLE
  # scope :find_author, ->(search_params) { where("first_name ~* ?", "^#{search_params[:query]}")}


  # replaced by scope method :most_stories
  # def self.most_stories
  #   Author
  #     .left_joins(:stories)
  #     .group("authors.id")
  #     .order("COUNT(stories.author_id) DESC")
  # end
end
