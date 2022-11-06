class Hollywood < Formula
  desc "Fill your console with Hollywood melodrama technobabble"
  homepage "https://hollywood.computer/"
  url "https://github.com/dustinkirkland/hollywood/archive/35275a68c37bbc39d8b2b0e4664a0c2f5451e5f6.tar.gz"
  version "1.22"
  sha256 "7eab1994b4320ee8b3de751465082aed1f5fd12a8d8082ef749ed1249ea0b583"
  license "Apache-2.0"

  depends_on "cmatrix"
  depends_on "coreutils"
  depends_on "fd"
  depends_on "gotop"
  depends_on "grc"
  depends_on "hexyl"
  depends_on "jp2a"
  depends_on "moreutils"
  depends_on "pv"
  depends_on "pygments"
  depends_on "tmux"

  patch :DATA

  def install
    bin.install "bin/hollywood"
    lib.install "lib/hollywood"
    share.install "share/hollywood"
    man1.install "share/man/man1/hollywood.1"
  end

  test do
    system bin/"hollywood", "--help"
  end
end

__END__
diff --git a/lib/hollywood/apg b/lib/hollywood/apg
deleted file mode 100755
index 3dcea9f..0000000
--- a/lib/hollywood/apg
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/bin/sh
-#
-# Copyright 2014 Dustin Kirkland <dustin.kirkland@gmail.com>
-#
-# Licensed under the Apache License, Version 2.0 (the "License");
-# you may not use this file except in compliance with the License.
-# You may obtain a copy of the License at
-#
-#    http://www.apache.org/licenses/LICENSE-2.0
-#
-# Unless required by applicable law or agreed to in writing, software
-# distributed under the License is distributed on an "AS IS" BASIS,
-# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-# See the License for the specific language governing permissions and
-# limitations under the License.
-
-command -v apg >/dev/null 2>&1 || exit 1
-
-trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
-while true; do
-	apg -qlt -c /dev/urandom -n 1 -m 4 | ccze -A -c default=$(printf "red\ngreen\nyellow\nblue\nmagenta\ncyan" | sort -R | head -n1)
-	sleep 0.2
-done
diff --git a/lib/hollywood/atop b/lib/hollywood/atop
deleted file mode 100755
index 8822296..0000000
--- a/lib/hollywood/atop
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/sh
-#
-# Copyright 2019 Dustin Kirkland <dustin.kirkland@gmail.com>
-#
-# Licensed under the Apache License, Version 2.0 (the "License");
-# you may not use this file except in compliance with the License.
-# You may obtain a copy of the License at
-#
-#    http://www.apache.org/licenses/LICENSE-2.0
-#
-# Unless required by applicable law or agreed to in writing, software
-# distributed under the License is distributed on an "AS IS" BASIS,
-# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-# See the License for the specific language governing permissions and
-# limitations under the License.
-
-command -v atop >/dev/null 2>&1 || exit 1
-
-trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
-while true; do
-	atop
-done
diff --git a/lib/hollywood/bmon b/lib/hollywood/bmon
deleted file mode 100755
index 1361709..0000000
--- a/lib/hollywood/bmon
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-#
-# Copyright 2014 Dustin Kirkland <dustin.kirkland@gmail.com>
-#
-# Licensed under the Apache License, Version 2.0 (the "License");
-# you may not use this file except in compliance with the License.
-# You may obtain a copy of the License at
-#
-#    http://www.apache.org/licenses/LICENSE-2.0
-#
-# Unless required by applicable law or agreed to in writing, software
-# distributed under the License is distributed on an "AS IS" BASIS,
-# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-# See the License for the specific language governing permissions and
-# limitations under the License.
-
-command -v bmon >/dev/null 2>&1 || exit 1
-
-trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
-bmon --show-all
diff --git a/lib/hollywood/cmatrix b/lib/hollywood/cmatrix
index 1f6fc24..6bc1877 100755
--- a/lib/hollywood/cmatrix
+++ b/lib/hollywood/cmatrix
@@ -14,8 +14,6 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v cmatrix >/dev/null 2>&1 || exit 1
-
 trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 while true; do
 	cmatrix -b
diff --git a/lib/hollywood/code b/lib/hollywood/code
index 532ce73..29be0d8 100755
--- a/lib/hollywood/code
+++ b/lib/hollywood/code
@@ -14,17 +14,14 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v locate >/dev/null 2>&1 || exit 1
-command -v view >/dev/null 2>&1 || exit 1
-
 trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 while true; do
-	FILES=$(locate -l 4096 "/usr/*.java" "/usr/*.c" "/usr/*.cpp" 2>/dev/null | sort -R)
+	FILES=$(fd ".*\.(java|c|cpp|py)$" /usr 2>/dev/null | sort -R)
 	for f in $FILES; do
 		[ -r "$f" ] || continue
 		[ -s "$f" ] || continue
 		[ -f "$f" ] || continue
