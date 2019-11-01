require 'rake'
require 'fileutils'
SOURCE_FILES = Rake::FileList.new("**/*.sty") do |fl|
  fl.exclude("~*")
  fl.exclude(/^scratch\//)
  fl.exclude do |f|
    `git ls-files #{f}`.empty?
  end
end

task :setup do
  dirname = 'dist'
  Dir.mkdir(dirname) unless Dir.exist?(dirname)
end

file :copy_files do
  target = File.join(Rails.root, "dist")
  print target
end

file 'dist/beamercolorthemematerial.sty' => 'beamercolorthemematerial.sty' do |task|
  cp task.prerequisites.first, task.name
end

task :default => [:setup, :copy_files, 'dist/beamercolorthemematerial.sty'] do
end
