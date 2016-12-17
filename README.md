# Medication reminders

This application allows a user to view his or her medications on any browser (mobile friendly) and edit existing medications or create a new one. 

Additionally, the application sends email reminders for each medication once a day (not yet completed, see 'Todo' section).

# Frameworks

* Front-end Angular application (Single page application)
* Bootstrap HTML/CSS
* Ruby on Rails backend API
* SMTP email notifications
* Basic RestClient ruby script for notification system

# Reminder Engine

The reminder engine is currently a ruby script that calls the 'send_reminders' endpoint in the API every 10 seconds (the API host and frequency are configurable). The endpoint determines which reminders to send, schedules the next reminder, and sends the notification via email (SMTP).

See 'Todos' for improvement suggestions.

# Todos

This application is not fully functional; here are some todos:

## Reminders for all medications

Currently, the reminder service only grabs the first medication and sends reminders for that. Eventually we want to grab all medications and send reminders for eash one. 

## Delete function

There is currently no 'delete' function in the front end UI.

## Auto refresh medications

Currently when you update a medication, you have to refresh the page to see that your changes have been saved. 

## More robust input validations

Currently the only input validation is making sure neither the time nor medication name is blank. Add more validation or a date picker to force user to provide valid input.

## Testing

Determine the best testing framework for front end tests (Jasmine/Karma?).
Add rspecs to the backend services.

## More robust reminder worker engine

There are several drawbacks to the current reminder system:
1. There is a 10 second potential lag between when the user needs to take the medication and when the reminder is sent.
2. Only supports email notifications. Users may want something more immediate like test or mobile.
3. Does not come with built-in error handling, fault tolerance, or history.

Long term we might consider building a queuing service saves history in a framework like Kafka. Medium term this should be abstracted into a redis queue and define smart workers that implement the notifications in a background thread on the application server itself. More design is needed here. 

## Styling

Replace currently UI with something more intuitive and 'pretty'.

# Deployment

The web application is ready for deploy to Heroku immediately. The ruby script will have to be made more robust before it is ready for production deploy (See 'Todos' section).

# Potential additional features

1. Ability to mark medication as 'taken'.
2. Additional notification types (text, mobile push notification, etc).
3. Increased accuracy of notifications (give us less strain on server, more robust notifications, etc).



