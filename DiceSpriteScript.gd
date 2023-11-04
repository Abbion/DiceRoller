extends Sprite2D

@onready var dice_menu = get_node("../DiceMenu")

# Called when the node enters the scene tree for the first time.
func _ready():
	dice_menu.get_popup().connect("id_pressed", onItemPressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onItemPressed(id):
	match id:
		0:
			region_rect.position = Vector2(16, 7)
			region_rect.size = Vector2(230, 240)
		1:
			region_rect.position = Vector2(294, 10)
			region_rect.size = Vector2(200, 205)
		2:
			region_rect.position = Vector2(525, 7)
			region_rect.size = Vector2(230, 240)
		3:
			region_rect.position = Vector2(15, 220)
			region_rect.size = Vector2(230, 400)
		4:
			region_rect.position = Vector2(268, 310)
			region_rect.size = Vector2(230, 300)
		5:	
			region_rect.position = Vector2(514, 317)
			region_rect.size = Vector2(250, 300)
			
