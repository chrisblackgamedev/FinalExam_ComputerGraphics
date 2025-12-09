For this final exam I have recreated a Pac-Man level in 3d using shaders to enhance the overall visual style of the game. 

The shaders I've used are as follows: 

Hologram Shader: Used on my Pac-Man Character, ghosts and wall objects to give a distinct glow to the objects. While the original hologram shader we went over was higly transparent, I modified the settings of mine to give a brighter, more full glow which gives good highlights to the various objects it's used on. This was changed by directly editing the values of the power and fade nodes.

https://raw.githubusercontent.com/chrisblackgamedev/FinalExam_ComputerGraphics/main/Screenshots/mrman.png


Scrolling texture shader: Used on my background plane. This shader adds a discrete but aesthetically pleasing background whereas the original was plain black. For this I created my own texture for the background scroll, and edited the values in the code to give a slower, crawling pace for the scroll. 

https://raw.githubusercontent.com/chrisblackgamedev/FinalExam_ComputerGraphics/main/Screenshots/scrollingBG.png


Specular Lighting model: From the first half of the course, the specular lighting model provides a different look for my spherical coins, adding to the 3D enhancement of the game. For this I utilized a bright base color and modified some of the code to enhance the bridghtness of the provided lighting.

https://raw.githubusercontent.com/chrisblackgamedev/FinalExam_ComputerGraphics/main/Screenshots/specular.png


Color Correction Shader: Lastly, I utilized color correction on my larger sphere coins to achieve the pink effect seen in game. This provides a distinct look from the regular coins while maintaining the visibility of the object. This was different from what we did in class as I created custom textures for use in the correction, as well as only implementing it on a single object, rather than over the camera, thus adding a filter to the object, not the entire scene. ////!!!! This shader worked in the unity project but doesnt appear in my build. Based on the shader graph I used I predict it either came from issues with how the shader was layered over the object or it was an issue with the Plane not being viewable by the camera after switching to the full screen view of the build.

https://raw.githubusercontent.com/chrisblackgamedev/FinalExam_ComputerGraphics/main/Screenshots/colorCorrection.png

https://raw.githubusercontent.com/chrisblackgamedev/FinalExam_ComputerGraphics/main/Screenshots/colorcorrectioncode.png
