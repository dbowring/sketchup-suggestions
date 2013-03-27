class Geom::Point3d

    def hash()
        # Ensure that hashes for equal points are unique
        # Also, equal arrays will match (to match the behaviour of ==)
        # To access the previous value this would have returned, use
        # instance.object_id
        return self.to_a.hash
    end
    
    def eql?(other)
        # Because the following is weird:
        # Geom::Point3d.new([0,1,2]).eql?(Geom::Point3d.new([0,1,2])) => false
        # And it breaks hashes, too (as for to object to be considered the same
        #  key, a.hash == b.hash && a.eql?(b) && b.eql?(a)
        return self == other
    end

    def distance_squared(other)
        # Sometimes you don't need the actual distance, just a value that
        # will sort correctly. Such, you can use this method to save yourself
        # calculating the sqrt
        return (x - other.x) ** 2 + (y - other.y) ** 2 + (z - other.z) ** 2
    end
    
    def dup
        # SketchUp currently haven't implemented #dup - and it's #clone implementation
        # is doing what #dup should be like.
        #
        # @see http://www.jonathanleighton.com/articles/2011/initialize_clone-initialize_dup-and-initialize_copy-in-ruby/
        self.new(x, y, z)
    end
    
    def clone
        # #clone should preserve the singleton class and frozen state of the cloned
        # object. (As oppose to #dup which should not.)
        # Both should copy the tainted state.
    end
end

class Array
    # The following is an example only - I'm showing it but to not suggesting
    # it be included. (personally) I'd rather lose arrays as alias' for
    # Geom::Point3d or Geom::Vector3d instances, but so long as they are so
    # this is the only way to get hashes to act "like expected"

    # alias :native_eql? :eql?
    # def eql?(other)
    #     if other.class == Geom::Vector3d || other.class == Geom::Point3d
    #         return native_eql?(other.to_a)
    #     end
    #     return native_eql?(other)
    # end
end

class Geom::Vector3d

    def hash()
        # Nothing new to note here, see Geom::Point3d#hash
        return self.to_a.hash
    end
    
    def eql?(other)
        # Nothing new to note here, see Geom::Point3d#eql?
        return self == other
    end

    def at_length(length)
        # Generally this is an anti-pattern for instance.offset(vector, length)
        # but there are cases where this is useful
        v = self.clone
        v.length = length
        return v
    end

    def length_squared()
        # Nothing new to note here, see Geom::Point3d#distance_squared
        return x ** 2 + y ** 2 + z ** 2
    end
    
    def dup
        # @see Geom::Point3d.dup
        self.new(x, y, z)
    end
    
    def clone
        # @see Geom::Point3d.dup
        # Correctly implement according to standard convention.
    end
end
