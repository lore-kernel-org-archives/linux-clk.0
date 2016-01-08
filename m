Return-Path: <jamesjj.liao@mediatek.com>
From: James Liao <jamesjj.liao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
CC: Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>,
	<srv_heupstream@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH] clk: mediatek: Fix memory leak on clock init fail
Date: Fri, 8 Jan 2016 16:15:33 +0800
Message-ID: <1452240933-60695-1-git-send-email-jamesjj.liao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: jamesjj.liao@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

mtk_clk_register_composite() may leak memory due to some error
handling path don't free all allocated memory. This patch
free all pointers that may allocate memory before error return.
And it's safe because kfree() can handle NULL pointers.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index cf08db6..3528303 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -209,12 +209,14 @@ struct clk * __init mtk_clk_register_composite(const struct mtk_composite *mc,
 		mc->flags);
 
 	if (IS_ERR(clk)) {
-		kfree(gate);
-		kfree(mux);
+		ret = PTR_ERR(clk);
+		goto err_out;
 	}
 
 	return clk;
 err_out:
+	kfree(div);
+	kfree(gate);
 	kfree(mux);
 
 	return ERR_PTR(ret);
-- 
1.9.1
