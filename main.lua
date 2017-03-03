local back = display.newImage("background.png", 160, 240)
local object = display.newImage("octohedron.png", 160, 240)

local texter = [[● It is certain
● It is decidedly so
● Without a doubt
● Yes definitely
● You may rely on it
● As I see it, yes
● Most likely
● Outlook good
● Yes
● Signs point to yes
● Reply hazy try again
● Ask again later
● Better not tell you now
● Cannot predict now
● Concentrate and ask again
● Don't count on it
● My reply is no
● My sources say no
● Outlook not so good
● Very doubtful
Hell no
Hell yes
Maybe
Just give up]]
function string:split( inSplitPattern, outResults )
 
   if not outResults then
      outResults = {}
   end
   local theStart = 1
   local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
   while theSplitStart do
      table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
      theStart = theSplitEnd + 1
      theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
   end
   table.insert( outResults, string.sub( self, theStart ) )
   return outResults
end

local new_texts = texter:split("\n");

function trimmit(t, patt, start, finish)
	for i=1,table.getn(t) do
		if(string.sub(t[i], start, finish)== patt) then
			t[i] = string.sub(t[i], finish)
		end
	end
end

object.name = "octohedron object"
trimmit(new_texts, "● ", 1, 4)
local function onObjectTap( event )
	back:toFront()
	object:toFront()
	transition.to( object, nil )
	math.randomseed(os.time())
 --[.. concats 2 strings] Make tilting(gyroscope) correspond to action
    display.newText( new_texts[math.random(table.getn(new_texts))], 160, 240, native.systemFont)
    return true
end
object:addEventListener( "tap", onObjectTap )
--[: intended as object method.]
