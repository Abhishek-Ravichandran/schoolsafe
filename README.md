# SchoolSafe - Rails App for CIS 557 Project

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rake db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rake test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```