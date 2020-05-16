class ScaleSerializer
  def initialize(scale_object)
    @scale = scale_object
  end

  def to_serialized_json
    {
      data: {
       scale: {
         id: @scale.id,
         root: @scale.root,
         mode: @scale.mode
       },
       feelings: @scale.feelings.collect do |f|
         {
           id: f.id,
           adjective: f.adjective,
           scale_id: f.scale_id
         }
       end
     }
    }
  end
end
