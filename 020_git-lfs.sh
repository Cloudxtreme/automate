#!/usr/bin/env bash
set -x
# Using in combination with bfg to remove large binary files from a git repo and replace them with a pointer to a uri/url
# debianized repo
# git clone https://github.com/git-lfs/git-lfs

#dist=$(lsb_release -c | cut -f2)
dist=$(cat /etc/devuan_version | awk -F '/' {'print $1'})
if [ "$dist" == 'jessie' ]
then 
	DIST='jessie'
elif [ "$dist" == 'ascii' ]
then 
	DIST='stretch'
else [ "$dist" == 'ceres' ] 
	DIST='sid'
fi

OS=debian

DEST=/etc/apt/sources.list-available
LINK=/etc/apt/sources.list.d
mkdir -p ${DEST}
mkdir -p ${LINK}

cat > ${DEST}/git-lfs.list << EOF
deb https://packagecloud.io/github/git-lfs/${OS}/ ${DIST} main
deb-src https://packagecloud.io/github/git-lfs/${OS}/ ${DIST} main
EOF

ln -sf ${DEST}/git-lfs.list ${LINK}/git-lfs.list

gpg_key_url="https://packagecloud.io/github/git-lfs/gpgkey"

echo -n "Importing packagecloud gpg key... "
  # import the gpg key
  curl -L "${gpg_key_url}" 2> /dev/null | apt-key add - &>/dev/null
echo "done."

apt-get update

apt-get install -y git-lfs
apt-get -f install -y


echo "See: http://github.com/git-lfs/git-lfs/wiki/Tutorial"

echo "Per user: 
	git lfs install"
echo "Per repo: 
	git lfs install --local"
echo "Use --skip-smudge to prevent automatic download on clone/pull"
echo "Add pattern to track with:"
echo "	git lfs track '*.tar.xz'"
echo "and add the resulting .gitattribute to the repo with:"
echo "	git add .gitattrubute"
echo "To see the LFS url:"
echo "	git lfs env | grep 'Endpoint='"
echo "To set it:"
echo "	git config -f .lfsconfig lfs.url https://my_other_server.example.com/foo/bar/info/lfs'"
echo "	git add .lfsconfig"
echo "For servers see:"
echo "	https://docs.gitlab.com/ce/workflow/lfs/manage_large_binaries_with_git_lfs.html"
echo "	https://about.gitlab.com/2017/01/30/getting-started-with-git-lfs-tutorial/"
echo "Migration:"
echo "Rewrite e.g. all *.mp4 video files on the current branch that are not present on a remote:"
echo '	git lfs migrate import --include="*.tar.xz"'
echo "rewrite all *.mp4 video files on a given branch(es) regardless of whether they are present on a remote (may require a force-push):"
echo "	"git lfs migrate import --include="*.mp4" --include-ref=refs/heads/master --include-ref=refs/heads/my-feature"
echo "Fast checkout procedure:"
echo "Checkout without tracked file downloads"
echo "	GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/username/my_lfs_repo.git destination_dir"
echo "	#git lfs ls-files # optionally see all the - showing the lfs files are not checked out"
echo "Pull to download the track files:."
echo "	git lfs pull"
echo "	#git lfs ls-files # optionally see all the * showing the lfs files are checked out"
