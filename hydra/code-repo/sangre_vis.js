osc(2, 0.5, 1).color(1, 3, 3).rotate(0.2, 0.1)
.pixelate(10, (Math.random()*4))
.kaleid(3)
.modulate(o0)
.out(o0)

osc(4, 1, 0.2)
.color(1.04 ,0, 1.1)
.rotate(0.30, 0.1)
.pixelate(30, 20)
.kaleid(8)
.out(o0)

// a.show();
// a.setBins(4);
// osc(25, (() => a.fft[2]*0.5), 0.8)
// .rotate(1.57)
// .color(255, 0, 0)
// .kaleid(3)
// // .kaleid((() => a.fft[2]*3))
// .out( o0 );
// render(o0);
//
// osc(25, 0.5, 10)
// .color(200, 50, 0)
// .diff(o0)
// .out(o1)
// render(o1)


voronoi((() => Math.sin(time)), 0.5)
.color(255,2,2)
.out()


a.show();
a.setBins(4);
shape(  () => Math.sin(time) )
.rotate(
  () => (a.fft[2]*5) + (Math.sin(time))
)
.scale(
  () => a.fft[2]*5
)
.out( o0 );
render(o0);


























// a.show();
// a.setBins(4);
// osc(0.1, 0.3, (() => a.fft[0]*10))
// .color(255, 0, 2)
// .out( o0 );
// render(o0);

a.show();
a.setBins(4);
shape( 3 )
.color(255,2,2)
.rotate(
  () => Math.PI * mouse.x / 180
)
.repeatX( 3 )
.repeatY( 3 )
.scale(
  () => a.fft[2]*5
)
.out( o0 );
render(o0);
