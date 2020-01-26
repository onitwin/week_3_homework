require ('pry')
require_relative('./models/customer')
require_relative('./models/film')
require_relative('./models/ticket')
require_relative('./models/screening')

#dummy customer info
customer1=Customer.new({'name'=> 'Joseph','funds'=>50.50})
customer2=Customer.new({'name'=> 'Paul','funds'=>70.80})
customer3=Customer.new({'name'=> 'Michelle','funds'=>100.00})

#save customer data
customer1.save
customer2.save
customer3.save

#dummy movie info
movie1=Film.new({'title'=>'Jaws','price'=>4.50})
movie2=Film.new({'title'=>'Scott Pilgrim Versus The World','price'=>8.30})
movie3=Film.new({'title'=>'The Warriors','price'=>12.00})

#save movie data
movie1.save
movie2.save
movie3.save

#dummy ticket info
ticket1=Ticket.new({'customer_id'=>customer1.id,'film_id'=>movie1.id})
ticket2=Ticket.new({'customer_id'=>customer1.id,'film_id'=>movie2.id})
ticket3=Ticket.new({'customer_id'=>customer2.id,'film_id'=>movie1.id})
ticket4=Ticket.new({'customer_id'=>customer1.id,'film_id'=>movie3.id})
ticket5=Ticket.new({'customer_id'=>customer3.id,'film_id'=>movie3.id})
ticket6=Ticket.new({'customer_id'=>customer1.id,'film_id'=>movie3.id})


#save ticket data
ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save



#dummy screening data
screening1=Screening.new({'film_id'=>movie1.id,'showtime'=> 1700})
screening2=Screening.new({'film_id'=>movie2.id,'showtime'=> 1900})
screening3=Screening.new({'film_id'=>movie3.id,'showtime'=> 2100})
#save screening data
screening1.save
screening2.save
screening3.save










binding.pry
nil
