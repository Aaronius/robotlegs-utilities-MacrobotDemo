/*
* Copyright (c) 2010 the original author or authors
* 
* Permission is hereby granted to use, modify, and distribute this file 
* in accordance with the terms of the license agreement accompanying it.
*/
package org.robotlegs.utilities.macrobot.sample.commands
{
	import flash.events.Event;
	
	import org.robotlegs.utilities.macrobot.ParallelCommand;
	import org.robotlegs.utilities.macrobot.SequenceCommand;

	/**
	 * An example of a complex macro command.  The command execution structure looks like this:
	 * 
	 * - sequence
	 *   - command A
	 *   - parallel
	 *     - command B
	 *     - command C
	 *   - command D
	 *   - parallel
	 *     - command E
	 *     - sequence
	 *       - command F
	 *       - command G
	 *     - command H
	 *     - command I
	 *   - command J  
	 */
	public class MyMacroCommand extends SequenceCommand
	{
		public function MyMacroCommand()
		{
			// An example of a command with an injected payload.
			addCommand(CommandA, new Event('w00t'));
			
			var parallel1:ParallelCommand = new ParallelCommand();
			// Command B is an example of an async command and will complete execution 
			// after Command C
			parallel1.addCommandInstance(new CommandB());
			// Command C is an example of a synchronous command that doesn't extend any class (even Command)
			parallel1.addCommandInstance(new CommandC());
			addCommandInstance(parallel1);
			
			// The rest can be combinations of the above examples but are currently here only
			// to demonstrate complex execution structure.
			addCommandInstance(new CommandD());
			
			var parallel2:ParallelCommand = new ParallelCommand();
			parallel2.addCommandInstance(new CommandE());
			
			var sequence:SequenceCommand = new SequenceCommand();
			// This sequence command is set to atomic = true which means if one command fails
			// then it will not execute subsequence commands.  By default, atomic = false.
			// Command F is set to fail, so Command G will not be executed.
			sequence.atomic = true;
			sequence.addCommandInstance(new CommandF());
			sequence.addCommandInstance(new CommandG());
			parallel2.addCommandInstance(sequence);
			
			parallel2.addCommandInstance(new CommandH());
			parallel2.addCommandInstance(new CommandI());
			addCommandInstance(parallel2);
			
			addCommandInstance(new CommandJ());
		}
	}
}