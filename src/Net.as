package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Brian Shantz
	 */
	public class Net extends Sprite 
	{
		
		public function Net() 
		{
			var segments:int = 50;
			var segWidth:int = 6;
			var segmentHeight:Number = Math.round(Main.HEIGHT/segments);
			for(var i:uint=0; i<segments; i++){
				if(i%2 == 0){
					this.graphics.beginFill(0xFFFFFF);
					this.graphics.drawRect(Main.WIDTH/2-segWidth/2, segmentHeight*i, 5, segmentHeight);
					this.graphics.endFill();
				}
			}
		}
		
	}

}