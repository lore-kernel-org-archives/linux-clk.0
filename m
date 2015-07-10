Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH 26/45] clk: tegra: Properly include clk.h
Date: Fri, 10 Jul 2015 16:33:24 -0700
Message-Id: <1436571223-10959-27-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Only include clk.h in files that are using
it. Also add in a clkdev.h include that was missing in a file
using clkdev APIs.

Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/tegra/clk-divider.c          | 1 -
 drivers/clk/tegra/clk-periph-gate.c      | 1 -
 drivers/clk/tegra/clk-periph.c           | 1 -
 drivers/clk/tegra/clk-pll-out.c          | 1 -
 drivers/clk/tegra/clk-pll.c              | 2 +-
 drivers/clk/tegra/clk-super.c            | 1 -
 drivers/clk/tegra/clk-tegra-audio.c      | 1 -
 drivers/clk/tegra/clk-tegra-fixed.c      | 1 -
 drivers/clk/tegra/clk-tegra-periph.c     | 1 -
 drivers/clk/tegra/clk-tegra-pmc.c        | 1 -
 drivers/clk/tegra/clk-tegra-super-gen4.c | 1 -
 drivers/clk/tegra/clk-tegra114.c         | 2 --
 drivers/clk/tegra/clk-tegra124.c         | 1 -
 drivers/clk/tegra/clk-tegra20.c          | 1 -
 drivers/clk/tegra/clk-tegra30.c          | 1 -
 drivers/clk/tegra/clk.c                  | 1 +
 include/linux/clk/tegra.h                | 3 ++-
 17 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 59a5714dfe18..48c83efda4cf 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -19,7 +19,6 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
-#include <linux/clk.h>
 
 #include "clk.h"
 
diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
index 0aa8830ae7cc..d28d6e95020f 100644
--- a/drivers/clk/tegra/clk-periph-gate.c
+++ b/drivers/clk/tegra/clk-periph-gate.c
@@ -14,7 +14,6 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 #include <linux/io.h>
diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index d84ae49d0e05..ec5b6113b012 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -14,7 +14,6 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/export.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/tegra/clk-pll-out.c b/drivers/clk/tegra/clk-pll-out.c
index 3598987a451d..257cae0c1488 100644
--- a/drivers/clk/tegra/clk-pll-out.c
+++ b/drivers/clk/tegra/clk-pll-out.c
@@ -20,7 +20,6 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
-#include <linux/clk.h>
 
 #include "clk.h"
 
diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 05c6d08a6695..63499c461482 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -18,8 +18,8 @@
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/clk-provider.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 
 #include "clk.h"
 
diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 2fd924d38606..131d1b5085e2 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -20,7 +20,6 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
-#include <linux/clk.h>
 
 #include "clk.h"
 
diff --git a/drivers/clk/tegra/clk-tegra-audio.c b/drivers/clk/tegra/clk-tegra-audio.c
index 5c38aab2c5b8..11e3ad7ad7a3 100644
--- a/drivers/clk/tegra/clk-tegra-audio.c
+++ b/drivers/clk/tegra/clk-tegra-audio.c
@@ -15,7 +15,6 @@
  */
 
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index 605676d368eb..da0b5941c89f 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -15,7 +15,6 @@
  */
 
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 46af9244ba74..cb6ab830941d 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -15,7 +15,6 @@
  */
 
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/of.h>
diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
index 08b21c1ee867..91377abfefa1 100644
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ b/drivers/clk/tegra/clk-tegra-pmc.c
@@ -15,7 +15,6 @@
  */
 
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/of.h>
diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
index feb3201c85ce..ecd7ff736b74 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -15,7 +15,6 @@
  */
 
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 8237d16b4075..db5871519bf5 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -15,9 +15,7 @@
  */
 
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/delay.h>
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index e8cca3eac007..0c44cc7f8558 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -15,7 +15,6 @@
  */
 
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/of.h>
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 41272dcc9e22..bf004f0e4f65 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -15,7 +15,6 @@
  */
 
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/of.h>
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 0af3e834dd24..fad561a5896b 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -16,7 +16,6 @@
 
 #include <linux/io.h>
 #include <linux/delay.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/of.h>
diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 41cd87c67be6..22aa8b18c840 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -14,6 +14,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/clkdev.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 19c4208f4752..57bf7aab4516 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -17,7 +17,8 @@
 #ifndef __LINUX_CLK_TEGRA_H_
 #define __LINUX_CLK_TEGRA_H_
 
-#include <linux/clk.h>
+#include <linux/types.h>
+#include <linux/bug.h>
 
 /*
  * Tegra CPU clock and reset control ops
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
