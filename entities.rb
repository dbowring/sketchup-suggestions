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
    def edges(&block)
        # Block can (optionally) be given and passed to the grep function,
        # which will then behave like map. i,e.,
        # entities.edges() {|edge| edge.length} #  -> array of all edge lengths
        return self.grep(Sketchup::Edge, &block)
    end

    def faces(&block)
        return self.grep(Sketchup::Face, &block)
    end

    def groups(&block)
        return self.grep(Sketchup::Group, &block)
    end

    def component_instances(&block)
        return self.grep(Sketchup::ComponentInstance, &block)
    end

    def images(&block)
        return self.grep(Sketchup::Image, &block)
    end

    def section_planes(&block)
        return self.grep(Sketchup::SectionPlane, &block)
    end
end
