var _ = require('lodash');
var assert = require('assert');
var fs = require('fs');
var pair = require('./pair');
var P = require('./ini-pegjs');
var J = require('./ini-jison');
J.parser.yy = {
    extend: _.extend,
    object: _.object,
    pair: pair
};
var ini = fs.readFileSync('data.ini', 'utf-8');
var d1 = P.parse(ini);
var d2 = J.parse(ini);
assert.deepEqual(d1, d2);
console.log(JSON.stringify(d1, null, 4));
