# homesecuritysystem

A new Flutter application.

## Eugenia Mawuenya Akpo
Software Function Requirements:
•	Login page: Customer should secure entry into the app with a login page and if possible facial recognition. This requires the use of a source that authenticates the security key. We considered using Firebase.
•	Help desk: Client can make quick calls and can access help desk all the time with easy access to emergency contacts. 
•	User should be able to allow or decline entry of unknown guests
•	The system should be able to record entry/leaving information and user should be able to access it

Data Structures: 
Stack: Mostly used in UI implementation. It allows the unique arrangements of the widgets in the Login File. It is used in the Login class.
Trees: Flutter application makes use of trees for some of its widgets. 
Technologies and Justification
Flutter Dependencies:
 flutter:
    sdk: flutter
    
  bloc: ^0.8.0
  flutter_bloc: ^0.5.0
  flutter_local_notifications: ^1.4.3
  firebase_messaging: ^5.1.4
  get_it: ^1.0.3

These dependencies allow for various implementations such as Notifications. Some make it easy to display data from a source be it json or database. 
## Oscar Uwayo



## Denver Chikokonya
We used firebase because it offers a Real-time database. The real-time database gives the system the capability to handle real time data updates incase of data change from the sensors. Firebase comes with even more components to handle backend development.
Firebase also gives backend services, simple to-use SDKs, and instant UI libraries to confirm clients over the application. It supports authentication using passwords, email id or username.
One of the important features we wanted was the inclusion of push notifications to notify the user whenever data changes in the database. Firebase makes it easy through the use of firebase cloud messagin functions.
Lastly, we used tinkercad to model the sensors because it gives a real-time simulation of the sonsors and also posses a wide range of devices suited for our project.
Link to tinkcercad model: 
