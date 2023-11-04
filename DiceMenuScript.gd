extends OptionButton

func _ready():
	get_popup().add_item("d4")
	get_popup().add_item("d6")
	get_popup().add_item("d8")
	get_popup().add_item("d10")
	get_popup().add_item("d12")
	get_popup().add_item("d20")
	select(5)
	
	get_popup().connect("id_pressed", onItemPressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onItemPressed(id):
	var item_text = get_popup().get_item_text(id)
	text = item_text
