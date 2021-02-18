require 'rspec'

class SingleVariableQueue

	def initialize(start)
		# puts 'initializing'
		@queue = start
	end

	def queue
		p @queue
	end

	def enqueue(num_to_queue)
		# puts "queueing #{num_to_queue}"
		if (num_to_queue <= 0) || (num_to_queue.digits.count > 1)
			raise "Invalid integer"
		end

		@queue += (num_to_queue*((10**@queue.digits.count)))

	end

	def dequeue
		# puts 'dequeueing'
		@queue = @queue / 10
	end

	def circular_queue
    rev_num = 0
    temp_num = @queue
    while temp_num > 0 do
        rev_num = rev_num*10 + temp_num%10
        temp_num = temp_num/10
    end
    @queue = rev_num
	end
end

# SAMPLE EXECUTIONS
# queue = SingleVariableQueue.new(3)
# queue.queue
# queue.enqueue(4)
# queue.queue
# queue.enqueue(1)
# queue.queue
# queue.circular_queue
# queue.queue
# queue.dequeue
# queue.queue
# queue.dequeue
# queue.queue


RSpec.describe "SingleVariableQueue" do
 before(:all) do
   @queue = SingleVariableQueue.new(4)
 end 
 it "returns integers only" do
   expect(@queue.queue.is_a?(Integer)).to be true
 end 
 it "enqueues" do
   expect(@queue.enqueue(6)).to eq(64)
   expect(@queue.enqueue(3)).to eq(364)
   expect(@queue.enqueue(7)).to eq(7364)
 end 
 it "dequeues" do
   expect(@queue.dequeue).to eq(736)
   expect(@queue.dequeue).to eq(73)
 end 
 it "circular queues" do
   @queue.enqueue(5)
   # => 573
   @queue.enqueue(9)
   # => 9573   expect(@queue.circular_queue).to eq(3957)
 end 
 it "does not enqueue a non single digit integer" do
   expect {
     @queue.enqueue(42)
   }.to raise_error("Invalid integer")
 end 
 it "does not enqueue zero" do
   expect {
     @queue.enqueue(0)
   }.to raise_error("Invalid integer")
 end
end

