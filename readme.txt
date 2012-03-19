Bejeweled Bot, by @Hypn and @RC1140

Target: http://www.onlineflashgames.net/games/2713/bejeweled.html

Info:
* game board is 296x296 pixels
* blocks are 36x36 pixels with 1px border around it
* colours (decimal in brackets):
	0xDF9CE4 = purple (14654692)
	0xF35C2F = red (15948847)
	0xFFEF52 = yellow (16772946)
	0x8EF5FF = blue (9369087)
	0xF7F7F7 = white (16250871)
	0x31A429 = green (371525745)
	0xFD9F44 = orange (14786123589)
* offset X = 19px
* offset Y = 26px

Tools:
* AutoIt: http://www.autoitscript.com/site/autoit/

Functions of interest:
* PixelSearch - finds a pixel of a given colour in a range (http://www.autoitscript.com/autoit3/docs/functions/PixelSearch.htm)
* PixelGetColor - gets the colour of a specific pixel/location (http://www.autoitscript.com/autoit3/docs/functions/PixelGetColor.htm)
* MouseClick - for input and automating playing of the game (http://www.autoitscript.com/autoit3/docs/functions/MouseClick.htm)
* see also "autoit_memory_functions.au3" for reading memory values (determining game state)