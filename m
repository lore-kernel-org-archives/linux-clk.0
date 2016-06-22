Return-Path: <erin.lo@mediatek.com>
From: Erin Lo <erin.lo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring
	<robh@kernel.org>
CC: John Crispin <blogic@openwrt.org>, Arnd Bergmann <arnd@arndb.de>, Sascha
 Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<srv_heupstream@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Erin
 Lo <erin.lo@mediatek.com>
Subject: [PATCH v9 01/10] clk: fix initial state of critical clock's parents
Date: Wed, 22 Jun 2016 15:40:20 +0800
Message-ID: <1466581229-2342-2-git-send-email-erin.lo@mediatek.com>
In-Reply-To: <1466581229-2342-1-git-send-email-erin.lo@mediatek.com>
References: <1466581229-2342-1-git-send-email-erin.lo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: erin.lo@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

From: James Liao <jamesjj.liao@mediatek.com>

This patch fixed wrong state of parent clocks if they are registered
after critical clocks.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
Signed-off-by: Erin Lo <erin.lo@mediatek.com>
---
 drivers/clk/clk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d584004..e9f5f89 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2388,8 +2388,15 @@ static int __clk_core_init(struct clk_core *core)
 	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
 		struct clk_core *parent = __clk_init_parent(orphan);
 
-		if (parent)
+		if (parent) {
 			clk_core_reparent(orphan, parent);
+
+			if (orphan->prepare_count)
+				clk_core_prepare(parent);
+
+			if (orphan->enable_count)
+				clk_core_enable(parent);
+		}
 	}
 
 	/*
-- 
1.9.1
