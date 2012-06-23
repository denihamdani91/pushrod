package pushrod.commons.parts
{
	import pushrod.core.IPart;
	
	public class XYPart implements IPart
	{
		public var x:Number;
		public var y:Number;
		
		public function XYPart(x:Number=0, y:Number=0)
		{
			this.x = x;
			this.y = y;
		}
	}
}