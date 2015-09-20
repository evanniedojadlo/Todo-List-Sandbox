require 'spec_helper'

describe "Viewing todo items" do 
	let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries") }
	it "displays no items when a todo list is empty" do
		visit "/todo_lists"
	end
end