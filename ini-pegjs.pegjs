{
    var _ = require('lodash')
    var pair = require('./pair')
}

Data = ss:Section+
    { return _.extend.apply(null, ss) }

Section = h:Header ps:Property+
    { return pair(h, _.object(ps)) }

Header = "[" cs:Chars "]" Nl
    { return cs }

Property = k:Chars "=" v:Chars Nl
    { return [k, v] }

Chars = cs:[a-zA-Z0-9]+
    { return cs.join('') }

Nl = [\n]
