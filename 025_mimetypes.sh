# MIME types
mkdir -p ~/.config/rox.sourceforge.net/MIME-types

echo "#! /bin/sh" > ~/.config/rox.sourceforge.net/MIME-types/video_mp4
echo "exec mpv "$@" >> ~/.config/rox.sourceforge.net/MIME-types/video_mp4

echo "#! /bin/sh" > ~/.config/rox.sourceforge.net/MIME-types/audio_mpeg
echo "exec mpv "$@" >> ~/.config/rox.sourceforge.net/MIME-types/audio_mpeg

echo "#! /bin/sh" > ~/.config/rox.sourceforge.net/MIME-types/application_x-rar
echo "exec xarchiver "$@" >> ~/.config/rox.sourceforge.net/MIME-types/application_x-rar

echo "#! /bin/sh" > ~/.config/rox.sourceforge.net/MIME-types/application_x-xz-compressed-tar
echo "exec xarchiver "$@" >> ~/.config/rox.sourceforge.net/MIME-types/application_x-xz-compressed-tar

echo "#! /bin/sh" > ~/.config/rox.sourceforge.net/MIME-types/application_x-compressed-tar
echo "exec xarchiver "$@" >> ~/.config/rox.sourceforge.net/MIME-types/application_x-compressed-tar

echo "#! /bin/sh" > ~/.config/rox.sourceforge.net/MIME-types/application_x-7z-compressed
echo "exec xarchiver "$@" >> ~/.config/rox.sourceforge.net/MIME-types/application_x-7z-compressed

echo "#! /bin/sh" > ~/.config/rox.sourceforge.net/MIME-types/application_gzip
echo "exec xarchiver "$@" >> ~/.config/rox.sourceforge.net/MIME-types/application_gzip

echo "#! /bin/sh" > ~/.config/rox.sourceforge.net/MIME-types/application_zip
echo "exec xarchiver "$@" >> ~/.config/rox.sourceforge.net/MIME-types/application_zip

echo "#! /bin/sh" > ~/.config/rox.sourceforge.net/MIME-types/image_png
echo "exec geeqie "$@" >> ~/.config/rox.sourceforge.net/MIME-types/image_png

echo "#! /bin/sh" > ~/.config/rox.sourceforge.net/MIME-types/image_jpeg
echo "exec geeqie "$@" >> ~/.config/rox.sourceforge.net/MIME-types/image_jpeg

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/text_html
echo 'exec ~/bin/firefox "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/text_html

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/video_x-theora+ogg
echo 'exec mpv "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/video_x-theora+ogg

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/audio_mpeg
echo 'exec mpv "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/audio_mpeg

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/audio_flac
echo 'exec mpv "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/audio_flac

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/video_mpeg
echo 'exec mpv "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/video_mpeg

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_pdf
echo 'exec atril "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/application_pdf

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/text_plain
echo 'exec gvim "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/text_plain

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/video_x-theora+ogg
echo 'exec mpv "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/video_x-theora+ogg

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/video_x-matroska
echo 'exec mpv "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/video_x-matroska

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/video_x-msvideo
echo 'exec mpv "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/video_x-msvideo

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/video_mp4
echo 'exec mpv "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/video_mp4

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_zip
echo 'exec xarchiver "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/application_zip

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_x-compressed-tar
echo 'exec xarchiver "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/application_x-compressed-tar

echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_x-rar
echo 'exec xarchiver "$@"' >> ~/.config/rox.sourceforge.net/MIME-types/application_x-rar


# Libreoffice MIME types

# ext: odt
echo            '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.text
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.text

# ext: fodt
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.text-flat-xml
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.text-flat-xml

# ext: ott
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.text-template
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.text-template

# ext: oth
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.text-web
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.text-web

# ext: odm
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.text-master
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.text-master

# ext: odg
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.graphics
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.graphics

# ext: fodg
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.graphics-flat-xml
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.graphics-flat-xml

# ext: otg
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.graphics-template
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.graphics-template

# ext: odp
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.presentation
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.presentation

# ext: fodp
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.presentation-flat-xml
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.presentation-flat-xml

# ext: otp
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.presentation-template
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.presentation-template

# ext: ods
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.spreadsheet
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.spreadsheet

# ext: fods
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.spreadsheet-flat-xml
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.spreadsheet-flat-xml

# ext: ots
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.spreadsheet-template
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.spreadsheet-template

# ext: odf
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.formula
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.oasis.opendocument.formula

# ext: odb
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.sun.xml.base
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.sun.xml.base

# ext: docx
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.wordprocessingml.document
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.wordprocessingml.document

# ext: docm
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-word.document.macroenabled.12
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-word.document.macroenabled.12

# ext: dotx
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.wordprocessingml.template
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.wordprocessingml.template

# ext: dotm
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-word.template.macroenabled.12
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-word.template.macroenabled.12

# ext: xlsx
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.spreadsheetml.sheet
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.spreadsheetml.sheet

# ext: xlsm
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-excel.sheet.macroenabled.12
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-excel.sheet.macroenabled.12

# ext: xltx
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.spreadsheetml.template
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.spreadsheetml.template
    
# ext: xltm
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-excel.template.macroenabled.12
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-excel.template.macroenabled.12
    
# ext: pptx
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.presentationml.presentation
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.presentationml.presentation
    
# ext: pptm
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-powerpoint.presentation.macroenabled.12
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-powerpoint.presentation.macroenabled.12
    
# ext: potx
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.presentationml.template
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.openxmlformats-officedocument.presentationml.template
    
# ext: potm
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-powerpoint.template.macroenabled.12
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-powerpoint.template.macroenabled.12

# ext: xlsb
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-excel.sheet.binary.macroenabled.12
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-excel.sheet.binary.macroenabled.12

# ext: doc
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-word
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-word

# ext: xls
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-excel
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-excel

# ext: ppt
echo '#! /bin/sh' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-powerpoint
echo 'exec libreoffice "$@"' > ~/.config/rox.sourceforge.net/MIME-types/application_vnd.ms-powerpoint

chmod +x ~/.config/rox.sourceforge.net/MIME-types/*

