class ScaleSerializer
  def initialize(scale_object)
    @scale = scale_object
  end

  def to_serialized_json
    {
      :data => {
        :scale => self.slim_scale
      }
    }
  end

  def slim_scale
    JSON.parse(
      @scale.to_json(:except => [:created_at, :updated_at])
    )
  end
end
