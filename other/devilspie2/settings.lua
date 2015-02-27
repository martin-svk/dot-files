-- the debug_print command does only print anything to stdout
-- if devilspie2 is run using the --debug option
debug_print("Application name: " .. get_application_name())

-- Handling program default workspaces

-- Chromium
if (string.find(get_application_name(), "Chromium") or get_application_name()=="Firefox") then
   set_window_workspace(1);
-- XTerm
elseif (get_application_name()=="xterm") then
   set_window_workspace(2);
   maximize();
-- PDF viewer
elseif (get_application_name()=="Document Viewer") then
   set_window_workspace(3);
   maximize();
-- Geary
elseif (get_application_name()=="Geary") then
   set_window_workspace(5);
   maximize();
-- HipChat
elseif (get_application_name()=="HipChat") then
   set_window_workspace(6);
   maximize();
-- Spotify
elseif (get_application_name()=="Spotify Free - Linux Preview") then
   set_window_workspace(7);
   maximize();
-- Steam
elseif (get_application_name()=="Steam") then
   set_window_workspace(8);
   maximize();
end
