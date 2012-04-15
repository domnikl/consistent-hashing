consistent-hashing
==================

A generic implementation of the Consistent Hashing algorithm.

Features
--------

* set number of replicas to create multiple virtual points in the ring for each node
* nodes can be arbitrary data (e.g. a Memcache client instance)

Examples
--------

```ruby
ring = ConsistentHashing::Ring.new
ring << "192.168.1.101" << "192.168.1.102"

ring.point_for("foobar") # => 192.168.1.101
ring.delete("192.168.1.101")

# after removing 192.168.1.101, all keys previously mapped to it move clockwise to
# the next node
ring.point_for("foobar") # => 192.168.1.102

ring.nodes # => ["192.168.1.101", "192.168.1.102"]
ring.points # => [#<ConsistentHashing::VirtualPoint>, #<ConsistentHashing::VirtualPoint>, ...]
```

Install
-------

* `[sudo] gem install consistent-hashing`

Author
------

Original author: Dominik Liebler <liebler.dominik@googlemail.com>

License
-------

(The MIT License)

Copyright (c) 2012 Dominik Liebler

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.