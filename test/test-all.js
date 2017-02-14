const suman = require('suman');
const Test = suman.init(module);

//  this script will cd into each directory and run the bash script called test.sh in each directory
//  if this script exits cleanly, then all tests pass

const byline = require('byline');
const colors = require('colors/safe');
const debug = require('suman-debug')('s:test');

const _ = require('lodash');

const parallel = process.env.SUMAN_PARALLEL === 'yes';
const testName = String(process.env.SUMAN_TEST_NAME || '');

if (testName) {
    console.log('\n', colors.cyan(' => Test name (process.env.SUMAN_TEST_NAME) => '), testName, '\n')
}

Test.create('test-all-projects', {parallel: parallel}, function (fs, child_process, path, util, it) {

    const projectRoot = path.resolve(__dirname + '/../');
    const spawn = child_process.spawn;
    const rt = path.resolve(projectRoot, 'subprojects');
    const items = _.shuffle(fs.readdirSync(rt));  // shuffle is crucial


    items.filter(function (item) {

        if (testName) {
            return String(item).match(new RegExp(testName));
        }
        console.log('\n', colors.cyan(' => process.env.SUMAN_TEST_NAME was empty, so we should be running all the tests. '), '\n')
        return true;

    }).forEach(item => {

        const dir = path.resolve(rt, item);

        debug(' => dir to run  => ', dir);

        if (fs.statSync(dir).isDirectory()) {

            debug(' => dir is a directory => ', dir);

            it.cb('exits cleanly', {timeout: 55000}, t => {

                console.log('\n\n', colors.cyan('=> running item => '), colors.yellow.bold(item), '\n');
                const b = path.resolve(dir, 'test.sh');

                const sh = spawn(b, [], {
                    env: Object.assign(process.env, {
                        PROJECT_ROOT: projectRoot
                    }),
                    cwd: dir,
                    stdio: ['ignore', 'pipe', 'pipe']
                });

                const strm = fs.createWriteStream(path.resolve(dir, 'test-output.log'));

                sh.stdout.setEncoding('utf8');
                sh.stderr.setEncoding('utf8');

                sh.stdout.pipe(strm);
                sh.stderr.pipe(strm);

                sh.stdout.pipe(process.stdout);
                sh.stderr.pipe(process.stderr);

                t.once('done', function () {
                    sh.kill();
                });

                sh.once('close', function (code) {

                    t.log('code => ', code);

                    console.log('code => (' + item + ') => ', code);

                    // t.done(new Error(stderr));
                    t.done(code);

                });

            });
        }

    });

});