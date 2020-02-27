#! /usr/bin/zsh

# to be run after cloning all the repositories.
# repositories can be cloned via mr from devscripts.

for dir in $(ls .); do
    cd $dir
    echo "8<----8<----8<----8<----8<"
    echo "       ENTERED ${dir}     "
    echo "8<----8<----8<----8<----8<"
    cp ~/cloud/flask/flask-marshmallow/debian/salsa-ci.yml debian/.
    git add debian/salsa-ci.yml && git commit -m "Add salsa-ci.yml"
    gbp dch -a
    git add debian/changelog && git commit -m "Update d/ch"
    git push origin --all
    echo ""
    echo "8<----8<----8<----8<----8<"
    echo "      MOVING TO NEXT!     "
    echo "8<----8<----8<----8<----8<"
    echo ""
    cd ..
done
