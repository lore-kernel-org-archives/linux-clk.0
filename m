Return-Path: <Jisheng.Zhang@synaptics.com>
Date: Wed, 16 May 2018 16:04:29 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: berlin: switch to SPDX license identifier
Message-ID: <20180516160429.6581d443@xhacker.debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-Path: Jisheng.Zhang@synaptics.com
List-ID: <linux-clk.vger.kernel.org>

Use the appropriate SPDX license identifier and drop the previous
license text.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/clk/berlin/berlin2-avpll.c | 13 +------------
 drivers/clk/berlin/berlin2-avpll.h | 13 +------------
 drivers/clk/berlin/berlin2-div.c   | 13 +------------
 drivers/clk/berlin/berlin2-div.h   | 13 +------------
 drivers/clk/berlin/berlin2-pll.c   | 13 +------------
 drivers/clk/berlin/berlin2-pll.h   | 13 +------------
 drivers/clk/berlin/bg2.c           | 13 +------------
 drivers/clk/berlin/bg2q.c          | 13 +------------
 drivers/clk/berlin/common.h        | 13 +------------
 9 files changed, 9 insertions(+), 108 deletions(-)

diff --git a/drivers/clk/berlin/berlin2-avpll.c b/drivers/clk/berlin/berlin2-avpll.c
index cfcae468e989..aa89b4c9464e 100644
--- a/drivers/clk/berlin/berlin2-avpll.c
+++ b/drivers/clk/berlin/berlin2-avpll.c
@@ -1,20 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2014 Marvell Technology Group Ltd.
  *
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
  * Alexandre Belloni <alexandre.belloni@free-electrons.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #include <linux/clk-provider.h>
 #include <linux/io.h>
diff --git a/drivers/clk/berlin/berlin2-avpll.h b/drivers/clk/berlin/berlin2-avpll.h
index 17e311153b42..f3af34dc2bee 100644
--- a/drivers/clk/berlin/berlin2-avpll.h
+++ b/drivers/clk/berlin/berlin2-avpll.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2014 Marvell Technology Group Ltd.
  *
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
  * Alexandre Belloni <alexandre.belloni@free-electrons.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #ifndef __BERLIN2_AVPLL_H
 #define __BERLIN2_AVPLL_H
diff --git a/drivers/clk/berlin/berlin2-div.c b/drivers/clk/berlin/berlin2-div.c
index 41ab2d392c57..4d0be66aa6a8 100644
--- a/drivers/clk/berlin/berlin2-div.c
+++ b/drivers/clk/berlin/berlin2-div.c
@@ -1,20 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2014 Marvell Technology Group Ltd.
  *
  * Alexandre Belloni <alexandre.belloni@free-electrons.com>
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #include <linux/bitops.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/berlin/berlin2-div.h b/drivers/clk/berlin/berlin2-div.h
index e835ddf8374a..d4da64325190 100644
--- a/drivers/clk/berlin/berlin2-div.h
+++ b/drivers/clk/berlin/berlin2-div.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2014 Marvell Technology Group Ltd.
  *
  * Alexandre Belloni <alexandre.belloni@free-electrons.com>
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #ifndef __BERLIN2_DIV_H
 #define __BERLIN2_DIV_H
diff --git a/drivers/clk/berlin/berlin2-pll.c b/drivers/clk/berlin/berlin2-pll.c
index 4ffbe80f6323..9661820717a5 100644
--- a/drivers/clk/berlin/berlin2-pll.c
+++ b/drivers/clk/berlin/berlin2-pll.c
@@ -1,20 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2014 Marvell Technology Group Ltd.
  *
  * Alexandre Belloni <alexandre.belloni@free-electrons.com>
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #include <linux/clk-provider.h>
 #include <linux/io.h>
diff --git a/drivers/clk/berlin/berlin2-pll.h b/drivers/clk/berlin/berlin2-pll.h
index 583e024b9bed..3757fb25c4e8 100644
--- a/drivers/clk/berlin/berlin2-pll.h
+++ b/drivers/clk/berlin/berlin2-pll.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2014 Marvell Technology Group Ltd.
  *
  * Alexandre Belloni <alexandre.belloni@free-electrons.com>
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #ifndef __BERLIN2_PLL_H
 #define __BERLIN2_PLL_H
diff --git a/drivers/clk/berlin/bg2.c b/drivers/clk/berlin/bg2.c
index e7331ace0337..cd2905364261 100644
--- a/drivers/clk/berlin/bg2.c
+++ b/drivers/clk/berlin/bg2.c
@@ -1,20 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2014 Marvell Technology Group Ltd.
  *
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
  * Alexandre Belloni <alexandre.belloni@free-electrons.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/clk/berlin/bg2q.c b/drivers/clk/berlin/bg2q.c
index 67c270b143f7..9ca26f3bc6e6 100644
--- a/drivers/clk/berlin/bg2q.c
+++ b/drivers/clk/berlin/bg2q.c
@@ -1,20 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2014 Marvell Technology Group Ltd.
  *
  * Alexandre Belloni <alexandre.belloni@free-electrons.com>
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/clk/berlin/common.h b/drivers/clk/berlin/common.h
index bc68a14c4550..1afb3c29b796 100644
--- a/drivers/clk/berlin/common.h
+++ b/drivers/clk/berlin/common.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2014 Marvell Technology Group Ltd.
  *
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
  * Alexandre Belloni <alexandre.belloni@free-electrons.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #ifndef __BERLIN2_COMMON_H
 #define __BERLIN2_COMMON_H
-- 
2.17.0
