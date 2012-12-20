Somewhere
=========
This gem was developed for use in a number of Rails projects. I tend to use addresses all over the place, so this gem handles all the nitpicky class level details for an address object.

Be sure to check out [nybblr.com](http://nybblr.com) for other Rails goodies, and if you're looking for more of my gems (when I get around to it!) surf around my GitHub repos.

Subsection A: Why Somewhere?
----------------------------
If you're not somewhere, you're nowhere. That's a different gem.

Usage
=====
From your ActiveRecord model, simply call the address method:

``` ruby
class User < ActiveRecord::Base
	# Example usages
	address

	address :billing

	address :billing, :postal_code => :zip, :include_prefix => false

end
```

Once you instantiate an Address object, you can convert to a hash:

``` ruby
address.to_hash
address.to_hash :exclude => [:country]
```

Or you can convert to a string:

``` ruby
address.to_s
address.to_s :country => false
address.to_s :delimiter => "\n"
address.to_s :multiline
```
