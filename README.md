# Dhiman Logistics
## _Fall 2022 - Shopify Developer Intern Challenge_

Dhiman Logistics is a cloud-based logistics tracker system.

- [Features](#features)
- [Additional Features](#additional-features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
    - [The Store](#the-store)
    - [Technologies Used](#technologies-used)
- [Project Setup](#project-setup)
    - [Cloning the repository]()
    - [Installing libraries]()
    - [Database setup]()
    - [Running the Rails server on local machine]()
- [Run on Replit](#run-on-replit)
- [Running Testcases](#running-testcases)
- [Project Architecture](#project-architecture)

## Features
- Create inventory items
- Edit inventory item
- Delete inventory item
- View a list of inventory items

## Additional Feature
- Ability to create warehouses/locations and assign inventory to specific locations

## Tech Stack

Important libraries and frameworks used in this project:

- [Ruby](https://github.com/ruby/ruby) - _2.7.2_, Interpreted object-oriented programming language
- [Rails](https://github.com/rails/rails) - _7.0.3_, Web-application framework based on [MVC](https://en.wikipedia.org/wiki/Model-view-controller) pattern
- [SQLite](https://www.sqlite.org/index.html) - _1.4.2_, In-built Light Weight Database
- [rspec-rails](https://github.com/rspec/rspec-rails/tree/6-0-maintenance) - _5.1.2_, Testing Framework, alternative to Minitest.
- [puma](https://github.com/puma/puma) - _5.6.4_, HTTP server for Ruby/Rack applications

## Installation

### Step 1:
##### Ruby Installation

You may have ruby preinstalled. To verify Ruby Installation, Run:
```sh
ruby -v
```
If not, follow this [link](https://www.ruby-lang.org/en/documentation/installation/) to install ruby for various OS.
### Step 2:
##### SQLite Installation:

Many popular UNIX-like OSes ship with an acceptable version of SQLite3. 
On Windows, if you installed Rails through Rails Installer, you already have SQLite installed. 
Others can find installation instructions at the [SQLite3 website](https://www.sqlite.org/). 

To Verify that it is correctly installed and in your PATH:
```sh
sqlite3 --version
```

### Step 3
##### Rails Installation

We need the current latest version of rails.

```sh
gem install rails --version '7.0.3'
rails --version
```

Kindly follow the official Rails installation documentation in case of any issues:
[https://guides.rubyonrails.org/v5.0/getting_started.html](https://guides.rubyonrails.org/v5.0/getting_started.html)

## Project Setup
### Step 1:
Cloning the repository:
```sh
git clone %Project-Github%
cd dhiman_logistics
```

### Step 2:
Installing all the gems libraries and dependencies
```sh
bundle
```

### Step 3:
Creating the database and migrating for the first time
```sh
rake db:create
rake db:migrate
rake db:seed
```

### Step 4:
Running the Rails server on local
```sh
rails s
```
We can check website on our local machine browser:
```
http://localhost:3000/
```
We should see something like this:
# Screenshot


## Run on Replit
```sh
rails s -b 0.0.0.0
```
After this check on the replit preview window for demo.

- Add a screenshot of gif of application

## Running Testcases
```sh
bundle exec rspec
```

## Project Architecture

The Project mainly contains two modules
- Warehouses
    - Contains warehouse address and contact information
    - Contains count of total inventory items present in warehouse
- Inventory Items
    - Contains Item information
    - Contains warehouse information, where is is stored
    - Contains status of inventory item: (Received, Off-Loaded, Ready to Ship)

#### DB architecture:
- screenshot for db
    
#### Associations:
- A warehouse can have multiple Inventory Items
- Inventory Item belongs to a warehouse 
  
## Future Scope  
- Add Authentication
- Remove limitation for Country and State limited to Ontario, Canada
- Add Categories in Inventory Items
- Filters and search feature on inventory items
- Pagination in inventory Items and warehouses
- Creating shipment for inventory from a warehouse
- Maintaining Inventory Update record
- Add deletion message for inventory and recorver after deletion
