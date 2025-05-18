extends RichTextLabel

var credits_file_path = "res://README.md"

func _ready():
	var text_content = get_text_file_content(credits_file_path)
	self.text = text_content.split("## Credits\n")[1]

func get_text_file_content(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	return file.get_as_text()
