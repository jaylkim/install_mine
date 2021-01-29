*! version 0.0.0.9000 Jay Kim 29jan2021
/***

install_mine
============

Description
-----------

This command moves ado files and their sthlp files to the directory for 
personal ado files.
When this command is run, the ado file and the sthlp files must be in the 
working directory.

_This help file was created by the_ __markdoc__ _package written by Haghish_
***/


program define install_mine

  // Find the personal ado file directory

  local personal_ado = c(sysdir_personal)

  // Find the current dir

  local cdir = c(pwd)


  // Find all ado / sthlp files

  local files_ado: dir . files "*.ado"
  local files_hlp: dir . files "*.sthlp"

  // Move the files to the personal ado file dir

  qui cd `"`personal_ado'"'

  foreach file of local files_ado {
    
    // Find the first character of the file name
    local first = substr(`"`file'"', 1, 1)

    // Copy it
    cap mkdir `"`first'"'
    qui cd `"`cdir'"'
    qui copy `"`file'"' `"`personal_ado'/`first'/`file'"', replace

    disp as res `"`file' copied to `personal_ado'/`first'/`file'"'

  }

  qui cd `"`personal_ado'"'

  foreach file of local files_hlp {
   
    // Find the first character of the file name
    local first = substr(`"`file'"', 1, 1)

    // Copy it
    cap mkdir `"`first'"'
    qui cd `"`cdir'"'
    qui copy `"`file'"' `"`personal_ado'/`first'/`file'"', replace

    disp as res `"`file' copied to `personal_ado'/`first'/`file'"'

  }

end
