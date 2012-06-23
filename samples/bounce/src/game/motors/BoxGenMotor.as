package game.motors
{
	import game.crates.Box;
	
	import pushrod.commons.motors.CounterMotor;
	import pushrod.core.Crate;
	
	public class BoxGenMotor extends CounterMotor
	{
		public function BoxGenMotor()
		{
			super();
		}
		
		public override function trigger(crate:Crate):void
		{
			crate.machine.addCrate(new Box(), true);
		}
	}
}