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
Face recognition: 
The system has face recognition which helps to recognize a human face through technology. A face recognition model maps facial features from security camera and compares the information with a database of known faces to find a match. In this situation, the camera at entrance captures everyone at distance close to the door, and if the person in know, the autonomous door opens. However, if the person is new, the notification is sent to the house owner, and he or he can accept the person to enter or decide to use another means of communication such as voice message, direction towards alarm or communicate to the security guard.  
There are two data sets, one is for know people in the house and another is for real time caption of the people coming to the house.
In addition, after the image classifier, out put is sent to firebase, and if the output is that a person is unknown, notification is automatically sent, but if is known, the door is supposed to open without notifying the house master. 
There is also, a page for this functionality of the mobile application. 

Technology:
-Flutter
-AI : The image recognition model. 
- Stack implementation, through flutter widget 
-Flutter 



## Denver Chikokonya
We used firebase because it offers a Real-time database. The real-time database gives the system the capability to handle real time data updates incase of data change from the sensors. Firebase comes with even more components to handle backend development.
Firebase also gives backend services, simple to-use SDKs, and instant UI libraries to confirm clients over the application. It supports authentication using passwords, email id or username.
One of the important features we wanted was the inclusion of push notifications to notify the user whenever data changes in the database. Firebase makes it easy through the use of firebase cloud messagin functions.
Lastly, we used tinkercad to model the sensors because it gives a real-time simulation of the sonsors and also posses a wide range of devices suited for our project.
Link to tinkcercad model: https://www.tinkercad.com/things/7Pm3CUshqDc-motion-detection-sensor/editel
