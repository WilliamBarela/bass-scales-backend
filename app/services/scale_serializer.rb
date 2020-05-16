class ScaleSerializer
  def initialize(scale_object)
    @scale = scale_object
  end

  def to_serialized_json
    @scale.to_json(
      :include => {
        :feelings => {
          :except => [:created_at, :updated_at]
        }
      },
      :except => [:created_at, :updated_at]
    )
  end
end
