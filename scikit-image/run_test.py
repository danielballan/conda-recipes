import skimage._shared.geometry
import skimage._shared.interpolation
import skimage._shared.transform
import skimage.draw._draw
import skimage.feature._brief_cy
import skimage.feature._template
import skimage.feature._texture
import skimage.feature.censure_cy
import skimage.feature.corner_cy
import skimage.filter._ctmf
import skimage.filter._denoise_cy
import skimage.filter.rank.bilateral_cy
import skimage.filter.rank.core_cy
import skimage.filter.rank.generic_cy
import skimage.filter.rank.percentile_cy
import skimage.graph._mcp
import skimage.graph._spath
import skimage.graph.heap
import skimage.io._plugins._colormixer
import skimage.io._plugins._histograms
import skimage.measure._find_contours
import skimage.measure._marching_cubes_cy
import skimage.measure._moments
import skimage.morphology._convex_hull
import skimage.morphology._greyreconstruct
import skimage.morphology._pnpoly
import skimage.morphology._skeletonize_cy
import skimage.morphology._watershed
import skimage.morphology.ccomp
import skimage.morphology.cmorph
import skimage.segmentation._felzenszwalb_cy
import skimage.segmentation._quickshift
import skimage.segmentation._slic
import skimage.transform._hough_transform
import skimage.transform._radon_transform
import skimage.transform._warps_cy

print("skimage.__version__ = %r" % skimage.__version__)
assert skimage.__version__ == '0.9.3'