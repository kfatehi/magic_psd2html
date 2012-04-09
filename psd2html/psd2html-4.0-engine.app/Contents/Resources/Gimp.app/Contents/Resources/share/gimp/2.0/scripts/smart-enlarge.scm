
; Smart Enlarge

; Smart image scaling.
; Requires resynthesizer plug-in.
; Paul Harrison (pfh@logarithmic.net)

(define (duplicate img layer)
  (let*
    (
      (width     (car (gimp-drawable-width layer)))
      (height    (car (gimp-drawable-height layer)))
      (type      (car (gimp-drawable-type  layer)))
      (base-type (car (gimp-image-base-type img)))

      (new-img   (car (gimp-image-new width height base-type)))
      (new-layer (car (gimp-layer-new new-img width height type "Background" 100 0)))
    )

    (gimp-image-add-layer new-img new-layer 0)

    (gimp-edit-copy layer)
    (gimp-floating-sel-anchor (car (gimp-edit-paste new-layer FALSE)))

    new-img
) )

(define (script-fu-smart-enlarge img layer scale-factor)
  (let*
    (
      (width  (car (gimp-drawable-width layer)))
      (height (car (gimp-drawable-height layer)))

      (small (duplicate img layer))
      (large (duplicate img layer))
    )

    (gimp-image-scale small (/ width scale-factor) (/ height scale-factor))
    (gimp-image-scale small width height)
    
    (gimp-image-scale large (* width scale-factor) (* height scale-factor))

    (gimp-display-new large)

    (plug-in-resynthesizer 
      1 
      large
      (car (gimp-image-get-active-layer large))
      0
      0
      0
      (car (gimp-image-get-active-layer img))
      (car (gimp-image-get-active-layer small))
      (car (gimp-image-get-active-layer large))
      1.0 0.117 8 500)

    (gimp-image-delete small)
    
    (gimp-displays-flush)
) )

(script-fu-register "script-fu-smart-enlarge"
                    "<Image>/Filters/Enhance/Smart enlarge..."
		    "Enlarge image, invent high frequency components.

Requires resynthesizer plug-in."
		    "Paul Harrison (pfh@logarithmic.net)"
		    "Paul Harrison"
		    "27/7/2000"
		    "RGB GRAY"
		    SF-IMAGE "Input Image" 0
		    SF-DRAWABLE "Input Layer" 0
		    SF-ADJUSTMENT "Scaling factor" '(2 1 32 0.1 1.0 2 1)
)