-		pygmentize "$f" 2>/dev/null || true
+		pygmentize "$f" 2>/dev/null | pv -qlL30
 		sleep 2
 	done
 done
diff --git a/lib/hollywood/errno b/lib/hollywood/errno
index 934d678..bdaa02f 100755
--- a/lib/hollywood/errno
+++ b/lib/hollywood/errno
@@ -14,11 +14,8 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v errno >/dev/null 2>&1 || exit 1
-command -v ccze >/dev/null 2>&1 || exit 1
-
 trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 while true; do
-	errno --list | sort -R | ccze -A
+	errno --list | sort -R | grc pv -qlL30 # | ccze -A
 	sleep 0.6
 done
diff --git a/lib/hollywood/hexdump b/lib/hollywood/hexdump
index f2fb0bd..705d36a 100755
--- a/lib/hollywood/hexdump
+++ b/lib/hollywood/hexdump
@@ -14,13 +14,10 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v hexdump >/dev/null 2>&1 || exit 1
-command -v ccze >/dev/null 2>&1 || exit 1
-
 trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 while true; do
 	for f in $(ls /usr/bin/ | sort -R); do
-		head -c 4096 "/usr/bin/$f" | hexdump -C | ccze -A -c default=green -c dir="bold green"
+		hexyl -c 4096 --border=none  "/usr/bin/$f" | pv -qlL30 # | ccze -A -c default=green -c dir="bold green"
 		sleep 0.7
 	done
 done
diff --git a/lib/hollywood/htop b/lib/hollywood/htop
index d44f1e5..a659926 100755
--- a/lib/hollywood/htop
+++ b/lib/hollywood/htop
@@ -14,9 +14,7 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v htop >/dev/null 2>&1 || exit 1
-
 trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 while true; do
-	htop
+	gotop
 done
diff --git a/lib/hollywood/jp2a b/lib/hollywood/jp2a
deleted file mode 100755
index e87b950..0000000
--- a/lib/hollywood/jp2a
+++ /dev/null
@@ -1,31 +0,0 @@
-#!/bin/bash
-#
-# Copyright 2014 Dustin Kirkland <dustin.kirkland@gmail.com>
-#
-# Licensed under the Apache License, Version 2.0 (the "License");
-# you may not use this file except in compliance with the License.
-# You may obtain a copy of the License at
-#
-#    http://www.apache.org/licenses/LICENSE-2.0
-#
-# Unless required by applicable law or agreed to in writing, software
-# distributed under the License is distributed on an "AS IS" BASIS,
-# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-# See the License for the specific language governing permissions and
-# limitations under the License.
-
-command -v locate >/dev/null 2>&1 || exit 1
-command -v jp2a >/dev/null 2>&1 || exit 1
-
-trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
-while true; do
-	FILES=$(locate -l 4096 "/usr/*jpg" 2>/dev/null | sort -R)
-	for f in $FILES; do
-		[ -r "$f" ] || continue
-		[ -s "$f" ] || continue
-		[ -f "$f" ] || continue
-		clear
-		jp2a --colors --term-fit "$f"
-		sleep 0.57
-	done
-done
diff --git a/lib/hollywood/logs b/lib/hollywood/logs
index 566d825..fb98bf1 100755
--- a/lib/hollywood/logs
+++ b/lib/hollywood/logs
@@ -14,13 +14,11 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v ccze >/dev/null 2>&1 || exit 1
-
 trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 while true; do
-	LOGS=$(find /var/log -type f -name "*.log" 2>/dev/null | head -n 4096 | sort -R)
+	LOGS=$(fd "\.log$" /var/log 2>/dev/null | head -n 4096 | sort -R)
 	for log in $LOGS; do
-		cat "$log" 2>/dev/null | ccze -A
+		grc pv -qlL30 "$log" 2>/dev/null # | ccze -A
 		sleep 0.5
 	done
 done
diff --git a/lib/hollywood/man b/lib/hollywood/man
index 2d42513..60ca944 100755
--- a/lib/hollywood/man
+++ b/lib/hollywood/man
@@ -14,14 +14,11 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v man >/dev/null 2>&1 || exit 1
-command -v ccze >/dev/null 2>&1 || exit 1
-
 trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 while true; do
-	FILES=$(ls /usr/share/man/man1/ | sort -R | sed "s/\.1\.gz.*$//" | head -n 4096)
+	FILES=$(ls /usr/share/man/man1/ | sort -R | perl -pe 's/[\d.]*$//g' | head -n 4096)
 	for f in $FILES; do
-		man "$f" | ccze -A
+		man "$f" | grc pv -qlL30 # | ccze -A
 		sleep 0.2
 	done
 done
