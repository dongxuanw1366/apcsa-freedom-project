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

Then I added a `CollisionShape2D` node and went to the inspector and added a circle shape ![example of CollisionShape2D](godot-collisionshape2D.png). The circle shape is basically the hitbox of the character and that will be how the chracter collides with objects. Now I save the player and drag it back to the main game scene.

### 12/7/24
After I made a player in my game, I need to add a camera to control what is being shown. I added a new node called `Camera2D` after adding the node I noticed a large view port around the player and I think it is way too large. So I learned to use the zoom feature in the inspector for `Camera2D`. The default was 1 by 1, so I tried to make it 4 by 4. I realized that as the number goes up the view port gets smaller. Now I can run my game and see that there's a sprite playing an idle animation.

### 12/31/24
Today I added a script for player movement in godot and I did it using the base template script that godot provides. When I added the physics and run the game, the character just falls down because there's no ground for it to collide with.

![Adding script in Godot](godot-script.png)

Then I learned to add a new node called `StaticBody2D`. This node is another physics body and it is used for non-moving objects that's why it is called static body. However, this body also needs a `CollisionShape2D` in order to function properly. This time I set the collision shape as a `WorldBoundaryShape2D`. This way the character will have a ground to stand on that extends infinitely in the direction you want.

![WorldBoundaryShape2D example](worldboundary2d.png)


Now that my character have a platform to move on I can use my arrow keys to control and my character and move it around.





<!--
* Links you used today (websites, videos, etc)
* Things you tried, progress you made, etc
* Challenges, a-ha moments, etc
* Questions you still have
* What you're going to try next
-->
