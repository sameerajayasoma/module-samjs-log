## Overview

The `samjs/log` package provides an enhanced logging API for Ballerina, supporting contextual logging which is not available in the standard `ballerina/log` module. This package allows developers to create loggers with persistent context, making it easier to track and correlate log entries across different parts of an application.

## Features

- **Contextual Logging**: Create loggers with persistent key-value pairs that are included in every log entry.
- **Thread-Safe**: The `Logger` class is designed to be used safely in concurrent environments.
- **Multiple Log Levels**: Supports debug, info, warn, and error log levels.
- **Error Logging**: Ability to log errors along with their stack traces.
- **Extensible Context**: Easily add additional context to existing loggers.

## Usage

To use the `samjs/log` package, import it in your Ballerina code:

```ballerina
import samjs/log;
```

### Creating a Logger

Create a default logger:

```ballerina
log:Logger logger = log:defaultLogger();
```

Create a logger with initial context:

```ballerina
log:Logger logger = log:defaultLogger("component" = "userManagement");
```

### Logging Messages

Log messages at different levels:

```ballerina
logger.printDebug("This is a debug message");
logger.printInfo("This is an info message");
logger.printWarn("This is a warning message");
logger.printError("This is an error message");
```

### Logging with Additional Context

Add temporary context to log messages:

```ballerina
logger.printInfo("User logged in", "userId" = "12345");
```

### Logging Errors

Log errors with stack traces:

```ballerina
error e = error("Something went wrong");
logger.printError("An error occurred", 'error = e);
```

### Creating Derived Loggers

Create a new logger with additional context:

```ballerina
log:Logger userLogger = logger.withContext("component" = "userManagement");
```

For more detailed information about each function and class, please refer to the API documentation.