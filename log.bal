import ballerina/log;

# Represents a logger that can be used to log messages.It can be used simultaneously by multiple strands.
# 
# ```ballerina
# log:Logger logger = log:defaultLogger();
# log:Logger loggerWithContext = log:defaultLogger("component" = "userManagement");
# ```
# 
public isolated class Logger {
    private final log:KeyValues values;

    isolated function init(log:KeyValues values = {}) {
        self.values = values.clone();
    }

    isolated function getKeyValues() returns log:KeyValues {
        lock {
            return self.values.clone();
        }
    }

    # Prints debug logs.
    # ```ballerina
    # logger.printDebug("debug message", id = 845315)
    # ```
    #
    # + msg - The message to be logged
    # + 'error - The error struct to be logged
    # + stackTrace - The error stack trace to be logged
    # + keyValues - The key-value pairs to be logged
    public isolated function printDebug(string msg, error? 'error = (), error:StackFrame[]? stackTrace = (), *log:KeyValues keyValues) {
        log:KeyValues newKVPairs = self.copyKeyValues(keyValues);
        log:printDebug(msg, 'error = 'error, stackTrace = stackTrace, keyValues = newKVPairs);
    }

    # Prints info logs.
    # ```ballerina
    # logger.printInfo("info message", id = 845315)
    # ```
    #
    # + msg - The message to be logged
    # + 'error - The error struct to be logged
    # + stackTrace - The error stack trace to be logged
    # + keyValues - The key-value pairs to be logged
    public isolated function printInfo(string msg, error? 'error = (), error:StackFrame[]? stackTrace = (), *log:KeyValues keyValues) {
        log:KeyValues newKVPairs = self.copyKeyValues(keyValues);
        log:printInfo(msg, 'error = 'error, stackTrace = stackTrace, keyValues = newKVPairs);
    }

    # Prints warn logs.
    # ```ballerina
    # logger.printWarn("warn message", id = 845315)
    # ```
    #
    # + msg - The message to be logged
    # + 'error - The error struct to be logged
    # + stackTrace - The error stack trace to be logged
    # + keyValues - The key-value pairs to be logged
    public isolated function printWarn(string msg, error? 'error = (), error:StackFrame[]? stackTrace = (), *log:KeyValues keyValues) {
        log:KeyValues newKVPairs = self.copyKeyValues(keyValues);
        log:printWarn(msg, 'error = 'error, stackTrace = stackTrace, keyValues = newKVPairs);
    }

    # Prints error logs.
    # ```ballerina
    # error e = error("error occurred");
    # logger.printError("error log with cause", 'error = e, id = 845315);
    # ```
    #
    # + msg - The message to be logged
    # + 'error - The error struct to be logged
    # + stackTrace - The error stack trace to be logged
    # + keyValues - The key-value pairs to be logged
    public isolated function printError(string msg, error? 'error = (), error:StackFrame[]? stackTrace = (), *log:KeyValues keyValues) {
        log:KeyValues newKVPairs = self.copyKeyValues(keyValues);
        log:printError(msg, 'error = 'error, stackTrace = stackTrace, keyValues = newKVPairs);
    }

    # Create a new logger with additional key-value pairs.
    # 
    # ```ballerina
    # log:Logger userLogger = logger.withContext("component" = "userManagement");
    # ```
    #
    # + keyValues - The key-value pairs to be added to the logger
    # + return - The new logger with the additional key-value pairs
    public isolated function withContext(*log:KeyValues keyValues) returns Logger {
        log:KeyValues newKVPairs = self.copyKeyValues(keyValues);
        return new Logger(newKVPairs);
    }

    isolated function copyKeyValues(log:KeyValues keyValues) returns log:KeyValues {
        log:KeyValues newKVPairs;
        lock {
            newKVPairs = self.values.clone();
        }

        copyKeyValues(keyValues, newKVPairs);
        return newKVPairs;
    }
}

# Create a new root logger with optional key-value pairs.
# + keyValues - The optional key-value pairs to be added to the root logger
# + return - The new root logger
public isolated function defaultLogger(*log:KeyValues keyValues) returns Logger {
    return new Logger(keyValues);
}

isolated function copyKeyValues(log:KeyValues src, log:KeyValues dest) {
    foreach var key in src.keys() {
        dest[key] = src[key];
    }
}

