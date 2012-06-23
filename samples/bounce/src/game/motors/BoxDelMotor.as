package game.motors
{
	import pushrod.commons.motors.CounterMotor;
	import pushrod.core.Crate;
	
	public class BoxDelMotor extends CounterMotor
	{
		public function BoxDelMotor()
		{
			super();
		}
		
		public override function trigger(crate:Crate):void
		{
			crate.machine.reset();
		}
	}
}