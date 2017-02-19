/**
 * Created by Olegzandr on 11/20/16.
 */


const suman = require('suman');
const Test = suman.init(module, {
    ioc: {}
});

const colors = require('colors/safe');


Test.create('makes birds fly', function (it, describe, child_process, fs, path, assert) {

    const spawn = child_process.spawn;

    describe('magic', function (it) {

        it.cb('is great', t => {

            fs.readdir(path.resolve(process.env.HOME + '/.suman'), t.wrap(function (err, items) {
                if (err) {
                    t.fail(err);
                }
                else {

                    console.log('\n', colors.red(' => Items => ', items), '\n');

                    const valObj = {
                        'find-local-suman-executable.js': 0,
                        'install-queue.txt': 0,
                        'queue-worker.lock': 0,
                        'suman-clis.sh': 0,
                        'suman-debug.log': 0,
                        'find-project-root.js': 0
                    };

                    const keys = Object.keys(valObj);

                    items.forEach(function (item) {
                        valObj[item]++;
                        assert(!(keys.indexOf(item) < 0), item + ' is out of range LOL.');
                    });

                    // keys.forEach(function(key){
                    //     assert(valObj[key] === 1, ' => Missing file in ~/.suman dir => ' + key);
                    // });

                    t.done();
                }

            }));
        });

    });


});