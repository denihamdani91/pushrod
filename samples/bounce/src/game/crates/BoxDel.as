package game.crates
{
	import game.motors.BoxDelMotor;
	
	import pushrod.commons.parts.XYPart;
	import pushrod.core.Crate;
	
	public class BoxDel extends Crate
	{
		public function BoxDel()
		{
			super();
		}
		public override function init():void
		{
			addParts("counter", new XYPart(0,600));
			setProcedure([BoxDelMotor]);
		}
	}
}