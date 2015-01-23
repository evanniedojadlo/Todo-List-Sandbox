require 'spec_helper'

describe "Editing todo lists" do
	def update_todo_list(options={})
		options[:title] ||= "My todo list"
		options[:description] ||= "This is my todo list."


	within "#todo_list#{todo_list.id}" do
		click_link "Edit"
	end

			within "#todo_list_#{todo_list.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: "New title"
		fill_in "Description", with: "New description"
		click_button "Update Todo list"

	end




	it "updates a todo list successfully with correct information" do
		visit "/todo_lists"
		todo_list = TodoList.create(title: "Groceries", description: "Grocery list.")

		visit "/todo_lists"
		within "#todo_list_#{todo_list.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: "New title"
		fill_in "Description", with: "New description"
		click_button "Update Todo list"

		todo_list.reload #normally used within Tests only

		expect(page).to have_content("Todo list was successfully updated")
		expect(todo_list.title).to eq("New title")
		expect(todo_list.description).to eq("New description")
	end
end
