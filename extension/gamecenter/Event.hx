package extension.gamecenter;

import haxe.Json;

class Event {
	public var bubbles : Bool;
	public var cancelable : Bool;
	public var currentTarget : Dynamic;
	public var target : Dynamic;
	public var type : String;
	
	public function new(type : String, bubbles : Bool = false, cancelable : Bool = false) : Void{
		this.type = type;
		this.bubbles = bubbles;
		this.cancelable = cancelable;
	}
	
	public function clone() : Event {
		return new Event( type, bubbles, cancelable );
	}
	
	public function isDefaultPrevented() : Bool{
		return false;
	}
	public function preventDefault() : Void{
		
	}
	public function stopImmediatePropagation() : Void{
		
	}
	public function stopPropagation() : Void{
		
	}
	public function toString() : String{		
		return Json.stringify( this );
	};
	
}
