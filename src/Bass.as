package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	public class Bass extends Entity
	{		
		[Embed(source = 'res/bass.png')] private const BASS:Class;

		public var note:Note;
		public function Bass(xin:int, yin:int)
		{
			x = xin;
			y = yin;
			type = "bass";
			setHitbox(20, 20, 10, 10);
			
			graphic = new Image(BASS);
			(graphic as Image).centerOrigin();
		}
		
		override public function added():void 
		{
			note = new Note("bass");
			FP.world.add(note);
		}

		override public function update():void
		{
			super.update();
			
			if (collide("gameentity",x,y))
			{
				play();
				FP.world.remove(this);
			}
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