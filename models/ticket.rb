require_relative('../db/sql_runner')

class Ticket


  attr_accessor :id,:customer_id , :film_id


  def initialize(db_hash)
    @id=db_hash['id'].to_i if db_hash['id']
    @customer_id=db_hash['customer_id'].to_i
    @film_id=db_hash['film_id'].to_i
  end


  #CRUD functions


  def save# CREATE working
    sql="INSERT INTO tickets (customer_id,film_id)
    VALUES ($1,$2) Returning id"
    values=[@customer_id,@film_id]
    tickets_data=SqlRunner.run(sql,values)
    @id=tickets_data[0]['id'].to_i
  end

  def read#READ working(individual)
    sql="SELECT * FROM customers WHERE id=$1"
    values=[@id]
    result=SqlRunner.run(sql,values)
    return result
  end

  def self.read_all()#READ working(group)
    sql="SELECT * FROM tickets"
    result=SqlRunner.run(sql)
    return result.map{|ticket|Ticket.new(ticket)}
  end

  def update#UPDATE working
    sql="UPDATE tickets SET (customer_id,film_id) =($1,$2)
    WHERE id=$3"
    values=[@customer_id,@film_id,@id]
    SqlRunner.run(sql,values)
  end

  def delete#DELETE working
    sql="DELETE FROM tickets WHERE id=$1"
    values=[@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all#DELETE working
    sql="DELETE FROM tickets"
    SqlRunner.run(sql)
  end
















end
