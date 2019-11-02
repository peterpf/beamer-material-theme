require 'rake'

input_directory = 'src'
output_directory = 'dist'

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
  result = exec('python3 build_theme.py')
end

task :clean do
  rm_rf output_directory
end

task :default => [:clean, :copy_files, :build_theme]
