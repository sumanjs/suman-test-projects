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

                    const vals = [
                        'find-local-suman-executable.js',
                        'install-queue.txt',
                        'node_modules',
                        'queue-worker.lock',
                        'suman-clis.sh',
                        'suman-debug.log'
                    ];

                    items.forEach(function (item) {
                        assert(!(vals.indexOf(item) < 0), item + ' is out of range.');
                    });

                    t.done();
                }

            }));
        });

        it('is great', function () {

        });

        it('is great', function () {

        });


    });


});