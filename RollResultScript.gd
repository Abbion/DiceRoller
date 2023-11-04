extends Label

@onready var dice_menu = get_node("../DiceMenu")
@onready var dice_roll_sound : AudioStreamPlayer = get_node("../DiceRollSound")

var maxRoll = 20
var rollTime = 0.0
var rollReady = false
var nextRollTime = 0.0
const rollMaxTime = 3.0
const rollColor = Color(0.8, 0.8, 0.8, 0.6)

func getTimeCurve(arg):
	return pow(10, arg - 2)

# Called when the node enters the scene tree for the first time.
func _ready():
	dice_menu.get_popup().connect("id_pressed", onItemPressed)
	self.label_settings.font_color = rollColor

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rollReady == false:
		if rollTime < rollMaxTime:
			
			if rollTime >= nextRollTime:
				nextRollTime = getTimeCurve(rollTime) + rollTime
				
				var randomRoll = randi_range(1, maxRoll)
				text = str(randomRoll)
				
				dice_roll_sound.play()
				
			rollTime += delta
		else:
			self.label_settings.font_color = Color(1.0, 1.0, 1.0)
			rollReady = true

func _on_roll_button_pressed():	
	rollTime = 0.0
	nextRollTime = 0.0
	rollReady = false
	self.label_settings.font_color = rollColor

func onItemPressed(id):
	var item_text = dice_menu.get_popup().get_item_text(id)
	maxRoll = int(item_text.erase(0))
	self.label_settings.font_color = Color(1.0, 1.0, 1.0)
	text = str("--")
	rollTime = rollMaxTime
