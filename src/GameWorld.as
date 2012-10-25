package
{
	import net.flashpunk.*;
	import net.flashpunk.utils.*;
	public class GameWorld extends World
	{
		// ENTITIES
		public static var gameEntity:GameEntity;
		
		// MAGIC NUMBERS
		public static var LBOUND:int = 0;
		public static var RBOUND:int = 4000;
		public static var UBOUND:int = 0;
		public static var DBOUND:int = 4000;
		public static var CAMERASPEED:int = 5.5;
		
		public function GameWorld()
		{
			for (var i:int = 0; i < 60; i++) 
			{
				add( new Treble(FP.rand(RBOUND), FP.rand(DBOUND)));
			}
			
			for (var i:int = 0; i < 15; i++) 
			{
				add( new Bass(FP.rand(RBOUND), FP.rand(DBOUND)));
			}
			
		}
		
		override public function begin():void 
		{
			
			// set camera default position
			FP.camera.x = RBOUND / 2;
			FP.camera.y = DBOUND / 2;
			gameEntity = new GameEntity(RBOUND / 2 + FP.screen.width/2, DBOUND / 2 + FP.screen.height/2);
			add(gameEntity);
			add( new Bass(gameEntity.x + 100, gameEntity.y));
			add( new Treble(gameEntity.x - 100, gameEntity.y));
			add( new Bass(gameEntity.x + 100, gameEntity.y + 300));
			add( new Treble(gameEntity.x - 100, gameEntity.y - 300));
		}
		
		override public function update():void 
		{
			super.update();
			
			moveCameraFromMouse();
			boundCamera();
		}
		
		// Nailed it.
		public function boundCamera():void
		{
			if (camera.x < LBOUND) { camera.x = LBOUND };
			if (camera.x > RBOUND) { camera.x = RBOUND };
			if (camera.y < UBOUND) { camera.y = UBOUND };
			if (camera.y > DBOUND) { camera.y = DBOUND };
		}
		
		// So dope.
		public function moveCameraFromMouse():void
		{
			var xfactor:Number = (Input.mouseX - FP.screen.width/2) / FP.screen.width;
			var yfactor:Number = (Input.mouseY - FP.screen.height/2) / FP.screen.height;
			
			camera.x += xfactor * CAMERASPEED;
			camera.y += yfactor * CAMERASPEED;
		}
	}
}