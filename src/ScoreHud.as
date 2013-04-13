package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Brian Shantz
	 */
	public class ScoreHud extends Sprite 
	{
		private var _score1:TextField;
		private var _score2:TextField;
		private var _format:TextFormat;
		
		public function ScoreHud() 
		{
			
			_format = new TextFormat("Verdana", 32, 0xFFFFFF);
			_format.bold = true;
			
			_score1 = new TextField();
			_score1.defaultTextFormat = _format;
			_score1.x = 100;
			_score1.y = 100;
			_score1.text = "0";
			addChild(_score1);
			
			_score2 = new TextField();
			_score2.defaultTextFormat = _format;
			_score2.x = 500;
			_score2.y = 100;
			_score2.text = "0";
			addChild(_score2);
		}
		
		public function setScore(p1:int, p2:int):void
		{
			_score1.text = p1.toString();
			_score2.text = p2.toString();
		}
		
	}

}