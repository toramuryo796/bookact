class SearchBooks 
  def self.search(search)
    if search != ""
      Book.where("title LIKE(?)", "%#{search}%")
    else
      redirect_to root_path
    end
  end
end