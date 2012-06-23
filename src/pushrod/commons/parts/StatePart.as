package pushrod.commons.parts
{
	import pushrod.core.IPart;
	
	public class StatePart implements IPart
	{
		public var value:uint;
		
		public function StatePart(value:Number=0)
		{
			this.value = value;
		}
	}
}