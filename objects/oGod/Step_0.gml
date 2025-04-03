// Get mouse position
var mouseX = device_mouse_x(0);
var mouseY = device_mouse_y(0);

if (mouse_check_button_pressed(mb_left)) {
    show_debug_message("Mouse clicked");

    // Find the nearest instance of pEntity
    var clickedInst = instance_nearest(mouseX, mouseY, pEntity);
    if (instance_exists(clickedInst)) {
        show_debug_message("Clicked on instance: " + string(clickedInst));
        
        // Create and initialize the global debug sections map if it doesn't exist
        if (!variable_global_exists("dbgSections")) {
            global.dbgSections = ds_map_create();
        }
        
        // Use a unique key for the instance (using its string id)
        var key = string(clickedInst);
        
        // Check if a debug section for this instance already exists
        if (!ds_map_exists(global.dbgSections, key)) {
            // Create a new debug section for this instance
            var newSection = dbg_section(key);
            ds_map_add(global.dbgSections, key, newSection);
            
            // Retrieve variables and create debug sliders
            var varTable = getAllVariableRefs(clickedInst);
            createDebugSliders(varTable);
        } else {
            show_debug_message("Debug section already exists for this instance.");
        }
    }
}
