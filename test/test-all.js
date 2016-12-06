const suman = require('suman');
const Test = suman.init(module);

//  this script will cd into each directory and run the bash script called test.sh in each directory
//  if this script exits cleanly, then all tests pass

const argv = process.argv.slice(0);

console.log('We are the one!');

const byline = require('byline');

const _ = require('lodash');

Test.create('test-all-projects', {parallel: false}, function (fs, child_process, path, util) {

    const projectRoot = path.resolve(__dirname + '/../');

    console.log('projectroot => ', projectRoot);

    const spawn = child_process.spawn;
    const rt = path.resolve(projectRoot, 'subprojects');
    console.log('rt => ',rt);

    const items = _.shuffle(fs.readdirSync(rt));
    console.log('items in order => ', util.inspect(items));

    items.forEach(item => {

        const cwd = path.resolve(rt, item);

        if (fs.statSync(cwd).isDirectory()) {

            this.it.cb('exits cleanly', {timeout: 55000}, t => {

                console.log('=> running item => ', item);
                const b = path.resolve(cwd, 'test.sh');

                const sh = spawn('sh', [b], {
                    env: Object.assign(process.env, {
                        PROJECT_ROOT: projectRoot
                    }),
                    cwd: cwd,
                    stdio: ['ignore', 'inherit', 'inherit']
                });

                // sh.stdout.pipe(fs.createWriteStream('/dev/null'));

                var stderr = '';
                var line = '';

                // sh.stderr.setEncoding('utf8');
                //
                // const stream = byline(sh.stderr);
                //
                // stream.on('data', function(line) {
                //   if (line && !String(line).match(/gyp/ig) && !String(line).match(/npm info/ig) && !String(line).match(/npm http/ig)) {
                //     stderr += String(line);
                //     process.stderr.write('\n' + line);
                //   }
                // });

                t.once('done', function () {
                    sh.kill();
                });

                sh.once('close', function (code) {

                    t.log('code =>', code);
                    console.log('code =>', code);

                    // t.done(new Error(stderr));
                    t.done(code);


                });

            });
        }

    });

});