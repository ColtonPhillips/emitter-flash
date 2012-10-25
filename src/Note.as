package
{
	import net.flashpunk.debug.Console;
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	public class Note extends Entity
	{
		[Embed(source = 'res/bass/a.mp3')] public static const B_A:Class;
		[Embed(source = 'res/bass/b.mp3')] public static const B_B:Class;
		[Embed(source = 'res/bass/c.mp3')] public static const B_C:Class;
		[Embed(source = 'res/bass/d.mp3')] public static const B_D:Class;
		[Embed(source = 'res/bass/e.mp3')] public static const B_E:Class;
		[Embed(source = 'res/bass/f.mp3')] public static const B_F:Class;
		[Embed(source = 'res/bass/g.mp3')] public static const B_G:Class;
		[Embed(source = 'res/bass/a1.mp3')] public static const B_A1:Class;
		
		[Embed(source = 'res/treble/a.mp3')] public static const T_A:Class;
		[Embed(source = 'res/treble/b.mp3')] public static const T_B:Class;
		[Embed(source = 'res/treble/c.mp3')] public static const T_C:Class;
		[Embed(source = 'res/treble/d.mp3')] public static const T_D:Class;
		[Embed(source = 'res/treble/e.mp3')] public static const T_E:Class;
		[Embed(source = 'res/treble/f.mp3')] public static const T_F:Class;
		[Embed(source = 'res/treble/g.mp3')] public static const T_G:Class;
		[Embed(source = 'res/treble/a1.mp3')] public static const T_A1:Class;
		[Embed(source = 'res/treble/b1.mp3')] public static const T_B1:Class;
		[Embed(source = 'res/treble/c1.mp3')] public static const T_C1:Class;
		[Embed(source = 'res/treble/d1.mp3')] public static const T_D1:Class;
		[Embed(source = 'res/treble/e1.mp3')] public static const T_E1:Class;
		[Embed(source = 'res/treble/f1.mp3')] public static const T_F1:Class;
		[Embed(source = 'res/treble/g1.mp3')] public static const T_G1:Class;
		[Embed(source = 'res/treble/a2.mp3')] public static const T_A2:Class;
		
		//public static var trebleArray:Array = [T_A, T_B, T_C, T_D, T_E, T_F, T_G, T_A1, T_B1, T_C1, T_D1, T_E1, T_F1, T_G1, T_A2];
		//public static var bassArray:Array = [B_A, B_B, B_C, B_D, B_E, B_F, B_G, B_A1 ];
		
		public static var trebleArray:Array = [T_A, T_C, T_D, T_E, T_G, T_A1,  T_C1, T_D1, T_E1, T_G1, T_A2];
		public static var bassArray:Array = [B_A, B_C, B_D, B_E, B_G, B_A1 ];
		
		
		public var note:Sfx;
		
		public var ATTENUATIONFACTOR:Number = 1000;

		public function Note(instrument:String)
		{
			if (instrument == "treble") {
				var index:Class = trebleArray[FP.rand(trebleArray.length - 1)];
				note = new Sfx(index);
			}
			else
			{
				var index:Class = bassArray[FP.rand(bassArray.length - 1)];
				note = new Sfx(index);
			}
		}

		override public function update():void
		{
		}
		
		public function play():void 
		{
			// TODO: WHY DOESN'T THIS WORK :<
			var thevolume:Number = ATTENUATIONFACTOR / distanceToPoint(FP.camera.x + FP.screen.width / 2, FP.camera.y + FP.screen.height / 2);
			if (thevolume > 0.9) { thevolume = 0.9;  }
			
			note.play(thevolume);
			FP.console.log("the for real volume: " + note.volume);
		}
	}
}