class ScaleSerializer
  def initialize(scale_object)
    @scale = scale_object
  end

  def to_serialized_json
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
    Feeling.count_by_scale(@scale).collect do |f|
      {
        :adjective => f.adjective,
        :count => f.count
      }
    end
  end
end
