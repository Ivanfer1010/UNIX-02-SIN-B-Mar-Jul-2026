   1  git remote - v
    2  git remote -v
    3  git fetch upstream
    4  git checkout -b eval_p2_1_v1 upstream/eval_p2_1_v1
    5  git push -u origin eval_p2_1_v1
    6  git mv nebula/registros nebula/bitacoras
    7  ls -R nebula/
    8  ls -la nebula/
    9  history
   10  mkdir -p nebula/bitacoras
   11  mkdir -p nebula/borradores
   12  rm -rf nebula/registros
   13  git add .
   14  git commit -m "Fix problema 1: estructura de directorios corregida"
   15  git mv nebula/cosmos.txt nebula/bitacoras/cosmos.txt
   16  mv estrella.bak estrella.conf
   17  git mv nebula/estrella.bak nebula/estrella.conf
   18  chmod 640 bitacoras/cosmos.txt
   19  chmod 640 nebula/bitacoras/cosmos.txt
   20  ls -l nebula/bitacoras/cosmos.txt
   21  history
   22  chmod u+x nebula/galaxia.sh
   23  chmod o-w nebula/estrella.conf
   24  chmod u+s nebula/galaxia.sh
   25  ls -l nebula/galaxia.sh
   26  chmod u+x nebula/galaxia.sh
   27  chmod o-w nebula/estrella.conf
   28  ls -l nebula/galaxia.sh
   29  ls -l nebula/galaxia.sh nebula/estrella.conf
   30  chmod o-w nebula/estrella.conf
   31  chmod u+x nebula/galaxia.sh
   32  chmod go-w nebula/galaxia.sh
   33  ls -l nebula/bitacoras/cosmos.txt nebula/galaxia.sh nebula/estrella.conf
   34  git add nebula/galaxia.sh
   35  ls -l nebula/bitacoras/cosmos.txt nebula/galaxia.sh nebula/estrella.conf
   36  git add .
   37  chmod +t /tmp/nebula_zone
   38  mkdir -p /tmp/nebula_zone
   39  chmod +t /tmp/nebula_zone
   40  ls -ld /tmp/nebula_zone
   41  git commit --allow-empty -m "Fix problema 6: sticky bit en /tmp/nebula_zone"
   42  gpg --full-generate-key
   43  gpg --list-keys
   44  gpg --batch --generate-key <<EOF
Key-Type: RSA
Key-Length: 2048
Name-Real: aurora
Name-Email: aurora@nebula.lab
Expire-Date: 0
%no-protection
%commit
EOF

   45  gpg --encrypt --recipient aurora@nebula.lab --trust-model always --output nebula/bitacoras/cosmos.txt.gpg nebula/bitacoras/cosmos.txt
   46  gpg --list-keys
   47  file nebula/bitacoras/cosmos.txt.gpg
   48  git commit -m "Fix problema 7: llave GPG generada y cosmos.txt cifrado"
   49  gpg --local-user aurora@nebula.lab --clearsign --output nebula/estrella.conf.asc nebula/estrella.conf
   50  gpg --verify nebula/galaxia.sh.sig nebula/galaxia.sh
   51  gpg --local-user aurora@nebula.lab --detach-sign --replace-files --output nebula/galaxia.sh.sig nebula/galaxia.sh
   52  gpg --local-user aurora@nebula.lab --detach-sign --output nebula/galaxia.sh.sig nebula/galaxia.sh
   53  gpg --verify nebula/galaxia.sh.sig nebula/galaxia.sh
   54  gpg --local-user aurora@nebula.lab --detach-sign --output nebula/galaxia.sh.sig nebula/galaxia.sh
   55  gpg --verify nebula/galaxia.sh.sig nebula/galaxia.sh
   56  history