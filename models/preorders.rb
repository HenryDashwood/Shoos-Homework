require ('pg')
class Preorder

  attr_reader :first_name, :last_name, :size, :quantity

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @size = options['size'].to_i
    @quantity = options['quantity'].to_i
  end

  def full_name
    @full_order = @first_name + " " + @last_name
  end

  def full_order
    @full_order = @first_name + " " + @last_name + " " + @size.to_s + " " + @quantity.to_s
  end

  def save
    sql = "INSERT INTO preorders (first_name, last_name, size, quantity) VALUES ('#{@first_name}' '#{@last_name}', #{@size}, #{@quantity});"
    return Shoe.map_item(sql)
  end

  def self.all 
    db = PG.connect({dbname: 'shoos', host: 'localhost'})
    sql = "SELECT * FROM preorders"
    preorders = db.exec(sql)
    result = preorders.map {|preorder| Preorder.new(preorder)}
    db.close
    return result
  end

  def self.map_items(sql)
    shoes = SqlRunner.run(sql)
    result = Shoe.map_items(sql)
  end

  def self.map_item(sql)
    result = Shoe.map_items(sql)
    return result.first
  end

end