

const suman = require('suman');
const path = require('path');

suman.run({
  files: [path.resolve(__dirname + '/one.test.js')]
})
.then(function(v){

  v.sumanProcess.stdout.pipe(process.stdout);
  v.sumanProcess.stderr.pipe(process.stderr);

});