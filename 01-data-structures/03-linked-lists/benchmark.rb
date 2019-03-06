require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

List = LinkedList.new
Array = []

Benchmark.bm do |x|
	x.report("Create 10,000 items to Array") {
		n = 0;
		while n < 10000;
			Array.push(n.to_s);
			n += 1;
		end
	}
	x.report("Create 10,000 items to List") {
		n = 0;
		while n < 10000;
			List.add_to_tail( Node.new(n.to_s) );
			n += 1;
		end
	}

	x.report("Access 5,000th item in Array") {
		Array[4999]
	}
	x.report("Access 5,000th item in List") {
		List.find_node(4999.to_s)
	}


	x.report("Remove 5,000th item in Array") {
		Array.delete_at(4999)
	}
	x.report("Remove 5,000th item in List") {
		List.delete( List.find_node(4999.to_s) )
	}
end
