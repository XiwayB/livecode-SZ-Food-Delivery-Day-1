class BaseController
    def initialize(repo, child_view)
        @repo = repo
        @view = child_view.new
    end

    def list
        elements = @repo.all
        @view.display(elements)
    end

    def destroy
      list
      element_index = @view.ask_user_for("number").to_i - 1
      element_id = @repo.all[element_index].id
      element = @repo.find(element_id)
      @repo.remove(element)
      list
    end
end
