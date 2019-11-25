

// APPROVED

osc(250, 0.08, 0.2)
.add(noise(5, 2))
.kaleid(16)
.color(0.4, 0, 220)
.out(o0)


osc(6, 0.8, 0.8)
.color(.1, 0.3, 98)
.rotate(0.92, 0.3)
.mult(osc(40, 0.03)
.thresh(0.8).rotate(0, -0.08))
.modulateRotate(osc(20, 0.3, 0)
.thresh(0.3, 0.6), () => 0.1 + mouse.x * 0.002)
.kaleid(4)
.out(o0)

osc(107, 0, 0.7).color(1, 0, 120).rotate(0, -0.02).modulateRotate(o1, 0.4).out(o0)
osc(33).rotate(2, 0.8).modulateRotate(o0, () => (a.fft[0]*2)).out(o1)


// --- END --- //


// a.show();
// a.setBins(4);
// osc(25, (() => a.fft[2]*0.5), 0.8).rotate(1.57).color(255, 0, 0).kaleid(3).kaleid((() => a.fft[2]*3)).out( o0 );
// render(o0);
//
// osc(25, 0.5, 10).color(200, 50, 0).diff(o0).out(o1)
// render(o1)


// a.show(0);
// a.setBins(6);
// console.log(a.fft[1]*2);
// shape(3, 0, 0.8).rotate(180).scale(  () => a.fft[1]*1).out( o0 );
// render(o0);
