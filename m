Return-Path: <aisheng.dong@nxp.com>
From: Dong Aisheng <aisheng.dong@nxp.com>
To: <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <sboyd@codeaurora.org>,
	<mturquette@baylibre.com>, <shawnguo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <tglx@linutronix.de>,
	<aisheng.dong@nxp.com>, <stefan@agner.ch>, <l.stach@pengutronix.de>,
	<cyrille.pitchen@atmel.com>, <manabian@gmail.com>, <anson.huang@nxp.com>
Subject: [PATCH RFC 5/7] clk: use polling way for SYSTEM_SUSPEND state too
Date: Wed, 29 Jun 2016 21:52:13 +0800
Message-ID: <1467208335-29876-6-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1467208335-29876-1-git-send-email-aisheng.dong@nxp.com>
References: <1467208335-29876-1-git-send-email-aisheng.dong@nxp.com>
Return-Path: aisheng.dong@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

During SYSTEM_SUSPEND state, the arch irq is disabled and there's
no way to sleep. Using polling for it too.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/clk.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9369dbb71118..5091ec9bd665 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -601,7 +601,8 @@ static void clk_core_unprepare(struct clk_core *core)
 						__func__, core->name);
 					break;
 				}
-				if (system_state == SYSTEM_BOOTING)
+				if (system_state == SYSTEM_BOOTING ||
+				    system_state == SYSTEM_SUSPEND)
 					/*
 					 * Busy loop as we can't schedule in
 					 * early boot
@@ -670,7 +671,8 @@ static int clk_core_prepare(struct clk_core *core)
 						ret = -ETIMEDOUT;
 						break;
 					}
-					if (system_state == SYSTEM_BOOTING)
+					if (system_state == SYSTEM_BOOTING ||
+					    system_state == SYSTEM_SUSPEND)
 						/*
 						 * Busy loop as we can't
 						 * schedule in early boot
@@ -1256,7 +1258,8 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
 					ret = -ETIMEDOUT;
 					break;
 				}
-				if (system_state == SYSTEM_BOOTING)
+				if (system_state == SYSTEM_BOOTING ||
+				    system_state == SYSTEM_SUSPEND)
 					/*
 					 * Busy loop as we can't
 					 * schedule in early boot
@@ -1550,7 +1553,8 @@ static void clk_change_rate(struct clk_core *core)
 							__func__, core->name);
 						break;
 					}
-					if (system_state == SYSTEM_BOOTING)
+					if (system_state == SYSTEM_BOOTING ||
+					    system_state == SYSTEM_SUSPEND)
 						/*
 						 * Busy loop as we can't
 						 * schedule in early boot
-- 
1.9.1
