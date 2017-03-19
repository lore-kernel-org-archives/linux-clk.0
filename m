Return-Path: <mars.cheng@mediatek.com>
From: Mars Cheng <mars.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
CC: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>,
	<linux-clk@vger.kernel.org>, Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v3 03/12] irqchip: mtk-sysirq: prevent unnecessary visibility when set_type
Date: Sun, 19 Mar 2017 23:26:24 +0800
Message-ID: <1489937193-2953-4-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: mars.cheng@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

This prevent unnecessary visibility when configuring trigger type

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 drivers/irqchip/irq-mtk-sysirq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 9ba969c..eeac512 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -57,7 +57,7 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
 		value &= ~(1 << offset);
 	}
 
-	writel(value, base + reg_index * 4);
+	writel_relaxed(value, base + reg_index * 4);
 
 	data = data->parent_data;
 	ret = data->chip->irq_set_type(data, type);
-- 
1.7.9.5
