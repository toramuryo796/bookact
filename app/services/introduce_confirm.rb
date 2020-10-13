class IntroduceConfirm
  def self.introduce(book, user)
    book.introduces.each do |introduce|
      if introduce.user == user
        return true
      end
    end
  end
end