package org.robotlegs.utilities.macrobot.sample
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.macrobot.sample.commands.MyMacroCommand;
	
	public class AppContext extends Context
	{
		override public function startup():void
		{
			commandMap.mapEvent('runMacro', MyMacroCommand);
			dispatchEvent(new Event('runMacro'));
		}
	}
}