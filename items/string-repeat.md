# String.prototype.repeat()

I came across a coding question where I was required to repeat `#` for n number of times. e.g. `######`

Thanks to this particular question, I was able to find out that such an API existed and certainly has helped me with the question.

One example usage would be (from MDN):

```js
const mood = "Happy! ";

console.log(`I feel ${mood.repeat(3)}`);
// Expected output: "I feel Happy! Happy ! Happy! "
```

And for my particular case, to repeat `#` 6 times, all I needed to do was:

```js
console.log(`${"#".repeat(6)}`);
// Expected output: "######"
```
