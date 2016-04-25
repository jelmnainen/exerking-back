guard :rspec, cmd: 'bundle exec rspec -fd --color', all_on_start: true do
  watch(%r{^spec/(spec|rails)_helper.rb$})          { 'spec' }
  watch(%r{^spec/support/.+\.rb$})                  { 'spec' }
  watch(%r{^spec/factories(/.+)?\.rb$})             { 'spec' }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/.+\.rb$})                           { 'spec' }
  watch(%r{^app/controllers/(.+)_controller\.rb$})  { |m| ['spec/requests/#{m[1]}_spec.rb'] }
end
