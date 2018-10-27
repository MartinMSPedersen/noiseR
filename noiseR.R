# based on the noise function p5js.

make.noise <- function() {

	perlin <- NULL

	f <- function(x, y = 0, z = 0) {

		PERLIN_YWRAPB <- 4
		PERLIN_YWRAP <- bitwShiftL(1,PERLIN_YWRAPB)
		PERLIN_ZWRAPB <- 8
		PERLIN_ZWRAP <- bitwShiftL(1,PERLIN_ZWRAPB)
		PERLIN_SIZE <- 4095

		perlin_octaves <- 4 	  # default to medium smooth
		perlin_amp_falloff <- 0.5 # 50% reduction/octave

		scaled_cosine <- function(i) { 0.5*(1-cos(i*pi)) }

		if (is.null(perlin)) { perlin <<- runif(PERLIN_SIZE+1) }
		x <- abs(x)
		y <- abs(y)
		z <- abs(z)
		xi <- floor(x)
		yi <- floor(y)
		zi <- floor(z)
		xf <- x - xi
		yf <- y - yi
		zf <- z - zi
		r <- 0
		ampl <- 0.5

		o <- 0
		while (o<perlin_octaves) {
			of <- xi + bitwShiftL(yi,PERLIN_YWRAPB) + bitwShiftL(zi,PERLIN_ZWRAPB)

			rxf <- scaled_cosine(xf)
			ryf <- scaled_cosine(yf)

			n1 <- perlin[bitwAnd(of,PERLIN_SIZE)+1]
			n1 <- n1 + rxf * (perlin[bitwAnd((of + 1),PERLIN_SIZE)+1] - n1)
			n2 <- perlin[bitwAnd((of + PERLIN_YWRAP),PERLIN_SIZE)+1]
			n2 <- n2 + rxf * (perlin[bitwAnd((of + PERLIN_YWRAP + 1),PERLIN_SIZE)+1] - n2)
			n1 <- n1 + ryf * (n2 - n1)

			of <- of + PERLIN_ZWRAP
			n2 <- perlin[bitwAnd(of,PERLIN_SIZE)+1]
			n2 <- n2 + rxf * (perlin[bitwAnd((of + 1),PERLIN_SIZE)+1] - n2)
			n3 <- perlin[bitwAnd((of + PERLIN_YWRAP),PERLIN_SIZE)+1]
			n3 <- n3 + rxf * (perlin[bitwAnd((of + PERLIN_YWRAP + 1),PERLIN_SIZE)+1] - n3)
			n2 <- n2 + ryf * (n3 - n2)

			n1 <- n1 + scaled_cosine(zf) * (n2 - n1)

			r <- r + n1 * ampl
			ampl <- ampl *perlin_amp_falloff
			xi <- xi * 2
			xf <- xf * 2
			yi <- yi * 2
			yf <- yf * 2
			zi <- zi * 2
			zf <- zf * 2

			if (xf >= 1.0) {
				xi <- xi + 1
				xf <- xf - 1
			}
			if (yf >= 1.0) {
				yi <- yi + 1
				yf <- yf - 1
			}
			if (zf >= 1.0) {
				zi <- zi + 1
				zf <- zf - 1
			}

			o <- o + 1
		}
	r
	}
	Vectorize(f)
}
