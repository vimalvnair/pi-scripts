'use strict';
var onoff = require('onoff');
var Gpio = onoff.Gpio;
var socket1, socket2;
var  action_map = {'on': 0, 'off': 1}

const FauxMo = require('fauxmojs');

let fauxMo = new FauxMo(
  {
    ipAddress: '192.168.31.136',
    devices: [
      {
        name: 'lamp',
        port: 11000,
        handler: (action) => {
	  socket1 = new Gpio(3, 'out')
	  socket1.write(action_map[action], function(){})
          console.log('lamp action:', action);
        }
      },
      {
        name: 'fan',
        port: 11001,
        handler: (action) => {
          socket2 = new Gpio(2, 'out')
	  socket2.write(action_map[action], function(){})
          console.log('fan action:', action);
        }
      },
     {
        name: 'raspberry lamp',
        port: 11002,
        handler: (action) => {
          socket1 = new Gpio(3, 'out')
          socket1.write(action_map[action], function(){})
          console.log('lamp action:', action);
        }
      }
    ]
  });

console.log('started..');
