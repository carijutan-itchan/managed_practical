#  Rent Payment Schedules

## Goal description
Build a Ruby class that processes rent payment schedules, handles rent changes over time, 
and incorporates different payment methods with varying processing times. 

## About the application
The application has the following:
- Unit testing using rspec
- Validations
- I used Strategy Pattern to implement the payment calculation
- Response is in Array of Objects format

## Instruction
1. Fork this repository
2. Clone the forked repository
3. Go to the root directory of the cloned repository
4. Go to rails console and do the possible scenarios

```ruby
# SCENARIO 1

rent = { 
  rent_amount: 1000, 
  rent_frequency: "monthly", 
  rent_start_date: "2024-01-01", 
  rent_end_date: "2024-04-01" 
} 

# Call the RentPaymentService class to process the rent payment
rent_payment_service = RentPaymentService.new(rent)
rent_payment_service.execute

#--------------- END OF SCENARIO 1 --------------------

# SCENARIO 2

rent = { 
  rent_amount: 1000, 
  rent_frequency: "monthly", 
  rent_start_date: "2024-01-01", 
  rent_end_date: "2024-04-01" 
}

rent_changes = {
  rent_amount: 1300,
  effective_date: "2024-02-01"
}

# Call the RentPaymentService class to process the rent payment
rent_payment_service = RentPaymentService.new(rent, rent_changes)
rent_payment_service.execute

#--------------- END OF SCENARIO 2 --------------------

# SCENARIO 3

rent = { 
  rent_amount: 1000, 
  rent_frequency: "monthly", 
  rent_start_date: "2024-01-01", 
  rent_end_date: "2024-04-01",
  payment_method: "bank_transfer"
} 

# Call the RentPaymentService class to process the rent payment
rent_payment_service = RentPaymentService.new(rent)
rent_payment_service.execute

#--------------- END OF SCENARIO 3 --------------------

```

