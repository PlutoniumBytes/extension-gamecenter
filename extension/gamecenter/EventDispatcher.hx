package extension.gamecenter;

import haxe.Json;

/*
 * Quick & dirty implementation of a platform independent EventDispatcher
 * */
class EventDispatcher 
{
	private var listeners:Array<Dynamic> = new Array<Dynamic>();
	
	public function new ():Void{
		
	}
	
	public function addEventListener(type : String, listener : Dynamic -> Void, useCapture : Bool = false, priority : Int = 0, useWeakReference : Bool = false) : Void	{
		removeEventListener( type, listener, useCapture );
		listeners.push( {
			type: type,
			listener: listener,
			useCapture: useCapture,
			priority: priority,
			useWeakReference:useWeakReference
		} );
	}
	
	public function dispatchEvent(event : Event) : Bool	{
		var ret = false;
		for ( listener in listeners )
		{
			if ( listener.type == event.type ) {
				event.currentTarget = event.target = this;
				listener.listener( event );
				ret = true;
			}
		}
		return ret;
	}
	
	public function hasEventListener(type : String) : Bool{
		for ( listener in listeners ) {
			if ( listener.type == type ) {
				return true;
			}
		}
		return false;
	}
	
	public function removeEventListener(type : String, listener : Dynamic -> Void, useCapture : Bool = false) : Void {
		for ( entry in listeners )
		{
			if ( entry.type == type && entry.listener == listener && entry.useCapture == useCapture ) {
				listeners.remove( entry );
			}
		}
	}
	
	public function toString() : String
	{
		return Json.stringify( this );		
	}
	
	public function willTrigger(type : String) : Bool	{
		return hasEventListener( type );
	}
}
