require 'rake'

input_directory = 'src'
output_directory = 'dist'
build_directory = 'build'

SOURCE_FILES = Rake::FileList.new(File.join(input_directory, '**/*.sty')) do |file|
  file.exclude('~*')
  file.exclude do |f|
    `git ls-files #{f}`.empty?
  end
end

OUTPUT_FILES = SOURCE_FILES.pathmap(File.join(output_directory, '/%p'))


# Declare a rule for auto-tasks that have input and output in different directories
#
# Example:
#  mv_rule 'obj/*.o' => 'src/*.c' do |t|
#    sh "gcc -c #{t.source} -o #{t.name}"
#
# Source: https://stackoverflow.com/questions/33395361/how-to-process-inputs-and-outputs-in-separate-directories-in-rake
def mv_rule(*args, &block) # :doc:
  outFile, inFile = args[0].keys[0], args[0].values[0]
  outExt = File.extname outFile
  outDir = File.dirname outFile
  inExt = File.extname inFile
  inDir = File.dirname inFile
  destPattern = Regexp.new("#{outDir}/.*\\#{outExt}")
  srcPattern = ->(o){o.pathmap("%{^#{outDir}/,#{inDir}/}X#{inExt}")}
  Rake::Task.create_rule(destPattern => [srcPattern, outDir], &block)
end

directory output_directory

mv_rule File.join(output_directory, '*.sty') => File.join(input_directory, '*.sty') do |task|
  cp task.source, task.name
end

task :copy_files => SOURCE_FILES do |t|
  SOURCE_FILES.each do |f|
    targetFile = f.sub! File.join(input_directory, '/'), File.join(output_directory, '/')
    Rake::Task[targetFile].invoke
  end
end

task :build_theme do
  scriptFile = File.join(build_directory, 'build_theme.py')
  result = exec("python3 #{scriptFile}")
end

task :clean do
  rm_rf output_directory
end

task :python_setup do
  requirementsFile = File.join(build_directory, 'requirements.txt')
  exec("pip3 install -r #{requirementsFile}")
end

desc('Builds the theme in the dist folder')
task :distribute => [:clean, :copy_files, :build_theme]

desc('Setups python libraries and then builds the theme in the dist folder')
task :default => [:python_setup, :distribute]
