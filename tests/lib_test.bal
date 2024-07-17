import ballerina/test;


@test:Config {}
function testDefultLogger() {
    Logger rootLogger = defaultLogger(key1 = "value1", key2 = "value2");
    rootLogger.printInfo("Info message", id = 123);

    Logger logger1 = rootLogger.withContext(key3 = "value");
    logger1.printWarn("Warn message", id = 456);

    Logger logger2 = logger1.withContext(key4 = "value");
    logger2.printError("Error message", id = 789);

    Logger logger3 = logger2.withContext(key5 = "value");
    logger3.printInfo("Info message", id = 123);

    logger1.printWarn("Warn message", id = 456);
}
