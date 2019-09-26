Objects          |	Messages
----------------------------------
Person	         |
Bike	           |  working?
DockingStation   |  release_bike


Bike <-- working? --> true/false
DockingStation <-- release_bike --> a Bike


error message 1:
Traceback (most recent call last):
        4: from /Users/Student/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `<main>'
        3: from /Users/Student/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `load'
        2: from /Users/Student/.rvm/rubies/ruby-2.6.3/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant DockingStation)
