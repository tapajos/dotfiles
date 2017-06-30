require 'irb/completion'
require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

IRB.conf[:SAVE_HISTORY] = IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:AUTO_INDENT] = true

Dir["#{ENV['HOME']}/dotfiles/irb_helpers/*"].map {|file| require file }

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "=> Unable to load awesome_print"
end

begin
  require "pry"
  Pry.start
  exit
rescue LoadError => e
  warn "=> Unable to load pry"
end

