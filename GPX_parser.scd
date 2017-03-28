// 'Satllite Music' GPX parser
//----------------------------

(
SynthDef(\ping,
	{
		var env, osc, noise, out;
		env = EnvGen.kr( Env.perc(0.01, 1, 0.25, -10), doneAction: 2 );
		osc = SinOsc.ar( 440, 0, 0.2 );
		noise = PinkNoise.ar(0.05);
		out = Pan2.ar( Mix.ar( [osc, noise] ), Rand(-1, 1), env);

		Out.ar(0, out);
	}
).add;
)

Synth(\ping);


(
/*var main = {*/

var path, myFile, timeTags, tagExp, fileRead, satellitePings;
// get file path. might be better with 'File.getcwd'?
path = thisProcess.nowExecutingPath.dirname +/+ "2378857.gpx";

fileRead = {

	// GPX file reading operations:
	//-----------------------------

	myFile = File( path, "r" );
	// timetag regex (finds the time sandwiched between 'T' and 'Z'):
	tagExp = "(?<=T)[0-9]{2}:[0-9]{2}:[0-9]{2}(?:\.[0-9]{3})?(?=Z)";
	// get and store all timetags:
	timeTags = myFile.readAllString.findRegexp( tagExp );

	// convert timestamps into seconds:
	//--------------------------------

	timeTags = Array.fill(timeTags.size,
		{
			arg i;
			// separate h, m and s
			var seconds = timeTags[i][1].split($:);
			// convert to seconds:
			(seconds[0].asInteger * 3600) + (seconds[1].asInteger * 60) + seconds[2].asInteger;
		}
	);

	// close file and post timestamps:
	myFile.close;
	timeTags.postln;
};

// cycle through timetags, get delta and schedule next event for this time:
satellitePings = Routine(
	{
		var count, delta, currentTime, nextTime;
		count = 0;

		loop {
			"\nping".postln;
			Synth(\ping);
			currentTime = timeTags[count];
			("current time:" + currentTime).postln;
			nextTime = timeTags[count + 1];
			("next time:" + nextTime).postln;
			delta = nextTime - currentTime;
			("delta:" + delta + "seconds").postln;
			delta.yield;
			count = count + 1;
		}
	}
);

// check if file exists and execute code:
if ( File.exists(path),
	// do:
	{
		fileRead.value;
		SystemClock.sched(0, satellitePings);
	},
	// else:
	{
		postln( "ERROR WILL ROBINSON" )
	}
);

// execute:
/*main.value;*/
)

(
r = Routine(
	{
		var count = 0;
		loop {
			count.postln;
			count = count + 1;
			1.wait;
		}
	}
);

SystemClock.sched(0, r);
)
