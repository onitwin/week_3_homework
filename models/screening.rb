require_relative('../db/sql_runner')

class Screening

  attr_accessor :id,:showtime,:tickets_sold



  def initialize(options)
    @id=options['id'].to_i if options['id']
    @film_id=options['film_id'].to_i
    @showtime=options['showtime']
    @tickets_sold=0
  end



  def save() #CREATE working
    sql="INSERT INTO screenings (film_id,showtime,tickets_sold) VALUES ($1,$2,$3) RETURNING *"
    values=[@film_id,@showtime,@tickets_sold]
    times=SqlRunner.run(sql,values)
    @id=times.first['id'].to_i
  end

  def update #UPDATE working
    sql="UPDATE screenings SET (film_id,showtime,tickets_sold)=($1,$2,$3)
    WHERE id=$4"
    values=[@film_id,@showtime,@tickets_sold,@id]
    SqlRunner.run(sql,values)
  end

  def read #READ working
    sql="SELECT * FROM customers WHERE id=$1"
    values=[@id]
    result=SqlRunner.run(sql,values)
    return result
  end


  def delete #DELETE working
    sql="DELETE FROM screenings WHERE id =$1"
    values=[@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all #DELETE all working
    sql="DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def self.top_selling
    sql="SELECT * FROM screenings"
    result=SqlRunner.run(sql)
    return result.map{|show|Screening.new(show)}
  end


























end
