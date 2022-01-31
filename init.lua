minetest.register_privilege("pinv", "Allow viewing other players' inventory")
minetest.register_chatcommand("pinv", {
  description = "View online player's inventory",
  params = "<playername>",
  privs = {pinv=true},
  func = function(name, param)
local detached_inv = minetest.create_detached_inventory(param,{
  allow_move = function()
    	return 0
	end,
	allow_put = function()
    	return 0
	end,
	allow_take = function()
		return 0
	end,})
local player_inv = minetest.get_inventory({type='player', name = param})
if not player_inv then return false else
detached_inv:set_list('main', player_inv:get_list('main'))
minetest.show_formspec(name,'pinv','size[8,4]'..'list[detached:'..param..';main;0,0;8,4;]')
end end,})
