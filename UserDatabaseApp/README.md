# LovEvery

## Introduction

This application can Add and Find user messages from a service that has a REST interface.

## Architecture:

● Clean approach / loosely coupled architecture
● MVVM design pattern
● Combine FrameWork - Reactive programming
● Dependency Injection 
● Code is separated into three layers
		○ Presentation layer - Model, Screen, Data binding
		○ Action layer - Interface and Service
		○ Network layer - APIs
● Packages - Swift Package Manager
● Added SwiftLint script in build phases

 
## Unit tests / Mock Tests

In order to test Mock data please select "LovEveryMockTest" target and run the application.
There is Mock Interface and Services. These provides test inputs used to test.
Please note that while using Mock data any operation or changes done will not be reflected 
and only the hardcoded data will be shown.
● Here Code is separated into three layers
        ○ Presentation layer - Model, Screen, Data binding
        ○ Mock Action layer - Interface and Service
        ○ Mock layer
        
Mock data does not use services so there is no Network layer. 


## Automate tests

● Added AccessibilityIdentifiers enumeration. This is common place where all the elment's accessibility Identifier present.
● An identifier can be used to uniquely identify an element. 
● Accessibility Identifiers are the easiest way of locating an element in the app. 


## API Description:
●  Post messages to the API using the URL:
https://abraxvasbh.execute-api.us-east-2.amazonaws.com/proto/messages
The format of the body is:
	{
      "user": "dan",
      "operation": "add_message",
      "subject": "pets",
      "message" : "cats are grumpy"
	}
The operation parameter must be "add_message". Other fields can have
variable input strings. The return value is the message that has been
saved.

●  Get all messages from the API using the URL:
https://abraxvasbh.execute-api.us-east-2.amazonaws.com/proto/messages,
There are no parameters for this request. The response is JSON:
{
  "statusCode": 200,
  "body": {
  "dan": [ {
        "subject": "pets",
        "message": "dogs are happy"
      },
      {
        "subject": "pets",
        "message": "cats are grumpy"
      } ],
  "bob": [ {
        "subject": "bob stuff",
        "message": "bob bob bob"
      },
      {
        "subject": "bob stuff",
        "message": "there once was a guy named bob"
      } ]
  } 
}

●  Get messages based on the submitter’s user name from the API using the
URL:
https://abraxvasbh.execute-api.us-east-2.amazonaws.com/proto/messages/{use
r}
Note that {user} is the user field in the post operation. An example of
the URL could be:
https://abraxvasbh.execute-api.us-east-2.amazonaws.com/proto/messages/dan
{
  "statusCode": 200,
  "body": {
    "user": "dan",
    "message": [
      {
        "subject": "pets",
        "message": "dogs are happy"
      }, {
        "message": "cats are grumpy"
      }
   ] 
  }
}


## Programming Language/SDK Usage:
● Swift Language
● Native iOS UIKit
● Xcode tool - 13.2.1
● iOS 15.2
