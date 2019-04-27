ROCKET ELEVATORS WEEK 11
TDD
COMMANDS bundle exec rspec
here are the test path

test for api
streamer.rb (lib/elevatorMedia/streamer.rb)
streamer_spec (spec/lib/elevatorMedia/streamer_spec.rb)

test for controller
leads_spec.rb (spec/controllers/leads_spec.rb)
quotes_spec.rb (spec/controllers/quotes_spec.rb)

![](http://rocketelevator.ca/assets/R2-3c6296bf2343b849b947f8ccfce0de61dd34ba7f9e2a23a53d0a743bc4604e3c.png)

This repository contain the Ruby on Rails with MySQL Web framework for the Rocket Elevator Digital Presence Plan.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

- **Step 1:** When first installing the repo, you'll need to add in the main directory a file named: appsettings.json that will contains the information of the MySQL database you'll be using.

- **Step 2:** Once this is done you'll need to run the following command in your terminal/console:

```
cd /"installation folder"
bundle install
sudo service mysql start
rake db:create
rake db:migrate
rake db:seed
```

- **Step 3:** Now you can test it on your local machine by going to http://localhost:5001

- **Step 4:** Once you are there, you can use any API request you want in the following list.

## List of API Requests

This a list of the API requests you can use for Rocket Elevators

```
For elevators:
GET https://rocketelevatorapi20190405103718.azurewebsites.net/api/elevator - Return a list of all the elevators
GET https://rocketelevatorapi20190405103718.azurewebsites.net/api/elevator/"id" - Return the information about a specific elevator, research by elevator id
PUT https://rocketelevatorapi20190405103718.azurewebsites.net/api/elevator/"id" - Once in there you need to send the result of a GET by Id request, Ctrl-C, Ctrl-V in JSON format, then change the status with an available status.
Exemple:
{
    "id": 1,
    "column_id": 0,
    "status": "Inactive"
}

Modify it to:
{
    "id": 1,
    "column_id": 0,
    "status": "Active"
}

And then send the PUT request.

For Batteries:
GET https://rocketelevatorapi20190405103718.azurewebsites.net/api/battery - Return a list of all the batteries
GET https://rocketelevatorapi20190405103718.azurewebsites.net/api/battery/"id" - Return the information about a specific batteries
PUT https://rocketelevatorapi20190405103718.azurewebsites.net/api/battery/"id" - To do a put request you need to send a JSON querry with a modified status. Like the example above. Except with battery informations, so just to be clear, do a GET battery/id to get the informations, copy/paste it in your PUT request and change the status

For Building:
GET https://rocketelevatorapi20190405103718.azurewebsites.net/building/intervention - Return a list of buildings that need some intervention, either on batteries, columns or elevators.

For Columns:
GET https://rocketelevatorapi20190405103718.azurewebsites.net/api/column - Return a list of all the columns
GET https://rocketelevatorapi20190405103718.azurewebsites.net/api/column/"id" - Return the information about a specific column
PUT https://rocketelevatorapi20190405103718.azurewebsites.net/api/column/"id" - To do a put request you need to send a JSON querry with a modified status. Like the example above. Except with columns informations, so just to be clear, do a GET column/id to get the informations, copy/paste it in your PUT request and change the status

For Leads:
GET https://rocketelevatorapi20190405103718.azurewebsites.net/api/lead/recent - Return a list of all the leads that were sent in the last 30 days that are not a customer yet
```

## Initial User List

| First Name    | Last Name  | Title    | Email                              | Password |
| ------------- | ---------- | -------- | ---------------------------------- | -------- |
| Philippe      | Bouillon   | Comm Rep | philippe.bouillon@codeboxx.biz     | 1234     |
| Felix-Antoine | Paradis    | Engineer | felix-antoine.paradis@codeboxx.biz | 1234     |
| Remi          | Gagnon     | Engineer | remi.gagnon@codeboxx.biz           | 1234     |
| Mathieu       | LeFrançois | Engineer | mathieu.lefrancois@codeboxx.biz    | 1234     |
| Mathieu       | Houde      | Engineer | mathieu.houde@codeboxx.biz         | 1234     |
| Serge         | Savoie     | Engineer | serge.savoie@codeboxx.biz          | 1234     |
| Nadya         | Fortier    | Director | nadya.fortier@codeboxx.biz         | 1234     |

## Built With

- [Ruby](https://www.ruby-lang.org/en/) - Open source language
- [Rails](https://rubyonrails.org/) - Web framework
- [MySQL](https://www.mysql.com/) - Open source database
- [C#](https://fr.wikipedia.org/wiki/C_sharp) - Language used for the Web API
- [Visual Studio Community](https://visualstudio.microsoft.com/fr/vs/community/) - IDE
- [Visual Studio Code](https://code.visualstudio.com/) - Open source IDE

## Authors

- **Samuel Asselin** - _PostgreSQL_
- **Gabriel Chevanel** - _GRAPHQL_
- **Airton Negromonte** - _RESTful API_
- **Oivier Denis** - _RESTful API_
- **Jérémy Lefevbre** - _Good recovery Jeremy!_

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

- CodeBoxx school

# Rocket-Elevator-Foundation
