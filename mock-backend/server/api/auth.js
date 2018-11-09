'use strict';

const SetupEndpoint = require('./setup/');

module.exports = SetupEndpoint({
    name: 'auth',
    urls: [
        {
            params: '/check',
            requests: [{
                method: 'POST',
                response: '/response-files/auth.check.json'
            }]
        },
        {
            requests: [{
                method: 'POST',
                response: '/response-files/auth.login.json'
            }]
        },
        {
            params: '/logout',
            requests: [{
                method: 'POST',
                response: '/response-files/auth.logout.json'
            }]
        }
    ]
});
