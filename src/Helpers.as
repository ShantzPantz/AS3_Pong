package  
{
	/**
	 * ...
	 * @author Brian Shantz
	 */
	public class Helpers 
	{
		
		public static function randomMinMax(min:Number = 0, max:Number = 1, round:Boolean=false):Number
		{
			return min + (max - min) * Math.random();
		}
		
		public static function trueFalse():Boolean {
			return (Math.random() > 0.5);
		}
		
		public static function degreesToRadians(degrees:Number):Number 
		{
			return degrees * Math.PI / 180;
		}
 
		public static function radiansToDegrees(radians:Number):Number
		{
			return radians * 180 / Math.PI;
		}
		
	}

}