module UI
    def self.select_folder(title=nil, initial=nil)
        # TODO: default title to localised string
        if initial.nil? || !File.directory?(initial)
            initial = Sketchup.find_support_file('')
        end
        # Show UI element to select folder
        raise NotImplementedError
    end
end
