class SketchupExtension
    def data_directory()
        # Returns a directory, unique to this author/creator and extension,
        #  that the script can write permanent data to, such as settings,
        #  configurations, ...
        # Should be in a user-specific folder - E.G., somewhere under
        #   %LOCALAPPDATA% on windows
        # See http://sketchucation.com/forums/viewtopic.php?f=180&t=52730
        #  and the resulting discussion
        raise NotImplementedError
    end
end
