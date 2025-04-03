function getAllVariableRefs(_objId) {
    var variableTable = [];
    var arrayNames = variable_instance_get_names(_objId);

    for (var i = 0; i < array_length(arrayNames); i++) {
        var varValue = variable_instance_get(_objId, arrayNames[i]);

        // Skip arrays and strings
        if (is_array(varValue) or is_string(varValue)) {
            continue;
        }
		
        // Push valid variables to the list
        array_push(variableTable, [arrayNames[i], _objId]);
    }

    show_debug_message(variableTable);
    return variableTable;
}

function createDebugSliders(_variableTable) {
    if (array_length(_variableTable) == 0) {
        show_debug_message("No valid variables to create sliders for.");
        return;
    }

    var refList = [];
    for (var i = 0; i < array_length(_variableTable); i++) {
        var ref = ref_create(_variableTable[i][1], _variableTable[i][0]);
        array_push(refList, ref);
    }

    show_debug_message(refList);
    dbg_slider(refList);
}

