require 'json'
require 'git_diff_parser'

puts 'hello!'
# puts ENV.inspect
path = ENV['GITHUB_EVENT_PATH']
data = JSON.parse(File.read(path))
diff = `git diff --unified=0 --no-color #{data['pull_request']['base']['sha']}`
patches = GitDiffParser.parse(diff)
p patches
#p `git branch --all`
