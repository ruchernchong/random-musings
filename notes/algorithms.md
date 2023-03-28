# Algorithms

## Recursion

### Factorial

```js
const factorial = (number) => {
  if (number === 2) {
    return 2;
  }

  return number * factorial(number - 1);
};

factorial(5); // 120
```

### Fibonacci

```js
export const fibonacci = (number) => {
  if (number < 2) {
    return number;
  }

  return fibonacci(number - 1) + fibonacci(number - 2);
};

fibonacci(6); // 8
```

## Dynamic Programming
