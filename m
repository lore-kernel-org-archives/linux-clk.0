Return-Path: <gregory.clement@bootlin.com>
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Antoine Tenart <antoine.tenart@bootlin.com>,
	=?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Nadav Haklai <nadavh@marvell.com>,
	Victor Gu <xigu@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Wilson Ding <dingwei@marvell.com>,
	Hua Jing <jinghua@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>,
	Ken Ma <make@marvell.com>
Subject: [PATCH] clk: mvebu: armada-37xx-periph: Fix wrong return value in get_parent
Date: Fri, 13 Jul 2018 12:27:26 +0200
Message-Id: <20180713102726.1950-1-gregory.clement@bootlin.com>
List-ID: <linux-clk.vger.kernel.org>

The return value of the get_parent operation is a u8, whereas a -EINVAL
was returned. This wrong value was return if the value was bigger that
the number of parent but this case was already handled by the core.

So we can just remove this chunk of code to fix the issue.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 9818a7a4fd10 ("clk: mvebu: armada-37xx-periph: prepare cpu clk to
be used with DVFS")
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index a51edaab0c5c..287e98a7cff4 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -426,9 +426,6 @@ static u8 clk_pm_cpu_get_parent(struct clk_hw *hw)
 		val &= pm_cpu->mask_mux;
 	}
 
-	if (val >= num_parents)
-		return -EINVAL;
-
 	return val;
 }
 
-- 
2.18.0
