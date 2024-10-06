
function inv_search(_object,_item){
	for (var i = 0; i < INV_SPACE; i++)
	{
		if (_object.inventory[i] == _item)
		{
			return(i); 	
		}
	}
	return(-1); 
}

function inv_add(_object,_item)
{
	var slot = 0;
	for (var i = 0; i < INV_SPACE; i++)
	{
			
		if (_object.inventory[i] == _item && _object.max_stack[i] > _object.stack[i])
		{
			slot = i; 	
			break;
		}
		else
		{
			slot = -1;	
		}
	}

	if (slot == -1)
	{
		slot = inv_search(_object, -1);
	}
	
	if (slot != -1)
	{
		with (_object)
		{
			inventory[slot] = _item;
			_object.stack[slot]++;
			return(true);
		}
	}
	else
	{
		return(false); 	
	}
}

function inv_remove(_object,_item,ammount)
{
	var item_slots = array_create(0,-1);
	for (var i = 0; i < INV_SPACE; i++)
	{
		if (_object.inventory[i] == _item)
		{
			array_push(item_slots,i);	
		}
	}
	for (var c = 0; c < array_length(item_slots); c++)
	{
		if (ammount > _object.stack[item_slots[c]])
		{
			ammount -= _object.stack[item_slots[c]];
			_object.stack[item_slots[c]] = 0;
			_object.inventory[item_slots[c]] = -1;
		}
		else
		{
			_object.stack[item_slots[c]] -= ammount;
			return(true);
		}	
	}
	
}

function inv_swap(obj_from,slot_from,obj_to,slot_to)
{
	var item_from = obj_from.inventory[slot_from];
	obj_from.inventory[slot_from] = obj_to.inventory[slot_to];
	obj_to.inventory[slot_to] = item_from;
	
	var stack_from = obj_from.stack[slot_from];
	var stack_to = obj_to.stack[slot_to];
	obj_from.stack[slot_from] = stack_to;
	obj_to.stack[slot_to] = stack_from;
}

function has_enough_items(_recipe)
{
	
	for (var i = 0; i < NUMBER_OF_UNIQUE_ITEMS; i++)
	{
		var ammount = 0;
		if (_recipe[# i,0] > 0)
		{
			for (var c = 0; c < INV_SPACE; c++)
			{
				if (obj_inventory.inventory[c] == i)
				{
					ammount += obj_inventory.stack[c];
				}
			}
			if (ammount < _recipe[# i,0])
			{
				return(false);
			}
			
		}
	}
	return(true);
}

