module MelaminaPro

  def self.create_cabinet
    model = Sketchup.active_model

    model.start_operation("Melamina Pro Cabinet", true)

    entities = model.active_entities

    # Cabinet dimensions in mm
    width  = 800.mm
    height = 720.mm
    depth  = 560.mm
    board  = 18.mm

    # Create cabinet group
    group = entities.add_group
    group.name = "Melamina Cabinet"

    cabinet = group.entities

    # Left panel
    left = cabinet.add_cube(
      Geom::Point3d.new(0, 0, 0),
      board, depth, height
    )

    # Right panel
    right = cabinet.add_cube(
      Geom::Point3d.new(width - board, 0, 0),
      board, depth, height
    )

    # Bottom
    bottom = cabinet.add_cube(
      Geom::Point3d.new(board, 0, 0),
      width - board * 2, depth, board
    )

    # Top
    top = cabinet.add_cube(
      Geom::Point3d.new(board, 0, height - board),
      width - board * 2, depth, board
    )

    model.commit_operation

    UI.messagebox("Melamina Cabinet Created!")
  end

end
