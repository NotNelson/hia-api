# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# People
people = Person.create([
    { last_name: 'Hernandez Casanova', names: 'Nelson', birth_date: '1987-03-29'},
    { last_name: 'Goss', names: 'Errol', birth_date: '1971-01-14'},
    { last_name: 'Busbridge', names: 'Nicola', birth_date: '1960-05-20'},
    { last_name: 'Salumbides', names: 'Ayliana', birth_date: '1998-02-11'},
    { last_name: 'Shepherd', names: 'Sarah', birth_date: '1985-07-09'},
    { last_name: 'King', names: 'Robert', birth_date: '1954-04-04'}
                       ])
# Customers
customers = Customer.create([
    { person_id: 1, weight: 80, passport_no: '181571144', passport_expiry: '2030-03-29' },
    { person_id: 2, weight: 75, passport_no: '526653423', passport_expiry: '2025-01-01' },
    { person_id: 3, weight: 85, passport_no: '529998432', passport_expiry: '2021-12-25' }
                            ])

destinations = Destination.create([
    { name: 'Outer Hebriedes' },
    { name: 'Orkney' },
    { name: 'Shetland Islands' }
                                  ])

aircraft_types = AircraftType.create([
    { name: 'Twin Otter' },
    { name: 'Saab 340' }
                                     ])
aircraft = Aircraft.create([
    { name: 'A45', year: '2012', aircraft_type_id: 1 },
    { name: 'A46', year: '2012', aircraft_type_id: 1 },
    { name: 'B16', year: '2010', aircraft_type_id: 2 }
                           ])

routes = Route.create([
    { origin: 1, destination: 2, fare: 90.5 },
    { origin: 2, destination: 1, fare: 90.5 },
    { origin: 1, destination: 3, fare: 90.5 },
    { origin: 3, destination: 1, fare: 90.5 },
    { origin: 2, destination: 3, fare: 120.2 },
    { origin: 3, destination: 2, fare: 120.2 }
                      ])

flights = Flight.create([
    { aircraft_id: 1, route_id: 1 },
    { aircraft_id: 2, route_id: 2 },
    { aircraft_id: 2, route_id: 2 },
    { aircraft_id: 3, route_id: 4 },
    { aircraft_id: 1, route_id: 5 }
                        ])

employee = Employee.create([
    { person_id: 4, section: 'Pilot', is_active: true },
    { person_id: 5, section: 'Maintenance', is_active: true },
    { person_id: 6, section: 'Maintenance', is_active: true }
                           ])

maintenance = Maintenance.create([
    { employee_id: 2, aircraft_id: 1, date_scheduled: '2020-04-29', comments: 'To be confirmed' },
    { employee_id: 3, aircraft_id: 2, date_scheduled: '2020-04-30', comments: 'To be confirmed' }
                                 ])

rota = Rotum.create([
    { employee_id: 1, shift_date: '2020-04-01', time_start: '08:00', time_end: '18:00' },
    { employee_id: 1, shift_date: '2020-04-02', time_start: '08:00', time_end: '18:00' },
    { employee_id: 2, shift_date: '2020-04-01', time_start: '08:00', time_end: '16:30' },
    { employee_id: 3, shift_date: '2020-04-01', time_start: '08:00', time_end: '16:30' },
    { employee_id: 1, shift_date: '2020-04-03', time_start: '08:00', time_end: '18:00' }
                    ])

booking = Booking.create([
    { flight_id: 1, customer_id: 1, date_created: '2020-03-20', is_confirmed: true, is_cancelled: false },
    { flight_id: 2, customer_id: 3, date_created: '2020-03-25', is_confirmed: false, is_cancelled: false }
                         ])

passengers = Passenger.create([
    { customer_id: 1, booking_id: 1},
    { customer_id: 2, booking_id: 1},
    { customer_id: 3, booking_id: 2}
                              ])