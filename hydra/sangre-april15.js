// APPROVED

osc(20, 0.7, 30).color(10, 0, 0).pixelate(30, 80).kaleid(4).out(o0)
render(o0)

osc(4, 0.4, 0.2)
.color(0.80, 0, 1)
.rotate(0.30, 0.1).pixelate(30, 20).diff(o0).kaleid(6).out(o1)
render(o1)

osc(6, 0.6, 0.8)
.color(220, 0.3, 0.3)
.rotate(0.92, 0.3)
.mult(osc(40, 0.03)
.thresh(0.8).rotate(0, -0.02))
.modulateRotate(osc(20, 0.3, 0).thresh(0.3, 0.6), () => 0.1 + mouse.x * 0.002)
.kaleid(3)
.out(o0)




// --- END --- //

voronoi((Math.sin(time*100)), 0.01).color(235,2,2).out(o0)

voronoi((Math.sin(24)), 0.1).color(235,2,2).out()

voronoi(Math.floor((Math.random() * 0.1) + 0.2), (Math.sin(time*1))).color(235,2,2).out()

console.log((Math.sin(time*10)))

console.log(time)



osc(20, 0.1, 30).color(10, 0, 0).out(o0)
render(o0)



// // SAFE
//
// voronoi((Math.sin(time*100)), 0.5).color(235,2,2).out()
//
// voronoi((Math.sin(24)), 0.5).color(235,2,2).out(o0)
//
// voronoi(Math.floor((Math.random() * 10) + 2), (Math.sin(time*10))).noise(1, 0.5).color(235,2,2).out()
//
// console.log((Math.sin(time*10)))
//
//
//
// osc(20, 0.1, 30).color(10, 0, 0).out(o0)
// render(o1)
//
gradient(2)
.color(10, 0, 0)
.out(o0);
//
//
// console.log((Math.floor((Math.random() * 250) + 200)))
//
//
//
