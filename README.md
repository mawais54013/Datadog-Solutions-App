# Datadog Solutions App
Swift iOS App created for testing the debugging issues related to the iOS SDK for both logs and traces. (RUM will be added soon after release) <br />
&nbsp;

## Installation
1) Need to download Xcode from the Mac Store in order to run this application:
https://apps.apple.com/us/app/xcode/id497799835?mt=12
This software contains the simulators and tools that are needed to run the app. 

2) Once you have downloaded the software, it's time to install the [command line](https://guides.cocoapods.org/using/getting-started.html) used to include dependencies/packages in your Xcode project by running the following command in your terminal:

```bash
sudo gem install cocoapods
```

3) Once you have downloaded the Xcode software and the command line tool cocoapods, you can clone the project from github down to your local machine. 

4) In the pod file we are adding the SDK we want to use and which version in which in this case is 1.3.0-beta1. Once you have saved the file, go back to your terminal and run the following:
```podfile
pod installl
```

For reference you directory should now look like the following:
![image](images/filesetup.png)

6) The final step would be to click on the Datadog-App.xcworkspace file and this should open up xcode <br />
&nbsp;

## App Usage
(Video will be added for a visual walkthrough)

The main file that has all the configuration and functions would be the ViewController.swift file and it's the file I'll be referencing moving forward. 

The app already has both the logging and tracing portions setup so you do not have to configure them, but you will need to included your client token in the datadog setup section as per the image below: (Note: the client token can be created and found in the API page of your datadog account)
![token](images/configToken.png)
Image link: https://a.cl.ly/GGuRGXez
 <br />
&nbsp;

To test the app on the simulator, you just need to press the play button on the top right of the screen:
![simulator](images/simulator.png) 
Image link: https://a.cl.ly/Jru6rzAK
<br />
&nbsp;

After clicking on the play icon, it should open up the simulator and the app itself as seen below:
![app](images/app.png)
<br />
&nbsp;

You can click on either "send log" or "send trace" and you should have either a log or trace in your account in a couple seconds. 

## Code Customization

Env and user setup: <br />
You are able to chnage the environemnt name, user info, etc in the Datadog setup section of the code:

![init](images/initialize.png)
https://a.cl.ly/qGuNewmB 
<br />
&nbsp;


Log customization: <br />
More options available here in the doc's: https://docs.datadoghq.com/logs/log_collection/ios/?tab=cocoapods

Any changes would occur in the code function "sendLog" below:
![log](images/logs.png)<br />
&nbsp;

Trace customization: <br />
More options available here in the doc's: https://docs.datadoghq.com/tracing/setup/ios/?tab=us

Any changes would occur in the code function "sendTrace" below:
![log](images/trace.png)

## Extra Youtube and Udemy courses in case your interested in iOS development:
Youtube: https://www.youtube.com/watch?v=_YvAUgV6GYM

Udemy course: https://datadog.udemy.com/course/the-10-day-iphone-app-bootcamp-new-ios-12-and-xcode-10/learn/lecture/10753420#overview

