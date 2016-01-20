require 'time'
require 'github_api'
require 'figaro'
require 'pp'

class GithubPrivateCommitter
  USER_NAME = 'koziscool'
  def initialize
    Figaro.application = Figaro::Application.new( {
      environment: "development",
      path:"./config/application.yml"} )
    Figaro.load
    @github = Github.new(oauth_token: Figaro.env.github_key)
  end
  def all_commits(commits)
    commits.each do |commit|
      commit["commit"]["message"]
    end
  end
  def committer(time)
    readme = File.open("README.md", "a")
    readme.puts("I just did a private commit! The time is: #{time}")
    readme.close
    `git add -A`
    `git commit -m "private commit" --date #{time}`
    `git push origin master`
  end
  def get_commits(repo_name)
    sleep(0.1)
    @github.repos.commits.list(USER_NAME, repo_name, '...')
  end
end

gpc = GithubPrivateCommitter.new
gpc.get_commits('assignment_ruby_api_calls').each do |commit|
  gpc.committer(commit["commit"]["committer"]["date"])
end