module Help
  def self.round(price)
    # price = 12.99

    price_in_cents = price * 100

    # price_in_cents = 1299

    return price if price_in_cents % 5 ==0   # if this is divisible by 5, do nothing
    
    # 1299 + 5 - (1) / 100 = 1304
    ((price_in_cents + 5 - (price_in_cents % 5)) / 100).round(2)
  end
end

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
    Help::round(sell_price * tax_rate)
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

class Order
  def initialize(*products)
    @products = products
    @total_tax = 0
    @total_price = 0
  end

  def calculate_totals
    @products.each do |product|
      @total_tax += product.sale_tax
      @total_price += product.total_price
    end
  end 

  def print_order
    calculate_totals
    @products.each do |product|
      puts "#{product.num} #{product.name}: #{product.price}"
    end
    puts "Total taxes: #{@total_tax.round(2)}"
    puts "Total price: #{@total_price.round(2)}"
  end

end


o = OnlyImport.new(1, "imported box of chocolats", 10.50)
# puts "Sales Taxes: #{Help::round(o.sale_tax)}"
# puts "Total:#{o.total_price}"

i = Import.new(1, "imported bottle of perfume", 54.65)
# puts Help::round(i.sale_tax)
# puts i.total_price

p = Product.new(1,"perfume", 32.19)
# puts Help::round(p.sale_tax)
# puts p.total_price


n = No_tax.new(1, "book", 12.49)
# puts n.sale_tax
# puts n.total_price

order1 = Order.new(o,i,p,n)
order1.print_order
order2 = Order.new(p,n)
order2.print_order
#order1.print_totals

#order2 = Order.new(o,i)
#order2.print_totals
