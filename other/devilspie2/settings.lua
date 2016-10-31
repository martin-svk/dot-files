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
-- Music
elseif (string.find(get_application_name(), "Spotify") or get_application_name()=="VLC media player") then
   set_window_workspace(4);
   set_window_size(1600, 900);
-- Mail
elseif (get_application_name()=="Mail") then
   set_window_workspace(5);
   maximize();
-- Slack
elseif string.find(get_application_name(), "Slack") then
   set_window_workspace(6);
   maximize();
-- Steam
elseif (get_application_name()=="Steam") then
   set_window_workspace(7);
end
