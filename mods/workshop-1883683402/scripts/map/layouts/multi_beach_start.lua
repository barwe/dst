return {
	-- Choose layout type
							type = LAYOUT.STATIC,
							
							layout_position = LAYOUT_POSITION.CENTER,
							
							-- Add any arguments for the layout function
							args = nil,							
							-- Lay the objects in whatever pattern
							layout = 
								{

									multiplayer_portal = {
										{
											x = 0,
											y = 0,
										},
									},
									spawnpoint_master = {
										{
											x = 0,
											y = 0,
										},
									},
								},
								
							-- Either choose to specify the objects positions or a number of objects
							count = nil,
								
							-- Choose a scale on which to place everything
							scale = 1,
}