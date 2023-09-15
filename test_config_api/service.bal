import ballerina/http;

configurable int dbPort = 9090;
configurable string message = "name should not be empty!";

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(dbPort) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error(message);
        }
        return "Hello, " + name;
    }
}
