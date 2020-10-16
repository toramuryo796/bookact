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
      avg = (sum / num).round(1)

      if avg >=4.8
        avg = 5.0
      elsif avg >= 4.3
        avg = 4.5
      elsif avg >= 3.8
        avg = 4.0
      elsif avg >= 3.3
        avg = 3.5
      elsif avg >= 2.8
        avg = 3.0
      elsif avg >= 2.3
        avg = 2.5
      elsif avg >= 1.8
        avg = 2.0
      elsif avg >= 1.3
        avg = 1.5
      elsif avg >= 0.8
        avg = 1.0
      elsif avg >= 0.3
        avg = 0.5
      else
        avg = 0
      end

      return avg
    end
  end
end