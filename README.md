# A RESTful forest

Haha, get it?

Anyways, this is the API back end for a solo personal project currently under active development. It's built off [rails-api](https://github.com/rails-api/rails-api) and doesn't involve any unusually complex setup.

Inspired by certain aspects of Dwarf Fortress and Minecraft. At least at first, it'll be a read-only experience where someone can walk through a (hopefully) rich environment, looking closely at objects, their histories, and relationships with each other. I'd love for the API to be fully RESTful and follow HATEOAS, so that someone could explore the forest through the API alone.

I intend on building a decoupled front end for this forest.


Some thoughts and to-dos:
- How are things described?
  - Can you make a gem like Faker that produces words and phrases on demand?
    - Like MyFakerGem::Wolf.describe for example
  - Or maybe you will create decorators for the models that provide this functionality. Maybe *those* decorators will make use of a gem which provides phrases.
- What do the routes look like? Presumably everything will be a GET.
  - What sorts of non-destructive actions exist? In the real world? What about
    - Look
    - Go North, South, etc.
    - Speak, shout, etc.
    - Jump in place
    - Zoom in and out
- Let's make this HATEOAS.
  - Look into the url_for method for this
  - This will probably be achieved by having a "layout" to the responses, where each object description is surrounded or wrapped by endpoint options, e.g. navigation, look, zoom, whatever.
- Consider the chron job that makes things grow and move around. How does it work?
  - It will call every object's #live method, which will be largely custom per model. It will move if it can, it will blah blah blah.
  - Can a free Heroku account even handle chron jobs?