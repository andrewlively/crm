import test from 'ava';
import Customer from '../src/libs/Customer';

test(`try to create with bad data`, t => {
  t.throws(Customer.create());
});
