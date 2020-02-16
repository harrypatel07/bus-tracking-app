# Cyberjaya Tech Volunteer - Bus Tracking App

A mobile app for Cyberjaya public bus users.

## Description

Just like at other places, the Cyberjaya public bus users still face the trivial issues with the public bus services :
- The bus is frequently NOT on time. Most of the time, users arrived early at the bus stop but they have to wait for an extended time
- There is no way to know where is the next bus coming in, how far is it from the current stop and when will it reach the current stop
- For new users, there is no schedule easily available at the bus stop

The __Cyberjaya Tech Volunteers__ are building a mobile app that will provide real-time location and ETA of these public buses. The simplest solution is to have our own tracking device onboard these buses. Unfortunately, due to regulation, that is currently not possible.

Our current solution is, with the support of Cyberjaya City Planner, __Cyberview__, to have cameras at each relevant bus stops. The system will use these cameras to identify if any of the public buses stop at the stop (or passing through) and provide real-time updates to the users via notification. The system is also intended to provide a real-time tracking functionality for all relevant bus in Cyberjaya via the mobile app.

Planting cameras at the bus stop also allows us to extend the system to other functionalities. For example, a simple safety or surveillance camera at these bus stops. These, however, will be added later in the future.

If you'd like to __join us and contribute__ (doesn't have to be a programmer, we can use graphic designer and other roles as well), please reach out to __Ashraf (bit.ashraf@gmail.com)__ or __Raf (raf@kemaman.org)__


## Getting Started

### Technology Stacks

Note : These are the suggested ones. We can add and remove as necessary.

* Raspberry Pi - Raspian
* Python
* Flutter
* MySQL
* Java

### The repository
<pre>
Repository
├── rpi_scripts
├── backend_api
├── database
├── mobile_app
├── web_app
└── docs (for any related docs)
</pre>

__We essentially split the system into 5 parts__

__1. Rpi with Camera__
- Capture photo at an interval
- Perform local image recognition to recognize a bus
- Send to Google Vision API for Bus No detection (OCR)
- Send detected Bus No to Backend API (with the bus stop info and timestamp)

__2. Backend API & services__
- Process the received Bus No i.e. compare with the list of known Bus No
- If matches, update to real time tracking table and notification table
- A service is run (and kept running) to send out notification to subscribed users

__3. Database__ 
- To support Backend API

__4. Mobile App__
- Display real time bus tracking information
- To received notification

__5. Web App__
- Display real time bus tracking information
- To received notification

### How to contribute 

* Look over the "Issues" tab. 
* See if any of those in-progress interests you (regardless of it assigned or not)
* Reach out to Ashraf or Raf and let us know
* We will assign you a task to get you started
* Bi-monthly updates on the task

## Contributors

* Ashraf - bit.ashraf@gmail.com
* Raf - raf@kemaman.org
