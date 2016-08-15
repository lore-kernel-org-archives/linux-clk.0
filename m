Return-Path: <yuantian.tang@nxp.com>
From: <yuantian.tang@nxp.com>
To: <mturquette@baylibre.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<scott.wood@nxp.com>, Tang Yuantian <Yuantian.Tang@nxp.com>, Tang Yuantian
	<yuantian.tang@nxp.com>
Subject: [PATCH] clk: qoriq: fix a register offset error
Date: Mon, 15 Aug 2016 15:28:20 +0800
Message-ID: <1471246100-40713-1-git-send-email-yuantian.tang@nxp.com>
Return-Path: yuantian.tang@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Tang Yuantian <Yuantian.Tang@nxp.com>

The offset of Core Cluster clock control/status register
on cluster group V3 version is different from others, and
should be plus 0x70000.

Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>
---
 drivers/clk/clk-qoriq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index f4c455a..05e416c 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -774,7 +774,11 @@ static struct clk * __init create_one_cmux(struct clockgen *cg, int idx)
 	if (!hwc)
 		return NULL;
 
-	hwc->reg = cg->regs + 0x20 * idx;
+	if (cg->info.flags & CG_VER3)
+		hwc->reg = cg->regs + 0x70000 + 0x20 * idx;
+	else
+		hwc->reg = cg->regs + 0x20 * idx;
+
 	hwc->info = cg->info.cmux_groups[cg->info.cmux_to_group[idx]];
 
 	/*
-- 
2.1.0.27.g96db324
