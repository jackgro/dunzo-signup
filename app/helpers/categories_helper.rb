module CategoriesHelper

  def popover_delete_link(category)
   "<a href='#{category_path(category)}' data-method='delete' data-confirm='Are you sure? All tasks associated with this list will be deleted.' data-remote='true' rel='nofollow'> <i class='icon-trash'></i>   Delete</a>"
  end

end
