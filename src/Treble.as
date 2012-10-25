package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	public class Treble extends Entity
	{		
		[Embed(source = 'res/treble.png')] private const TREBLE:Class;

		public var note:Note;
		public function Treble(xin:int, yin:int)
		{
			x = xin;
			y = yin;
			type = "treble";
			setHitbox(20, 20, 10, 10);
			
			graphic = new Image(TREBLE);
			(graphic as Image).centerOrigin();
		}
		
		override public function added():void 
		{
			note = new Note("treble");
			FP.world.add(note);
		}

		override public function update():void
		{
			if (collide("gameentity",x,y))
			{
				play();
				FP.world.remove(this);
			}
			super.update();
		}
		
		override public function render():void 
		{
			super.render();
		}
		
		public function play():void 
		{
			note.play();
		}
	}
}