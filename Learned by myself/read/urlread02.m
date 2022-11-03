tempFile=[tempname,'.html'];
urlwrite('http://www.google.com.tw',tempFile);
dos(['start ',tempFile]);            