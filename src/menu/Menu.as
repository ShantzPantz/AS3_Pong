package menu 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author Brian Shantz
	 */
	public class Menu extends Sprite 
	{
		private var _titleTF:TextField;
		private var _desc:TextField;
		private var _btn:Sprite;
		private var _btnLabelTF:TextField;
		
		private var _titleFormat:TextFormat;
		private var _descFormat:TextFormat;
		private var _labelFormat:TextFormat;
		
		public function Menu(title:String="", desc:String="", btnLabel:String="") 
		{
			_titleFormat = new TextFormat("Verdana", 40, 0xFFFFFF);
			_titleFormat.align = TextFormatAlign.CENTER;
			
			_descFormat = new TextFormat("Verdana", 18, 0xFFFFFF);
			_descFormat.align = TextFormatAlign.CENTER;
			
			_labelFormat = new TextFormat("Verdana", 18, 0xFFFFFF);
			_labelFormat.align = TextFormatAlign.CENTER;
			
			this.graphics.lineStyle(1, 0xFFFFFF);
			this.graphics.lineTo(300, 0);
			this.graphics.lineTo(300, 200);
			this.graphics.lineTo(0, 200);
			this.graphics.lineTo(0, 0);
			
			_titleTF = new TextField();
			_titleTF.width = this.width;
			_titleTF.defaultTextFormat = _titleFormat;
			_titleTF.text = title;
			addChild(_titleTF);
			
			_desc = new TextField();
			addChild(_desc);
			
			_btn = new Sprite();
			_btn.graphics.lineStyle(1, 0xFFFFFF);
			_btn.graphics.lineTo(200, 0);
			_btn.graphics.lineTo(200, 40);
			_btn.graphics.lineTo(0, 40);
			_btn.graphics.lineTo(0, 0);
			_btn.x = this.width / 2 - _btn.width / 2;
			_btn.y = this.height - _btn.height - 20;
			_btn.mouseEnabled = true;
			addChild(_btn);
			
			_btnLabelTF = new TextField();
			_btnLabelTF.selectable = false;
			_btnLabelTF.mouseEnabled = false;
			_btnLabelTF.defaultTextFormat = _labelFormat;
			_btnLabelTF.width = _btn.width;
			_btnLabelTF.text = btnLabel;
			_btnLabelTF.y = 5;
			_btn.addChild(_btnLabelTF);
			
			_btn.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
		}
		
		private function onClick(e:MouseEvent):void
		{
			dispatchEvent(new Event("play_game"));
		}
		
		public function set title(t:String):void
		{
			_titleTF.text = t;
		}
		
	}

}