# Entry 1
##### 11/2/24

The tool I decided on for this year's freedom project was Godot. For this year's freedom project I could literally make anything I want and this made it hard for me to choose what to do. I thought about the possibility I had and I decided to make a game at the end. The two big game engines out there are Godot and Unity. Originally I was planning to use Unity as my tool because it was really popular and I always wanted to try making a game with it. However, the recent Unity update made many tutorial become useless and its hard to code with Unity from scratch now. This made me choose Godot at the end. Godot is a 2D and 3D game engine and I was deciding between making a 2D or 3D game and I ultimately decided to do a 3D game because it is more challenging. The game idea I decided at the end was a first-person shooting game and you just shoot down enemies.

After deciding on my tool, I needed to learn how to use Godot. First I downloaded the game engine then I started to explore around with it. However, I was clueless on what to do next. So I followed a [Youtube Tutorial](https://www.youtube.com/watch?v=LOhfqjmasi0). This video explained the basic of Godot. I learned about 2D Scene, 3D Scene and User Interface. I also learned how to import assets. Then I learned about the foundation of all games on Godot, which is nodes. Nodes is what you use in godot to make anything. Then you will use scenes to build nodes together into reusable parts. Scenes makes it easy to focus on building one part of the game at a time. We can put scenes inside of scenes which is called nesting.

After learning the basic and building an understanding of how the game engine works, I decided to also learn and build an understanding of GDScript, the coding language used in Godot.

I first went to the [Godot GDScript Reference](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html) and I went to look at an example of GDScript on that page.

```py
# Everything after "#" is a comment.
# A file is a class!

# (optional) icon to show in the editor dialogs:
@icon("res://path/to/optional/icon.svg")

# (optional) class definition:
class_name MyClass

# Inheritance:
extends BaseClass


# Member variables.
var a = 5
var s = "Hello"
var arr = [1, 2, 3]
var dict = {"key": "value", 2: 3}
var other_dict = {key = "value", other_key = 2}
var typed_var: int
var inferred_type := "String"

# Constants.
const ANSWER = 42
const THE_NAME = "Charly"

# Enums.
enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}

# Built-in vector types.
var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)


# Functions.
func some_function(param1, param2, param3):
	const local_const = 5

	if param1 < local_const:
		print(param1)
	elif param2 > 5:
		print(param2)
	else:
		print("Fail!")

	for i in range(20):
		print(i)

	while param2 != 0:
		param2 -= 1

	match param3:
		3:
			print("param3 is 3!")
		_:
			print("param3 is not 3!")

	var local_var = param1 + 3
	return local_var


# Functions override functions with the same name on the base/super class.
# If you still want to call them, use "super":
func something(p1, p2):
	super(p1, p2)


# It's also possible to call another function in the super class:
func other_something(p1, p2):
	super.something(p1, p2)


# Inner class
class Something:
	var a = 10


# Constructor
func _init():
	print("Constructed!")
	var lv = Something.new()
	print(lv.a)
```
Using this sample code I was able to learn many syntax used in GDScript and build a foundation in coding with GDScript.

In GDScript, every .gd file represents a class, which can contain data and methods (functions) for game objects, characters, or other elements in the Godot game engine.

I learned that `#` is used for comments. Similar to `//` as comments in java and javascript.

class_name assigns a name to the class and allows it to be referenced easily by other scripts.

```python
# (optional) class definition:
class_name MyClass

# Inheritance:
extends BaseClass
```
Extends is used to indicate inheritance, meaning MyClass inherits properties and methods from BaseClass. So if BaseClass is Node2D, this class would be a type of Node2D and inherit its methods and properties.

In GDScript `var` creates a variable.
```py
var dict = {"key": "value", 2: 3}
var other_dict = {key = "value", other_key = 2}
```
dict and other_dict are dictionaries (key-value pairs) where keys and values can be different types.

`const` are values that cannot be changed once set.

```py
# Built-in vector types.
var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)
```
Vector2 and Vector3 are built-in types for handling 2D and 3D coordinates, used for positions, sizes, or directions in games.

Godot also uses functions, if, else if, else statements:
```py
func some_function(param1, param2, param3):
	const local_const = 5

	if param1 < local_const:
		print(param1)
	elif param2 > 5:
		print(param2)
	else:
		print("Fail!")

	for i in range(20):
		print(i)

	while param2 != 0:
		param2 -= 1

	match param3:
		3:
			print("param3 is 3!")
		_:
			print("param3 is not 3!")

	var local_var = param1 + 3
	return local_var
```
`if-elif-else` checks conditions and executes corresponding code blocks. For and while loop are similar to the loop in java and javascript. `match` is used to match values, in this example it just checks if param3 has a value of 3. `local_var` is a local variable that exists only within this function. `return` exits the function and sends back the value of local_var.

GDScript also have constructors like Java
```py
# Constructor
func _init():
	print("Constructed!")
	var lv = Something.new()
	print(lv.a)
```
_init() is the constructor, which runs automatically when an instance of the class is created.

I still have a lot that I don't understand such as Enums, Overriding functions and inner classes, how to make players in 3D, etc. I need to learn more to be able to make a game and this is what I like about Godot, there are so much to learn and so much you can do with it.

As of now, I am on the first stage of the engineering design process and maybe a bit on the second step. The "problem" I am trying to define is my 3D shooter game because that's what I want to create. To solve this "problem", I need to first learn how to use the Godot game engine and I need to learn a new coding language which is GDScript. There are many things I still haven't learned about GDScript and Godot and I plan on reading through the tutorials and watch some youtube video to get started for this year's freedom project.

The skills I used to make this blog are **how to google**, **consideration** and **how to read**. I had to google a lot to find the correct sources/documentation that I am going to use to study Godot and I need to find the correct tutorials that will help me. The skill "how to read" really comes with "how to google" because after I googled the Godot documentations I had to read it throughly and take down notes so I will understand what everything does and apply it in my project. The skill consideration is very important during the start of the freedom project because I had to really consider what am I going to do and would I like what I am making. I have to pick the right tool for me to use and pick the right amount of workload that I can deal with.




[Next](entry02.md)

[Home](../README.md)