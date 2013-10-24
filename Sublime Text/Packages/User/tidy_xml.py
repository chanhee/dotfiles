import sublime, sublime_plugin, subprocess
 
class TidyXmlCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    command = 'tidy -xml -i -utf8 -w -q'
 
    # help from http://www.sublimetext.com/forum/viewtopic.php?f=2&p=12451
    p = subprocess.Popen(command, bufsize=-1, stdout=subprocess.PIPE, stderr=subprocess.PIPE, stdin=subprocess.PIPE, shell=True)
    result, err = p.communicate(self.view.substr(self.view.sel()[0]).encode('utf-8'))
 
    err = err.decode('utf-8')
 
    if err != "":
      print("tidyxml: " + err)
      sublime.active_window().run_command("show_panel", {"panel": "console"})
 
    else:
      self.view.replace(edit, self.view.sel()[0], result.decode('utf-8').replace('\r\n', '\n'))
      self.view.set_status('tidyxml', "tidyxml: now your xml is tidy")
      sublime.set_timeout(self.clear,2000)
 
  def clear(self):
    self.view.erase_status('tidyxml')