require ('pry')
require_relative('./models/customer')
require_relative('./models/film')
require_relative('./models/ticket')

#dummy customer info
customer1=Customer.new({'name'=> 'Joseph','funds'=>10.50})
customer2=Customer.new({'name'=> 'Paul','funds'=>17.80})

#save customer data
customer1.save
customer2.save

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


#save ticket data
ticket1.save
ticket2.save
ticket3.save
ticket4.save



# customer1.funds =100.30
# customer1.name="Deirde"
# customer1.update()










binding.pry
nil
