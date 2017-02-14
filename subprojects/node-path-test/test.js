const suman = require('suman');
const Test = suman.init(module);


Test.create('node-path-test', describe => {

    describe('test all deps', it => {

        [
            'istanbul',
            'babel-cli',
            'suman-inquirer',
            'suman-inquirer-directory',
            'slack'

        ].forEach(item => {

            it(item, function () {
                require.resolve(item);
            });
        });

    });

});

