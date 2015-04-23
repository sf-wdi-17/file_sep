#Fi

### File Separation in Ruby (`load`, `require`, and `require_relative`) (10 mins)

Load & require are very similar to the purpose of `require` in Node.js

Before you start using these commands in ruby, it's important to understand what they do and how each one is different:

####`load`
  - This will reload the ruby file every time it's called.
  - Load is typically used for checking for small changes and debugging - does not keep track of whether a file or library has been loaded

####`require`

  - This will load a ruby file ONCE and only once. All subsequent require statements will not reload the file.
  - Doesn't need the .rb file extension, but won't hurt if it's there.
  - Only used to include ruby `gems` that have been installed with `gem`.
    + Don't use `require` to include your own `.rb` files (because when you wrote them, you should use `require_relative` to tell the ruby interpreter where to look for your file.)

####`require_relative`
  - Same as `require`, but will look for the specified `.rb` file *relative* to the file that is making the request.
    + That is, when you use `require_relative`, ruby will start looking for the file in the same directory as the file where you include the `require_relative` statement

### Active Learning: `load` & `require` (10 mins)

Create a class and then include it using both `load` and `require_relative`. Observe the differences in behavior.

  1. Create Person class that has name and age attributes. It will also have a `vote` method. But before the person can `vote`, the method should check to make sure that person is over age 18.
  2. Open pry and `load` this person class.
  3. In `pry`, create a person who is 19 years old.
  4. Try to vote. If everything is set up correctly, this shouldn't be a problem.
  5. Now change the `vote` method in the person class so that the voting age is 21.
  6. `load` the person class. Was this change seen?

Exit `pry` (type `exit`) and then open a new pry REPL (type `pry` at a bash prompt). Now, repeat the steps above starting at Step 2, but this time use `require_relative` rather than `load`. When you change the voting age and re-require the class, are the changes reflected?

### Discussion: `load` & `require` (5 mins)

In small groups, research and discuss the differences between `load` and `require/require_relative`. Try to answer the following:

  - How are `load` and `require` different in practice?
  - In what situations should you use `load`?
  - In what situations should you use `require`?
  - In what situations should you use `require_relative`?

I would like one group to volunteer to explain what they discussed to the rest of the class.

### Exercises:

It's unlikely we'll have time to do [these exercises](ruby_inheritance_exercises.md) in class, but if you can, doing [these exercises](ruby_inheritance_exercises.md) will provide you with some repetition and help you in the long run.


