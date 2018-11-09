'use strict';

const SetupEndpoint = require('./setup/');

module.exports = SetupEndpoint({
    name: 'cephfs',
    urls: [
        {
            requests: [{
                method: 'GET',
                response: '/response-files/cephfs.list.json'
            }]
        },
        {
            params: '/{id}',
            requests: [{
                method: 'GET',
                response: '/response-files/cephfs.getCephfs.json'
            }]
        },
        {
            params: '/{id}/clients',
            requests: [{
                method: 'GET',
                response: '/response-files/cephfs.getClients.json'
            }]
        },
        {
            params: '/{id}/mds_counters',
            requests: [{
                method: 'GET',
                response: '/response-files/cephfs.getMdsCounters.json'
            }]
        }
    ]
});