diff --git a/lib/hollywood/map b/lib/hollywood/map
index 47beb7d..b0f8a56 100755
--- a/lib/hollywood/map
+++ b/lib/hollywood/map
@@ -14,8 +14,6 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v jp2a >/dev/null 2>&1 || exit 1
-
 trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 
 PKG=hollywood
diff --git a/lib/hollywood/mplayer b/lib/hollywood/mplayer
deleted file mode 100755
index b56f7f9..0000000
--- a/lib/hollywood/mplayer
+++ /dev/null
@@ -1,21 +0,0 @@
-#!/bin/bash
-#
-# Copyright 2014 Dustin Kirkland <dustin.kirkland@gmail.com>
-#
-# Licensed under the Apache License, Version 2.0 (the "License");
-# you may not use this file except in compliance with the License.
-# You may obtain a copy of the License at
-#
-#    http://www.apache.org/licenses/LICENSE-2.0
-#
-# Unless required by applicable law or agreed to in writing, software
-# distributed under the License is distributed on an "AS IS" BASIS,
-# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-# See the License for the specific language governing permissions and
-# limitations under the License.
-
-command -v mplayer >/dev/null 2>&1 || exit 1
-trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
-PKG=hollywood
-dir="$(dirname $0)/../../share/$PKG"
-DISPLAY= mplayer -vo caca -loop 0 -ss $((RANDOM % 100)) -speed 100 $MPLAYER_OPTS $dir/soundwave.mp4
diff --git a/lib/hollywood/speedometer b/lib/hollywood/speedometer
deleted file mode 100755
index b0295f9..0000000
--- a/lib/hollywood/speedometer
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-#
-# Copyright 2014 Dustin Kirkland <dustin.kirkland@gmail.com>
-#
-# Licensed under the Apache License, Version 2.0 (the "License");
-# you may not use this file except in compliance with the License.
-# You may obtain a copy of the License at
-#
-#    http://www.apache.org/licenses/LICENSE-2.0
-#
-# Unless required by applicable law or agreed to in writing, software
-# distributed under the License is distributed on an "AS IS" BASIS,
-# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-# See the License for the specific language governing permissions and
-# limitations under the License.
-
-command -v speedometer >/dev/null 2>&1 || exit 1
-
-trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
-while true; do
-	while read Iface Destination Gateway Flags RefCnt Use Metric Mask MTU Window IRTT; do
-		[ "$Mask" = "00000000" ] && break
-	done < /proc/net/route
-	speedometer -tx $Iface -rx $Iface -i 0.75
-done
diff --git a/lib/hollywood/sshart b/lib/hollywood/sshart
index 1a053ba..62c160b 100755
--- a/lib/hollywood/sshart
+++ b/lib/hollywood/sshart
@@ -14,20 +14,17 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v ssh-keygen >/dev/null 2>&1 || exit 1
-command -v ccze >/dev/null 2>&1 || exit 1
-
 PKG=hollywood
-tmpdir="/tmp/$PKG"
+tmpdir="$TMPDIR/$PKG"
 trap "rm -rf $tmpdir 2>/dev/null && pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 while true; do
 	mkdir -p "$tmpdir"
-	tmpfile=$(mktemp -p "$tmpdir" -t XXXXXX)
+	tmpfile=$(mktemp "$tmpdir.XXXXXX")
 	rm -f $tmpfile
 	art=$(ssh-keygen -vvv -b 1024 -t dsa -N "" -f $tmpfile)
 	rm -f $tmpfile $tmpfile.pub
 	wait
 	clear
-	echo "$art" | ccze -A -c default=red
+	echo "$art" # | ccze -A -c default=red
 	sleep 3 &
 done
diff --git a/lib/hollywood/stat b/lib/hollywood/stat
index 7ecb715..d91ef74 100755
--- a/lib/hollywood/stat
+++ b/lib/hollywood/stat
@@ -14,13 +14,10 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v stat >/dev/null 2>&1 || exit 1
-command -v ccze >/dev/null 2>&1 || exit 1
-
 trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 while true; do
-	for f in $(find /sys /dev 2>/dev/null | head -n 4096 | sort -R); do
-		stat "$f" | ccze -A -c default=yellow
+	for f in $(fd . /sys /dev 2>/dev/null | head -n 4096 | sort -R); do
+		grc stat "$f" # | ccze -A -c default=yellow
 		sleep 0.8
 	done
 done
diff --git a/lib/hollywood/tree b/lib/hollywood/tree
index 6a16197..057996b 100755
--- a/lib/hollywood/tree
+++ b/lib/hollywood/tree
@@ -14,8 +14,6 @@
 # See the License for the specific language governing permissions and
 # limitations under the License.
 
-command -v tree >/dev/null 2>&1 || exit 1
-
 trap "pkill -f -9 lib/hollywood/ >/dev/null 2>&1; exit" INT
 DIRS="/sys /dev"
