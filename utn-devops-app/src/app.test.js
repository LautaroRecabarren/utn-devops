// Ejecuta con: npm test  (usa 'node --test')
import test from "node:test";
import assert from "node:assert/strict";

function sum(a, b) { return a + b; }

test("sum adds numbers", () => {
  assert.equal(sum(2, 3), 5);
});
