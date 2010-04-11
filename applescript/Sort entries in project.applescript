tell application "TaskPaper"
	tell front document
		
		repeat with each_project in projects
			set entry_names to {}
			set project_name to name of each_project
			
			repeat with each_entry in entries
				set containing_project to containing project of each_entry
				
				if containing_project exists then
					if project_name is name of containing_project then
						set entry_names to entry_names & name of each_entry
					end if
				end if
				
			end repeat
			
			set entry_names to my simple_sort(entry_names)
			
			repeat with i from 1 to count of entry_names
				move entry named (item i of entry_names) to end of entries of project named project_name
			end repeat
			
		end repeat
		
	end tell
end tell

on simple_sort(my_list)
	set the index_list to {}
	set the sorted_list to {}
	repeat (the number of items in my_list) times
		set the low_item to ""
		repeat with i from 1 to (number of items in my_list)
			if i is not in the index_list then
				set this_item to item i of my_list as text
				if the low_item is "" then
					set the low_item to this_item
					set the low_item_index to i
				else if this_item comes before the low_item then
					set the low_item to this_item
					set the low_item_index to i
				end if
			end if
		end repeat
		set the end of sorted_list to the low_item
		set the end of the index_list to the low_item_index
	end repeat
	return the sorted_list
end simple_sort