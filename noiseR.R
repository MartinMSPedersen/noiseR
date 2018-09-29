noise <- function(type = "perlin", n1, n2 = NULL, n3 = NULL) {
	if (type == "perlin") {
		return(1)
	}
	if (type == "opensimplex") {
	    	return(1)
	}
	stop("Error. type must be 'perlin' or 'opensimplex'")
}
