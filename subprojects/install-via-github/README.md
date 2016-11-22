This project will install the latest Suman package from Github instead of NPM.
It will assert that the latest version on NPM is the same as the latest version
on Github public/master.

suman --init has already been called in this project, and the suman
devDependency should be listed, but it should *not* already be present in node_modules
(node_modules isn't in version control anyway)