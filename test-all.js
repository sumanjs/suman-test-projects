const suman = require('suman');
const Test = suman.init(module);

//  this script will cd into each directory and run the bash script called test.sh in each directory
//  if this script exits cleanly, then all tests pass

const argv = process.argv.slice(0);

console.log('We are the one!');

Test.create('test-all-projects', function (fs, child_process, path) {

  const spawn = child_process.spawn;
  const rt = path.resolve(__dirname, 'subprojects');

  fs.readdirSync(rt).forEach(item => {

    const cwd = path.resolve(rt, item);

    if (fs.statSync(cwd).isDirectory()) {

      console.log('item', item);

      this.it.cb('exits cleanly', { timeout: 45000 }, t => {

        const b = path.resolve(cwd, 'test.sh');

        t.log('b', b);
        t.log('cwd', cwd);

        console.log('b', b);
        console.log('cwd', cwd);

        const sh = spawn('sh', [ b ], {
          cwd: cwd,
          // stdio: [ 'ignore', 'ignore', 'ignore' ]
        });

        sh.stdout.pipe(fs.createWriteStream('/dev/null'));

        var stderr = '';

        sh.stderr.on('data', function (d) {
          if (!String(d).match(/npm info/) && !String(d).match(/npm http/)) {
            stderr += d;
            process.stderr.write.apply(process.stderr, arguments);
          }
        });

        t.on('done', function () {
          sh.kill();
        });

        sh.on('close', function (code) {

          t.log('code =>', code);
          console.log('code =>', code);

          if(code === 0){
            t.done();
          }
          else{
            t.done(stderr);
          }

        });

      });
    }

  });

});