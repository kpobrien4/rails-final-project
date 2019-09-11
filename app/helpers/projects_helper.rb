module ProjectsHelper
    def render_project_errors
        if !@project.errors.empty?
          @project.errors.full_messages.each do |msg|
            msg
          end.join(" ")
        end
      end
end
