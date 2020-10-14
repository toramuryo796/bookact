class StarRate
  def self.rate(book)
    introduces = book.introduces
    if introduces.present?
      array = []
      sum = 0
      introduces.each do |introduce|
        array << introduce.title
        sum += introduce.star.name
      end
      num = array.length
      return avg = sum / num
    end
  end
end