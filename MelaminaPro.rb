require File.join(__dir__, "MelaminaPro", "main")

module MelaminaPro

  unless file_loaded?(__FILE__)

    menu = UI.menu("Extensions")

    menu.add_item("Melamina Pro - Create Cabinet") {
      MelaminaPro.create_cabinet
    }

    file_loaded(__FILE__)
  end

end
