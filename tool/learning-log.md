# Tool Learning Log

## Tool: **Godot**

## Project: **Maze Game**

---

### 10/20/24:
I started my journey of learning Godot by watching this [Youtube Video](https://www.youtube.com/watch?v=LOhfqjmasi0). Godot is different from the coding tools I used before, I used to just add the CDN into my codespace and work on github. Godot is different however because you have to download their game engine and code in there. I followed the tutorial and downloaded the game engine. Then I started my first project by creating a file inside my godot folder. Now that I am inside the editor, I started to explore around. There are 3 type of scenes and it is the basic to start your project. 2D Scene, 3D Scene and User Interface.

### 10/27/24:
Today I learned how to import assets to Godot. It is really simple and all you have to do is download assets and then just click and drag into godot's files. Then I learned how Godot works and we use nodes which is what you use in godot to make anything. Then you will use scenes to build nodes together into reusable parts. Scenes makes it easy to focus on building one part of the game at a time. We can put scenes inside of scenes which is called nesting.

It is like a scene tree:
Game (Root)
* Player
    * graphics
    * collider
* Enemy



### 11/10/24:
Today I decided to learn how to create a player/character/sprite in Godot.

To start I first added a new node called `CharacterBody2D` and this is what I am going to be testing with today. However with just `CharacterBody2D` won't get me anywhere because it won't do anything if there's no characters. So, I added another node called `AnimatedSprite2D`. Then I can use the inspector bar on the right of the scene to see the properties of the node and change them. Then I added sprite frames from a sprite sheet to `AnimatedSprite2D`. Sprite frames can be added by uploading a spread sheet then I have to set it into grids and click the grids I want for a specific set of animations and then the animation will be added. Now I can press play and there will be an animation playing.


### 11/23/24
Today I continued off of what I learned last time. Last time I created the idle animation for a character. After finishing the node `AnimatedSprite2D` I realized that there's an error on the `CharacterBody2D` which is saying that the node has no shape so the object can't collide with anything. A `CharacterBody 2D` is a physics node and a physics node needs a defined shape node to work with.

Then I added a `CollisionShape2D` node and went to the inspector and added a circle shape ![example of CollisionShape2D](https://media.discordapp.net/attachments/692388669834788955/1310075490718978068/godot-collisionshape2D.png?ex=6743e661&is=674294e1&hm=e2bdf0680c3b87ceaf1a6e6d99c81432212a588c97a702975f89d42af29cdd25&=&format=webp&quality=lossless&width=687&height=358). The circle shape is basically the hitbox of the character and that will be how the chracter collides with objects. Now I save the player and drag it back to the main game scene.

<!--
* Links you used today (websites, videos, etc)
* Things you tried, progress you made, etc
* Challenges, a-ha moments, etc
* Questions you still have
* What you're going to try next
-->
