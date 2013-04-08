class Sketchup::Model
    def erase_entities(entities)
        # Because I've heard about (but not experienced) crashes relating
        # to using this on something other than the active entities
        # group.model.erase_entities(list_of_ents_or_single_ent)
        self.active_entities.erase_entities(entities)
    end
end

def Sketchup.erase_entities(entities)
    # Don't have to worry about what model you're working on
    return unless entities && entities[0]
    entities[0].model.erase_entities(entities)
end


class Sketchup::Entities
    def edges()
        return self.find_all() {|e|
            e.class == Sketchup::Edge
        }
    end

    def faces()
        return self.find_all() {|e|
            e.class == Sketchup::Face
        }
    end

    def groups()
        return self.find_all() {|e|
            e.class == Sketchup::Group
        }
    end

    def component_instances()
        return self.find_all() {|e|
            e.class == Sketchup::ComponentInstance
        }
    end

    def images()
        return self.find_all() {|e|
            # Note
            e.class == Sketchup::Image
        }
    end

    def section_planes()
        # Not currently possible with the API
        # return self.find_all() {|e|
        #     e.class == Sketchup::SectionPlane
        # }
    end
end
