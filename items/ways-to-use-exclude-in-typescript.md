# Ways to use Exclude in TypeScript by Matt Pocock

Link to blog: [9 ways to use Exclude in TypeScript by Matt Pocock](https://www.totaltypescript.com/uses-for-exclude-type-helper)

This [blog](https://www.totaltypescript.com/uses-for-exclude-type-helper) is really useful for sharing and using the `Exclude` type helper in TypeScript.

## Remove a member of a union

```ts
type Fruit = "apple" | "banana" | "orange";

type Result = Exclude<Fruit, "orange">; // 'apple' | 'banana'
```

The first argument represents the full union. The second argument can be any type even if it does not exist.

```ts
type Result = Exclude<Fruit, "pear">; // 'apple' | 'banana' | 'orange'
```

## Remove multiple members from a union

```ts
type Event = "click" | "focus" | "change" | "abort";

type ClickAndFocusEvent = Exclude<Event, "change" | "abort">; // 'click' | 'focus'
```

We can also use Exclude to remove multiple members from a union. By passing a union to the second argument, we can remove multiple members at once.

```ts
type ClickAndFocusEvent = Exclude<Event, "change" | "abort" | "blur">; // 'click' | 'focus'
```

These are the two examples which I believe can be used quite often. There are 7 more ways we can use the `Exclude` helper as shared in his blog.
