
require 'time'

x = Time.new(2004, 3, 11).xmlschema.to_s


puts`git add -A`
puts`git commit -m "random message" --date #{x}`
puts`git status`
# %x( cmd )

