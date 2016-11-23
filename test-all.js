const suman = require('suman');
const Test = suman.init(module);

//  this script will cd into each directory and run the bash script called test.sh in each directory
//  if this script exits cleanly, then all tests pass

const argv = process.argv.slice(0);

Test.create('test-all-projects', function (fs, child_process, path) {

  const spawn = child_process.spawn;
  const rt = path.resolve(__dirname, 'subprojects');

  fs.readdirSync(rt).forEach(item => {

    const cwd = path.resolve(rt, item);

    if (fs.statSync(cwd).isDirectory()) {

      console.log('item', item);

      this.it.cb('exits cleanly', t => {

        const b = path.resolve(cwd, 'test.sh');

        t.log('b',b);
        t.log('cwd',cwd);

        console.log('b', b);
        console.log('cwd', cwd);

        const sh = spawn('sh', [ b ], {
          cwd: cwd,
          stdio: ['ignore','inherit','inherit']
        });

        sh.on('close', function (code) {

          t.log('code =>', code);
          console.log('code =>', code);

          t.done(code);

        });

      });
    }

  });

});