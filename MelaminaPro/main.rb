module MelaminaPro

  def self.add_board(entities, x, y, z, width, depth, height)
    points = [
      [x, y, z],
      [x + width, y, z],
      [x + width, y + depth, z],
      [x, y + depth, z]
    ]

    face = entities.add_face(points)
    face.pushpull(height)
  end

  def self.create_cabinet
    model = Sketchup.active_model

    model.start_operation("Melamina Pro Cabinet", true)

    group = model.active_entities.add_group
    group.name = "Melamina Cabinet"

    entities = group.entities

    # Cabinet dimensions
    width  = 800.mm
    height = 720.mm
    depth  = 560.mm
    board  = 18.mm

    # Left panel
    add_board(
      entities,
      0,
      0,
      0,
      board,
      depth,
      height
    )

    # Right panel
    add_board(
      entities,
      width - board,
      0,
      0,
      board,
      depth,
      height
    )

    # Bottom
    add_board(
      entities,
      board,
      0,
      0,
      width - board * 2,
      depth,
      board
    )

    # Top
    add_board(
      entities,
      board,
      0,
      height - board,
      width - board * 2,
      depth,
      board
    )

    model.commit_operation

    UI.messagebox("Melamina Pro Cabinet Created!")
  end

end
