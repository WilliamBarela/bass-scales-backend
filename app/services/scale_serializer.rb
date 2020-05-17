class ScaleSerializer
  def initialize(scale_object, feelings_limit)
    @scale = scale_object
    @feelings_limit = feelings_limit
  end

  def scale_feelings_json
    {
      :data => {
        :scale => self.slim_scale,
        :top_feelings => self.top_feelings
      }
    }
  end

  def slim_scale
    JSON.parse(
      @scale.to_json(:except => [:created_at, :updated_at])
    )
  end

  def top_feelings
    Feeling.count_by_scale(@scale, @feelings_limit).collect do |f|
      {
        :adjective => f.adjective,
        :count => f.count
      }
    end
  end
end
