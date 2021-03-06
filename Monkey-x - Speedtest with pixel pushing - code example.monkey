Import mojo

Class theimage
    Field x:Int
    Field y:Int
    Field image:Image
    Field pixels:Int[]
    Field width:Int
    Field height:Int
    Method New(    x:Int,y:Int,
                width:Int,
                height:Int)
        pixels = New Int[width*height]
        image = CreateImage(width,height)
        Self.x = x
        Self.y = y
        Self.width = width
        Self.height = height
        makeimage
        image.WritePixels(pixels, 0, 0, width, height, 0)
    End Method
    Method makeimage()
        For Local i:Int = 0 Until width*height
            Local col:Int=Rnd(255)
            pixels[i] = argb(col,col,col)
        Next
    End Method
    Method draw()
        DrawImage image,x,y
    End Method
End Class    

Global im1:theimage

Class MyGame Extends App    
    Method OnCreate:Int()
        SetUpdateRate(60)
        Seed = GetDate[5]
        im1 = New theimage(10,20,620,400)
    End Method
    Method OnUpdate()
        im1 = New theimage(10,20,620,400)
    End Method
    Method OnRender:Int()
        Cls
        im1.draw
        SetColor 255,255,255
        DrawText     "Monkey-X - Pixel arrays"+
                    " speedtest ",0,0
        DrawText     "620*400 image with random "+
                    "grey pixels on it being "+
                    "opened in a loop at "+
                    "60 frames per second.",0,420
    End Method    
End Class

Function Main:Int()
    New MyGame()
End Function

Function argb:Int(r:Int, g:Int, b:Int ,alpha:Int=255)
   Return (alpha Shl 24) | (r Shl 16) | (g Shl 8) | b          
End Function

Function getred:Int(rgba:Int)    
    Return((rgba Shr 16) & $FF)    
End Function
              
Function getgreen:Int(rgba:Int)    
    Return((rgba Shr 8) & $FF)    
End Function
    
Function getblue:Int(rgba:Int)    
    Return(rgba & $FF)    
End Function
    
Function getalpha:Int(rgba:Int)    
    Return ((rgba Shr 24) & $FF)    
End Function
