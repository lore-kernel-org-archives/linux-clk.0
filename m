Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:10775 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751588AbdBFMQP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2017 07:16:15 -0500
From: Mars Cheng <mars.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Jades Shih <jades.shih@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        My Chuang <my.chuang@mediatek.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, Marc Zyngier <marc.zyngier@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will.deacon@arm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        <linux-clk@vger.kernel.org>,
        Chieh-Jay Liu <Chieh-Jay.Liu@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>,
        Kevin-CW Chen <kevin-cw.chen@mediatek.com>
Subject: [PATCH v2 07/10] soc: mediatek: refine scysys for mediatek platforms
Date: Mon, 6 Feb 2017 20:15:33 +0800
Message-ID: <1486383336-16892-8-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This adds 2 refinements: avoid fixed spm power statue and add vdec item

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
Signed-off-by: Kevin-CW Chen <kevin-cw.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c |   35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index beb7916..a8ba800 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -71,6 +71,7 @@ enum clk_id {
 	CLK_VENC,
 	CLK_VENC_LT,
 	CLK_ETHIF,
+	CLK_VDEC,
 	CLK_MAX,
 };
 
@@ -81,6 +82,7 @@ enum clk_id {
 	"venc",
 	"venc_lt",
 	"ethif",
+	"vdec",
 	NULL,
 };
 
@@ -107,21 +109,28 @@ struct scp_domain {
 	struct regulator *supply;
 };
 
+struct scp_ctrl_reg {
+	int pwr_sta_offs;
+	int pwr_sta2nd_offs;
+};
+
 struct scp {
 	struct scp_domain *domains;
 	struct genpd_onecell_data pd_data;
 	struct device *dev;
 	void __iomem *base;
 	struct regmap *infracfg;
+	struct scp_ctrl_reg ctrl_reg;
 };
 
 static int scpsys_domain_is_on(struct scp_domain *scpd)
 {
 	struct scp *scp = scpd->scp;
 
-	u32 status = readl(scp->base + SPM_PWR_STATUS) & scpd->data->sta_mask;
-	u32 status2 = readl(scp->base + SPM_PWR_STATUS_2ND) &
-				scpd->data->sta_mask;
+	u32 status = readl(scp->base + scp->ctrl_reg.pwr_sta_offs) &
+						scpd->data->sta_mask;
+	u32 status2 = readl(scp->base + scp->ctrl_reg.pwr_sta2nd_offs) &
+						scpd->data->sta_mask;
 
 	/*
 	 * A domain is on when both status bits are set. If only one is set
@@ -346,7 +355,8 @@ static void init_clks(struct platform_device *pdev, struct clk **clk)
 }
 
 static struct scp *init_scp(struct platform_device *pdev,
-			const struct scp_domain_data *scp_domain_data, int num)
+			const struct scp_domain_data *scp_domain_data, int num,
+			struct scp_ctrl_reg *scp_ctrl_reg)
 {
 	struct genpd_onecell_data *pd_data;
 	struct resource *res;
@@ -358,6 +368,9 @@ static struct scp *init_scp(struct platform_device *pdev,
 	if (!scp)
 		return ERR_PTR(-ENOMEM);
 
+	scp->ctrl_reg.pwr_sta_offs = scp_ctrl_reg->pwr_sta_offs;
+	scp->ctrl_reg.pwr_sta2nd_offs = scp_ctrl_reg->pwr_sta2nd_offs;
+
 	scp->dev = &pdev->dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -556,8 +569,13 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 static int __init scpsys_probe_mt2701(struct platform_device *pdev)
 {
 	struct scp *scp;
+	struct scp_ctrl_reg scp_reg;
 
-	scp = init_scp(pdev, scp_domain_data_mt2701, NUM_DOMAINS_MT2701);
+	scp_reg.pwr_sta_offs = SPM_PWR_STATUS;
+	scp_reg.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND;
+
+	scp = init_scp(pdev, scp_domain_data_mt2701, NUM_DOMAINS_MT2701,
+		       &scp_reg);
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
@@ -667,8 +685,13 @@ static int __init scpsys_probe_mt8173(struct platform_device *pdev)
 	struct scp *scp;
 	struct genpd_onecell_data *pd_data;
 	int ret;
+	struct scp_ctrl_reg scp_reg;
+
+	scp_reg.pwr_sta_offs = SPM_PWR_STATUS;
+	scp_reg.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND;
 
-	scp = init_scp(pdev, scp_domain_data_mt8173, NUM_DOMAINS_MT8173);
+	scp = init_scp(pdev, scp_domain_data_mt8173, NUM_DOMAINS_MT8173,
+		       &scp_reg);
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
-- 
1.7.9.5

