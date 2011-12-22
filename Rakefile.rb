require 'rake/clean'
require 'rdoc/task'
require 'rake/testtask'
require 'rake'

CLOBBER.include('rdoc')

RDoc::Task.new do |rdoc|
	rdoc.rdoc_dir = 'rdoc'
	end
	
desc 'Beschreibung neu erstellen.'
task :doc =>[:clobber, :rdoc] #aufgaben die vor doc gemacht werden müssen

#tests
Rake::TestTask.new do |t|
	t.test_files = FileList['test/*.rb']
end