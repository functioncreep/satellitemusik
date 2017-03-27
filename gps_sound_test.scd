// "Satellite Music" test sounds...
//
// 6 oscillators (each representing one GPS trace)
// slow random panning and amplitude changes
// (to be later mapped to GPS data)

(
Ndef(\osc1, {
	Pan2.ar(SinOsc.ar(110 + 330.rand,
		mul: LFNoise2.kr(0.05, 0.25, 0.25)),
		LFNoise2.kr(0.05)
)}).play;

Ndef(\osc2, {
	Pan2.ar(SinOsc.ar(110 + 330.rand,
		mul: LFNoise2.kr(0.05, 0.25, 0.25)),
		LFNoise2.kr(0.05)
)}).play;

Ndef(\osc3, {
	Pan2.ar(SinOsc.ar(110 + 330.rand,
		mul: LFNoise2.kr(0.05, 0.25, 0.25)),
		LFNoise2.kr(0.05)
)}).play;

Ndef(\osc4, {
	Pan2.ar(SinOsc.ar(110 + 330.rand,
		mul: LFNoise2.kr(0.05, 0.25, 0.25)),
		LFNoise2.kr(0.05)
)}).play;

Ndef(\osc5, {
	Pan2.ar(SinOsc.ar(110 + 330.rand,
		mul: LFNoise2.kr(0.05, 0.25, 0.25)),
		LFNoise2.kr(0.05)
)}).play;

Ndef(\osc6, {
	Pan2.ar(SinOsc.ar(110 + 330.rand,
		mul: LFNoise2.kr(0.05, 0.25, 0.25)),
		LFNoise2.kr(0.05)
)}).play;

NdefMixer(s);
s.scope;
)

Ndef.clear;

