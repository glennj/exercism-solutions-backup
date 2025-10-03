get_item = getindex
set_item!(stack, position, replacement_card) = setindex!(stack, replacement_card, position)

insert_item_at_top! = push!
insert_item_at_bottom! = pushfirst!

remove_item! = deleteat!
remove_item_from_top!(stack) = remove_item!(stack, length(stack))
remove_item_at_bottom!(stack) = remove_item!(stack, 1)

check_size_of_stack(stack, stack_size) = length(stack) == stack_size