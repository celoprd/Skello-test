You'll find 2 parts to this test:

**1/ Questions**

Take a look at questions.txt and answer the questions presented to you

**2/ Sinatra Exercise**

To run the app locally:

```bash
git clone git@github.com:celestin17/Skello-test.git
bundle install
```

In ```config/database.yml```, yield the ```username``` of your local machine for postgresql and a ```password``` if needed.

Then setup the database with:
```
rake db:create
rake db:migrate
rake db:seed
```

Then launch the app:

```
ruby app.rb
Then browse http://localhost:4567/
```

