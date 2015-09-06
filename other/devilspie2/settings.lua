-- the debug_print command does only print anything to stdout
-- if devilspie2 is run using the --debug option
debug_print("Application name: " .. get_application_name())

-- Handling program default workspaces

-- Chromium
if (string.find(get_application_name(), "Google Chrome")) then
   set_window_workspace(1);
-- XTerm
elseif (get_application_name()=="xterm") then
   set_window_workspace(2);
   maximize();
-- Android Studio
elseif (get_application_name()=="Android Studio") then
   set_window_workspace(3);
-- SmartGit
elseif (get_application_name()=="SmartGit") then
   set_window_workspace(4);
   maximize();
-- Music
elseif (get_application_name()=="Spotify Free - Linux Preview" or get_application_name()=="VLC media player") then
   set_window_workspace(5);
-- Mail
elseif (get_application_name()=="Geary") then
   set_window_workspace(6);
-- HipChat
elseif (get_application_name()=="HipChat") then
   set_window_workspace(7);
-- Steam
elseif (get_application_name()=="Steam") then
   set_window_workspace(8);
end
