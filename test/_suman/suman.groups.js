'use strict';

//core
const path = require('path');
const fs = require('fs');
const cp = require('child_process');
const rimraf = require('rimraf');

//npm
const sumanUtils = require('suman-utils/utils');

//////////////////////////////////////////////////////////////////////

// const scripts = path.resolve(__dirname + '/scripts');

//TODO: these functions should give users options to use kubernetes or docker


const projectRoot = global.projectRoot;


function getBuildArgs(name) {
    return ' --build-arg s=' + 'scripts/' + name + '.sh' + ' --build-arg sname=' + name + '.sh '
}


function build() {
    return 'cd ' + __dirname + ' &&  docker build ' + getBuildArgs(this.name) + ' -t ' + this.name + ' .'
}

function run() {
    return 'docker run -it --tty=false --rm ' + this.name;
}


const defaults = Object.freeze({
    allowReuseImage: false,
    useContainer: true,
    // build: build,
    // getPathToScript: getPathToScript,
    run: run
});

module.exports = data => {

    data = data || {};

    const r = path.resolve(projectRoot + '/subprojects');
    const dirs = fs.readdirSync(r);

    const groups = dirs.map(function (item) {

        return {

            cwd: path.resolve(r + '/' + item),

            name: path.basename(item, path.extname(item)),   // remove .sh from end

            getPathToScript: function () {
                return path.resolve(r + '/' + this.name + '/test.sh')
            },

            build: function () {
                const p = path.resolve(r + '/' + this.name);
                return 'cd ' + p + ' &&  docker build -t ' + this.name + ' .'
            },

            //TODO: ln -s /path/to/file /path/to/symlink

            // getBuildArgs: function () {
            //
            //     return '';   // no longer need this
            //
            //     const pts = this.getPathToScript();
            //     const p = path.resolve(r + '/' + this.name);
            //
            //     // console.log(' path to script => ', pts);
            //     // const dest = path.resolve(_dir + '/' + this.name + '.sh');
            //     // console.log(' dest => ', dest);
            //     // // cp.execSync('cp ' + this.getPathToScript() + ' ' + dest);
            //     // cp.execSync('ln -s ' + pts +' ' + dest);
            //     // const rlp = './' + path.relative(__dirname, dest);
            //     // console.log(' rlp => ', rlp);
            //
            //     const rlp = './' + path.relative(p, pts);
            //     console.log(' rlp => ', rlp);
            //     return ' --build-arg s=' + rlp + ' --build-arg sname=test.sh ';
            //     // return ' --build-arg s=' + path.relative(__dirname, this.getPathToScript()) + ' --build-arg sname=' + this.name + '.sh '
            // }

        }

    });

    return {

        //TODO: have to handle the case where the build has already been built - don't want to rebuild container

        // put in .suman/groups/scripts
        // if pathToScript is null/undefined, will read script with the same name as the group in the above dir
        groups: groups.map(function (item) {
            return Object.assign({}, defaults, item, data);
        })
    }

};

