var exec = require('cordova/exec');

document.addEventListener('deviceready', function() { // Wait for deviceready
    var channel = cordova.require("cordova/channel");
    if (channel) {
        channel.OSDeepLinksHandlerChannel.subscribe(function (url) {
            console.log("Received deep link URL (event):", url);

            // Your custom logic to handle the URL goes here.
            // Example:
            if (url.includes("your-success-path")) {
                // Do something (e.g., navigate to a specific page)
                window.location.href = "#/success"; // Example using a hash-based route
            } else if (url.includes("your-failure-path")) {
                // Do something else
                window.location.href = "#/failure";
            } else {
                // Handle other deep links
            }
        });
    } else {
      console.error("Cordova channel not available for Deep Link handling");
    }
}, false);

exports.init = function (success, error,environment,clientID,clientSecret,redirectUrl) {
    exec(success, error, 'uaepass', 'initPlugin', [environment,clientID,clientSecret,redirectUrl]);
};

exports.getWritePermission = function (success, error) {
    exec(success, error, 'uaepass', 'getWritePermission', []);
};

exports.getCode = function (success, error) {
    exec(success, error, 'uaepass', 'getCode', []);
};

exports.getAccessToken = function (success, error,code) {
    exec(success, error, 'uaepass', 'getAccessToken', [code]);
};

exports.getProfile = function (success, error,accessToken) {
    exec(success, error, 'uaepass', 'getProfile', [accessToken]);
};

exports.signDocument = function (success, error,documentURL) {
    exec(success, error, 'uaepass', 'signDocument', [documentURL]);
};

exports.clearData = function (success, error) {
    exec(success, error, 'uaepass', 'clearData', []);
};
