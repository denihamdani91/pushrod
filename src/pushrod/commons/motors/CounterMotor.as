package pushrod.commons.motors
{
	import pushrod.commons.parts.XYPart;
	import pushrod.core.Crate;
	import pushrod.core.IMotor;
	
	public class CounterMotor implements IMotor
	{
		private var counter:XYPart;
		
		public function CounterMotor()
		{
		}
		
		public function update(crate:Crate):void
		{
			counter = crate.getParts("counter") as XYPart;
			if (counter.x > counter.y) {
				trigger(crate);
				counter.x = 0;
			} else counter.x++;
		}
		
		public function trigger(crate:Crate):void
		{
			// here...
		}
	}
}