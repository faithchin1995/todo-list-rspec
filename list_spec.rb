require "rspec"
require_relative "list"
require_relative "task"

describe List do
  # Your specs here

  let(:title) {"Things to Complete"}
  let(:tasks) {List.new(title, [Task.new("SDFDF")])}
  let(:lists) {List.new(title, [Task.new("ASDF"), Task.new("GHJK")])}
  let(:objects) {List.new(title, [Task.new("TYUI"), Task.new("QWERTY")])}


 	describe "#initialize" do
 		it "takes title and tasks as an argument" do
 			expect(List.new(title, tasks)).to be_a_kind_of(List)
 		end
 	end


  describe "#add_task" do
  	it "adds a task to tasks array" do
  		expect {tasks.add_task(List.new("test"))}.to change{tasks.tasks.size}.from(1).to(2)
  	end
  end

  describe "#complete_task" do
  	it "returns true if task completed" do

  		tasks.complete_task(0)
  		
  		expect(tasks.complete_task(0)).to be true
  	end
  end 

  describe "#delete_task" do
  	it "returns true if task deleted" do

  		expect{(tasks.delete_task(0))}.to change{tasks.tasks.size}.from(1).to(0) 
  	end
  end

  describe "#count_task" do
  	it "returns number of tasks object" do
  		
  		lists.count_task
  		
  		expect(lists.count_task).to be(2)
  	end
	end

	describe "#incompleted_tasks" do
		it "returns incomplete tasks object" do

			x = lists.incomplete_tasks.size

			expect(x).to be(2)
		end
	end

	describe "#completed_tasks" do
		it "returns completed_tasks object" do

			task1 = Task.new("banana")
			task1.complete!
			task2 = Task.new("apple")

			list = List.new("new",[task1, task2])

			expect(list.completed_tasks.size).to be(1)
		end
	end


end