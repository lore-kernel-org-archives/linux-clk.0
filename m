Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Ryder Lee <ryder.lee@mediatek.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>,
        Garlic Tseng <garlic.tseng@mediatek.com>,
        Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/5] clk: mediatek: modify MT7622 audsys to adapt MFD device
Date: Wed, 31 Jan 2018 15:42:42 +0800
Message-ID: <d6669277f5232446b4798a6b724074b18d5c21aa.1515639336.git.ryder.lee@mediatek.com>
In-Reply-To: <cover.1515639336.git.ryder.lee@mediatek.com>
References: <cover.1515639336.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

As the new MFD parent is in place, switch probing method to adapt it.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/clk/mediatek/clk-mt7622-aud.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7622-aud.c b/drivers/clk/mediatek/clk-mt7622-aud.c
index 13f752d..8c18536 100644
--- a/drivers/clk/mediatek/clk-mt7622-aud.c
+++ b/drivers/clk/mediatek/clk-mt7622-aud.c
@@ -142,11 +142,12 @@ static int clk_mt7622_audiosys_init(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
+	struct device_node *pnode = pdev->dev.parent->of_node;
 	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_AUDIO_NR_CLK);
 
-	mtk_clk_register_gates(node, audio_clks, ARRAY_SIZE(audio_clks),
+	mtk_clk_register_gates(pnode, audio_clks, ARRAY_SIZE(audio_clks),
 			       clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-- 
1.9.1
