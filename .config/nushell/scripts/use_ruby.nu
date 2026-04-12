def --env use-ruby [] {
  if (".ruby-version" | path exists) {
    let ruby_version = open .ruby-version | str replace 'ruby-' '' | str trim
    $env.PATH = ($env.PATH | prepend $"/Users/alex/.rubies/ruby-($ruby_version)/bin")
    $env.GEM_HOME = $"/Users/alex/.rubies/ruby-($ruby_version)/lib/ruby/gems/($ruby_version)"
    print $"using Ruby ($ruby_version)"
  }
}
