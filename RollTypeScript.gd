extends Label

@onready var dice_menu = get_node("../DiceMenu")

# Called when the node enters the scene tree for the first time.
func _ready():
	dice_menu.get_popup().connect("id_pressed", onItemPressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func onItemPressed(id):
	var item_text = dice_menu.get_popup().get_item_text(id)
	text = str("Rolling ", item_text)
