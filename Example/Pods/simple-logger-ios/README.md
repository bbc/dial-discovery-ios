# simple-logger-ios

[![CI Status](http://img.shields.io/travis/bbc/simple-logger-ios.svg?style=flat)](https://travis-ci.org/bbc/simple-logger-ios)
[![Version](https://img.shields.io/cocoapods/v/simple-logger-ios.svg?style=flat)](http://cocoapods.org/pods/simple-logger-ios)
[![License](https://img.shields.io/cocoapods/l/simple-logger-ios.svg?style=flat)](http://cocoapods.org/pods/simple-logger-ios)
[![Platform](https://img.shields.io/cocoapods/p/simple-logger-ios.svg?style=flat)](http://cocoapods.org/pods/simple-logger-ios)
This framework provides a simple set of convenience wrapper functions for writing to ASL (Apple System
Log).

It supports a compile-time log level by setting the value of the preprocessor macro
`MW_COMPILE_TIME_LOG_LEVEL`. This will turn the associated log calls
into NOPs.

## Overview

To control the logging level at compile time, set the value of the preprocessor
macro `MW_COMPILE_TIME_LOG_LEVEL`. The log levels are the constants defined in asl.h:

```
#define ASL_LEVEL_EMERG   0
#define ASL_LEVEL_ALERT   1
#define ASL_LEVEL_CRIT    2
#define ASL_LEVEL_ERR     3
#define ASL_LEVEL_WARNING 4
#define ASL_LEVEL_NOTICE  5
#define ASL_LEVEL_INFO    6
#define ASL_LEVEL_DEBUG   7
```

For a description of when to use each level, see here:
http://developer.apple.com/library/mac/#documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/LoggingErrorsAndWarnings.html#//apple_ref/doc/uid/10000172i-SW8-SW1

* **Emergency** (level 0) - The highest priority, usually reserved for
catastrophic failures and reboot notices.
* **Alert** (level 1)     - A serious failure in a key system.
* **Critical** (level 2)  - A failure in a key system.
* **Error** (level 3)     - Something has failed.
* **Warning** (level 4)   - Something is amiss and might fail if not corrected.
* **Notice** (level 5)    - Things of moderate interest to the user or administrator.
* **Info** (level 6)      - The lowest priority that you would normally log, and purely informational in nature.
* **Debug** (level 7)     - The lowest priority, and normally not logged except for messages from the kernel.

Note that by default the iOS syslog/console will only record items up to level ASL_LEVEL_NOTICE.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.



## Installation

simple-logger-ios is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "simple-logger-ios"
```

## How to use

#### Import the header files

```objective-c
#import <simple-logger-ios/MWLogging.h>
```

#### Use logging functions

Call the appropriate function for the logging level you wish to log at. For example:

```objective-c
MWLogDebug("Logging message at ASL_LEVEL_DEBUG");
MWLogError("Logging message at ASL_LEVEL_ERR");
```

The logging message can include formatting for additional parameters, as per `[NSString initWithFormat]`, for example:

```objective-c
int numItems = 5;
...

MWLogInfo("For information there are %d items left.", numItems);
```

## Author

Rajiv Ramdhany, rajiv.ramdhany 'at' bbc.co.uk

## License

``simple-logger-ios`` is developed by BBC R&D and distributed under Licensed under the Apache License, [Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

© Copyright 2016 BBC R&D. All Rights Reserved
