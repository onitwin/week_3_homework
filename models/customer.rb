require_relative('../db/sql_runner')

class Customer

  attr_accessor :id,:name,:funds




  def initialize(db_hash)
    @id=db_hash['id'].to_i if db_hash['id']
    @name=db_hash['name']
    @funds=db_hash['funds'].to_f
  end


  #CRUD functions

  def save()# CREATE working
    sql= "INSERT INTO customers (name,funds) VALUES ($1,$2) RETURNING *" #in table 'customers' in column 'name and funds' and return everything with *
    values=[@name,@funds]
    customer=SqlRunner.run(sql,values)
    @id=customer.first['id'].to_i
  end


  def read #READ working(individual)
    sql="SELECT * FROM customers WHERE id=$1"
    values=[@id]
    result=SqlRunner.run(sql,values)
    return result
  end

  def self.read_all#READ working(group)
    sql="SELECT * FROM customers"
    result=SqlRunner.run(sql)
    return result.map{|customer|Customer.new(customer)}
  end



  def update()#UPDATE working
    sql="UPDATE customers SET (name,funds) = ($1,$2) WHERE id =$3"
    values =[@name,@funds,@id]
    SqlRunner.run(sql,values)
  end


  def delete()#DELETE works (must remove related tickets fields first)
    sql="DELETE FROM customers WHERE id= $1"
    values=[@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all#DELETE working
    sql="DELETE FROM customers"
    SqlRunner.run(sql)
  end

  # def update_funds(amount)
  #   sql="UPDATE customers SET (funds) =($1)"
  #   value=[amount]
  #   submit= SqlRunner... ect
  # end









  def self.all#working
    sql="SELECT * FROM customers"
    customer_data=SqlRunner.run(sql) #at this point customer array is an array of hashes
    customers=customer_data.map{|geezer|Customer.new(geezer)}
    return customers
  end



















end
