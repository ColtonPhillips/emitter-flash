package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	public class GameEntity extends Entity
	{		
		[Embed(source = 'res/gameentity.png')] private const GAMEENTITY:Class;

		public function GameEntity(xin:int, yin:int)
		{
			x = xin;
			y = yin;
			type = "gameentity";
			setHitbox(20, 20, 10, 10);
			
			graphic = new Image(GAMEENTITY);
			(graphic as Image).centerOrigin();
		}
		
		override public function added():void 
		{
		}

		override public function update():void
		{
			super.update();
			
			moveTowards(FP.world.mouseX, FP.world.mouseY, 3);
		}
		
		override public function render():void 
		{
			super.render();
		}
		
	}
}