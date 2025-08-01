# Help

## Running the tests

## Setup

Go through the setup [instructions for JavaScript][docs-exercism-javascript] to install the necessary dependencies.

## Requirements

Install assignment dependencies:

```shell
corepack pnpm install
```

If `corepack` complains about not being enabled, you can do so by running:

```bash
corepack enable pnpm
```

## Making the test suite pass

All exercises come with a test suite to help you validate your solution before submitting.
You can execute these tests by opening a command prompt in the exercise's directory, and then running:

```bash
corepack pnpm test
```

In some test suites all tests but the first have been skipped.

Once you get a test passing, you can enable the next one by changing `xtest` to `test`.

## Writing custom tests

If you wish to write additional, custom, tests, create a new file `custom.spec.js`, and submit it with your solution together with the new file:

```shell
exercism submit numbers.js custom.spec.js
```

[docs-exercism-javascript]: https://exercism.org/docs/tracks/javascript/installation

## Submitting your solution

You can submit your solution using the `exercism submit assembly-line.js` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [JavaScript track's documentation](https://exercism.org/docs/tracks/javascript)
- The [JavaScript track's programming category on the forum](https://forum.exercism.org/c/programming/javascript)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

To get help if you're having trouble, you can use one of the following resources:

- [/r/javascript](https://www.reddit.com/r/javascript) is the Javascript subreddit.
- [StackOverflow](https://stackoverflow.com/questions/tagged/javascript+exercism) can be used to search for your problem and see if it has been answered already. You can also ask and answer questions.
- [Github issue tracker](https://github.com/exercism/javascript/issues) is where we track our development and maintainance of Javascript exercises in exercism. But if none of the above links help you, feel free to post an issue here.