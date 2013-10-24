class Product
  attr_accessor :name, :price, :num

  def initialize(num, name, price)
    @num = num
    @name = name
    @price = price
  end


  def tax_rate
    0.1
  end

  def sale_tax
    (sell_price * tax_rate).round(2)
  end

  def sell_price
    price * num
  end

  def total_price
    (sale_tax + sell_price).round(2)
  end
end

class No_tax < Product
  def tax_rate
    0
  end
end

class Import < Product
  def tax_rate
    super + 0.5
  end
end

class OnlyImport < Product
  def tax_rate
    0.5
  end
end



o = OnlyImport.new(1, "pill", 19.8)
puts o.sale_tax
puts o.total_price

i = Import.new(1, "chocolate", 21)
puts i.sale_tax
puts i.total_price

p = Product.new(1,"computer", 12.3)
puts p.sale_tax
puts p.total_price


n = No_tax.new(2, "books", 1.23)
puts n.sale_tax
puts n.total_price

