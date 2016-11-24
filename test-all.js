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
        var line = '';

        sh.stderr.setEncoding('utf8');

        function fuck (d) {
          if (d && !String(d).match(/npm info/ig) && !String(d).match(/npm http/ig)) {
            stderr += d;
            // process.stderr.write(String(d));
          }
        }

        sh.stderr.on('data', function (d) {

          const lines = String(d).split('\n');
          line += lines.shift();
          fuck(line);

          for (var i = 0; i < lines.length - 1; i++) {
            fuck(lines[ i ]);
          }

          line = lines[ i ];

        });

        t.on('done', function () {
          sh.kill();
        });

        sh.on('close', function (code) {

          fuck(line);

          t.log('code =>', code);
          console.log('code =>', code);

          if (code === 0) {
            t.done();
          }
          else {
            t.done(stderr);
          }

        });

      });
    }

  });

});