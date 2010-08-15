/*
* Copyright (c) 2010 the original author or authors
* 
* Permission is hereby granted to use, modify, and distribute this file 
* in accordance with the terms of the license agreement accompanying it.
*/
package org.robotlegs.utilities.macrobot.sample.commands
{
	import flash.events.Event;
	
	import org.robotlegs.utilities.macrobot.AsyncCommand;
	
	public class CommandA extends AsyncCommand
	{
		[Inject]
		public var event:Event;
		
		override public function execute():void
		{
			trace('CommandA complete.', event.type);
			dispatchComplete(true);
		}
	}
}