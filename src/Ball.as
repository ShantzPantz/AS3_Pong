package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Ball extends MovieClip{
		public static const BALL_SIZE:int = 20;
		public static const START_SPEED:int = 8;
		public var vx:Number=0;
		public var vy:Number=0;
		
		public function Ball() {
			// constructor code
			this.graphics.beginFill(0xFFFFFF);
			this.graphics.drawRect(0, 0, BALL_SIZE, BALL_SIZE);
			this.graphics.endFill();
		}
		
		public function update(e:Event):void
		{
			x += vx;
			y += vy;
		}
		
		public function reset(startX:Number, startY:Number):void
		{
			x = startX;
			y = startY;
			
			vx = START_SPEED;
			if (Helpers.trueFalse()) {
				vx *= -1;
			}
			vy = Helpers.randomMinMax(0, START_SPEED);
		}
	
	}
	
}
