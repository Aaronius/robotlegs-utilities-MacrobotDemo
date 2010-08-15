/*
* Copyright (c) 2010 the original author or authors
* 
* Permission is hereby granted to use, modify, and distribute this file 
* in accordance with the terms of the license agreement accompanying it.
*/
package org.robotlegs.utilities.macrobot.sample.commands
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.robotlegs.utilities.macrobot.AsyncCommand;
	
	public class CommandB extends AsyncCommand
	{
		override public function execute():void
		{
			var timer:Timer = new Timer(50, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);
			timer.start();
		}

		protected function timerCompleteHandler(event:TimerEvent):void
		{
			trace('CommandB complete.');
			dispatchComplete(true);
		}
	}
}