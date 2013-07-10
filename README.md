* What you need to start:
- Install ruby >= 1.9.3
- Install bundle: sudo gem install bundler --no-rdoc --no-ri
- Install openssl for ruby: sudo apt-get install libopenssl-ruby
- Install mysql client: sudo apt-get install libmysqlclient-dev
- Install xvfb for headless tests: sudo apt-get install xvfb
- run: bundle install

...you should be ready to go, bundle will take care or installing all you need.

Now you can run the tests just typing in:
1) 'cucumber' if you want to run you tests locally
2) 'cucumber --profile=sauce' if you want to run your test on SauceLabs 
