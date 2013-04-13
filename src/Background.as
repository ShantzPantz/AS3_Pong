package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Brian Shantz
	 */
	public class Background extends Sprite 
	{
		
		public function Background() 
		{
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0, 0, Main.WIDTH, Main.HEIGHT);
			this.graphics.endFill();
		}
		
	}

}