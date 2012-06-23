package game.crates
{
	import game.motors.BoxGenMotor;
	
	import pushrod.commons.parts.XYPart;
	import pushrod.core.Crate;
	
	public class BoxGen extends Crate
	{
		public function BoxGen()
		{
			super();
		}
		
		public override function init():void
		{
			addParts("counter", new XYPart(0,60));
			setProcedure([BoxGenMotor]);
		}
	}
}