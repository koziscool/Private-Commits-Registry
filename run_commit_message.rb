
require 'time'

x = Time.new(2004, 3, 11).xmlschema.to_s


`git add -A`
`git commit -m "random message" --date #{x}`
`git push origin master`
# %x( cmd )

