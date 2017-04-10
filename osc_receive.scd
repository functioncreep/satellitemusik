NetAddr.localAddr;

(
SynthDef(\test, {
    var env, sine;

    env = EnvGen.kr(Env.perc(), doneAction: 2);
    sine = SinOsc.ar(mul: env) * 0.3;
    Out.ar(0, Pan2.ar(sine));
}).add;
)

s = Synth(\test);
n = NetAddr.new("127.0.0.1", 7771);

o = OSCFunc({Synth(\test)},'/test', NetAddr.localAddr);

OSCFunc.trace(true);