require_relative('../db/sql_runner')

class Film

  attr_accessor :id,:title,:price




  def initialize(db_hash)
    @id=db_hash['id'].to_i if db_hash['id']
    @title=db_hash['title']
    @price=db_hash['price'].to_f
  end


  #CRUD functions

  def save()#CREATE working
    sql="INSERT INTO films (title,price) VALUES ($1,$2) RETURNING *"
    values=[@title,@price]
    film_data=SqlRunner.run(sql,values)
    @id=film_data.first['id'].to_i
  end


  def read#READ working (individual)
    sql="SELECT * FROM films WHERE id=$1"
    values=[@id]
    result=SqlRunner.run(sql,values)
    return result
  end

  def self.read_all
    sql="SELECT * FROM films"
    result=SqlRunner.run(sql)
    return result.map{|movie|Film.new(movie)}
  end


  def update()#UPDATE working
    sql="UPDATE films SET (title,price) = ($1, $2) WHERE id=$3"
    values=[@title,@price,@id]
    SqlRunner.run(sql,values)
  end

  def delete#DELETE working (must delete reference in ticket table first)
    sql="DELETE FROM films WHERE id=$1"
    values=[@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all#DELETE working
    sql="DELETE FROM films"
    SqlRunner.run(sql)
  end














end
