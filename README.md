# noiseR
Perlin noise function in R

* https://en.wikipedia.org/wiki/Perlin_noise
  * https://github.com/processing/p5.js/blob/master/src/math/noise.js
  * https://stackoverflow.com/questions/15387328/realistic-simulated-elevation-data-in-r-perlin-noise

This is based on the noise() function in p5js.

Compare this:
`
n <- make.noise()
i <- 1:1000*0.01
plot(n(i), type = 'l')
`

With this:
`
plot(runif(1000), type = 'l')
`


Perlin noise is a random sequence generator producing a more natural ordered, harmonic
succession of numbers compared to the a standard random function.
It was invented by Ken Perlin in the 1980s and been used since in graphical applications to produce procedural textures, natural motion,
shapes, terrains etc.

The main difference to a random function is that Perlin noise is defined in an infinite
n-dimensional space where each pair of coordinates corresponds to a fixed semi-random value
(fixed only for the lifespan of the program
This code can compute 1D, 2D and 3D noise, depending on the number of coordinates given. 
The resulting value will always be between 0.0 and 1.0. 
The noise value can be animated by moving through the noise space.
The 2nd and 3rd dimension can also be interpreted as time.
The actual noise is structured similar to an audio signal, in respect to the function's use of frequencies. 
Similar to the concept of harmonics in physics, perlin noise is computed over several octaves which are added
together for the final result. 

Another way to adjust the character of the resulting sequence is the scale of the input
coordinates. As the function works within an infinite space the value of the coordinates doesn't matter as such, only the distance between
successive coordinates does. As a general rule the smaller the difference between coordinates,
the smoother the resulting noise sequence will be. Steps of 0.005-0.03
work best for most applications, but this will differ depending on use.
