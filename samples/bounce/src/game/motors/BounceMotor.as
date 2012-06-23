package game.motors
{
	import pushrod.commons.parts.XYPart;
	import pushrod.core.Crate;
	import pushrod.core.IMotor;
	
	public class BounceMotor implements IMotor
	{
		private var position:XYPart;
		private var state:XYPart;
		
		public function BounceMotor()
		{
		}
		
		public function update(crate:Crate):void
		{
			position = crate.getParts("position") as XYPart;
			state = crate.getParts("state") as XYPart;
			
			if (position.x > 540) state.x = -1;
			else if (position.x < 0) state.x = 1;
			
			if (position.y > 380) state.y = -1;
			else if (position.y < 0) state.y = 1;
			
			position.x += 10 * state.x;
			position.y += 10 * state.y;
		}
	}
}