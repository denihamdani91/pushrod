package game.base
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import starling.core.Starling;
	
	[SWF(width="640", height="480", frameRate="60")]
	public class Bounce extends Sprite
	{
		private var st:Starling;
		
		public function Bounce()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			st = new Starling(Game, stage);
			st.antiAliasing = 2;
			st.showStats = true;
			st.start();
		}
	}
}