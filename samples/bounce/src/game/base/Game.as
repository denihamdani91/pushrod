package game.base
{
	import game.machines.BounceMachine;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	internal class Game extends Sprite
	{
		private var bounce:BounceMachine;
		
		public function Game()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			bounce = new BounceMachine(this);
			bounce.start();
		}
	}
}