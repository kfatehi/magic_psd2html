# Magic CS6 PSD to HTML Converter

## Magic consists of the following:
* An applescript (by jsilverMDX) which orchestrates a few other scripts, specific to Photoshop and Gimp, and a special last step "Reshuffler" that happens over HTTP to a Heroku rails app controller with [a bit of extra logic](https://github.com/mdks/Reshuffler/blob/master/app/controllers/main_controller.rb) to finalize the process.
* An objective-c wrapper that produces a mac application enabling drag & drop and status reporting of the underlying script activities.

## Usage
Compile it, then drag and drop your PSD file(s) onto the magic kettle.

## Requirements:
Adobe Photoshop CS5 or CS6

## Notes:
Currently the applescript is hard-set to the photoshop directory, you can edit the script and fix this -- however CS5 and CS6 are both tested.

For best results use CS5, as it had been battle-tested. CS6 was only briefly tested as I put up this repo and did not succeed through the entire applescript execution.
