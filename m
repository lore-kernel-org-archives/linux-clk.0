Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: [PATCH 32/45] clk: st: Include clk.h
Date: Fri, 10 Jul 2015 16:33:30 -0700
Message-Id: <1436571223-10959-33-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This clock provider uses the consumer API, so include clk.h
explicitly.

Cc: Gabriel Fernandez <gabriel.fernandez@st.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/st/clk-flexgen.c | 1 +
 drivers/clk/st/clkgen-fsyn.c | 1 +
 drivers/clk/st/clkgen-mux.c  | 1 +
 drivers/clk/st/clkgen-pll.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 657ca14ba709..8e0dbb1f81f8 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -5,6 +5,7 @@
  * Author:  Maxime Coquelin <maxime.coquelin@st.com> for ST-Microelectronics.
  * License terms:  GNU General Public License (GPL), version 2  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index e94197f04b0b..90c20717a6bb 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -15,6 +15,7 @@
 
 #include <linux/slab.h>
 #include <linux/of_address.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 
 #include "clkgen.h"
diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index 4fbe6e099587..4fc95d5332e2 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -15,6 +15,7 @@
 
 #include <linux/slab.h>
 #include <linux/of_address.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 
 static DEFINE_SPINLOCK(clkgena_divmux_lock);
diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index 106532207213..cdb14b9bb942 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -16,6 +16,7 @@
 
 #include <linux/slab.h>
 #include <linux/of_address.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 
 #include "clkgen.h"
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
