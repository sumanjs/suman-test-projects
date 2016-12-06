This is a "Build verification testing" project

All subprojects in this project are in one shared git repo.
The remote for this repo is here:

[https://github.com/sumanjs/suman-test-projects](https://github.com/sumanjs/suman-test-projects)

This project and its subprojects are designed to test new installations of Suman to make sure
pre-released and released versions pass basic sanity/smoke checks

The `test-all.js` file at the root has its dependencies populated by the 
following command in `test-all.sh`:

```
npm install -D oresoftware/suman &&  # installs via github, not npm
```