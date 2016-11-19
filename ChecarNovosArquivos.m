fileObj = System.IO.FileSystemWatcher('C:\hackathon\server\upload\');
fileObj.Filter = '*.jpg';
fileObj.EnableRaisingEvents = true;
addlistener(fileObj,'Created',@eventhandlerCreated);
