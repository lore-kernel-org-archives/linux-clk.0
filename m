Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA9FC352A1
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 15:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiI3PjJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbiI3PjH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 11:39:07 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A595E1A0D29;
        Fri, 30 Sep 2022 08:39:05 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-096-057-200.ewe-ip-backbone.de [91.96.57.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5313666022F7;
        Fri, 30 Sep 2022 16:39:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1664552344;
        bh=f2J6aSdhOrco8r48KzyqFH7xfmYiAHooce2bTGVTOLA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aGw8rUef91nf5fjOJLcNKGqTHWVj+ZravbU2wiyILPyg0wDPkbYdKhG6b/3KeUlFm
         idh35TpjELpuuqM0pMvuVxWTNpGmQzU0nCGkDkc6kB4+xu8/sslS1mBGb0FyHU5oCq
         tiW+0Pu3+F5czH2c2+oFV10F9ieQVnzyhxCiHPOx6dVSnvii5u9S2+F7zVi8RTituW
         NGuImJvLWse0fuVk12crFXwI2lWhHNoViMs4NWbZ4/ocULfnK3TwxNEsMGclPkuTKZ
         q80Q0vJkveO7ig6TtEXs92EVx3bFLdyd9kzlugIHyPYMoxXU0EykkxiqaRF1Vbmclu
         K18KdkcyrF0wA==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 10F9F480163; Fri, 30 Sep 2022 17:38:59 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com
Subject: [PATCHv2 8/9] clk: rockchip: add lookup table support
Date:   Fri, 30 Sep 2022 17:38:56 +0200
Message-Id: <20220930153857.299396-9-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930153857.299396-1-sebastian.reichel@collabora.com>
References: <20220930153857.299396-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for mapping reset IDs to register offsets
to support gapless continous platform reset IDs.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk.h     | 21 +++++++++++++++------
 drivers/clk/rockchip/softrst.c | 34 +++++++++++++++++++++++++---------
 2 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 4a84491faf39..65e1dc57c068 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -922,15 +922,24 @@ struct clk *rockchip_clk_register_halfdiv(const char *name,
 					  spinlock_t *lock);
 
 #ifdef CONFIG_RESET_CONTROLLER
-void rockchip_register_softrst(struct device_node *np,
-			       unsigned int num_regs,
-			       void __iomem *base, u8 flags);
+void rockchip_register_softrst_lut(struct device_node *np,
+				   const int *lookup_table,
+				   unsigned int num_regs,
+				   void __iomem *base, u8 flags);
 #else
-static inline void rockchip_register_softrst(struct device_node *np,
-			       unsigned int num_regs,
-			       void __iomem *base, u8 flags)
+static inline void rockchip_register_softrst_lut(struct device_node *np,
+				   const int *lookup_table,
+				   unsigned int num_regs,
+				   void __iomem *base, u8 flags)
 {
 }
 #endif
 
+static inline void rockchip_register_softrst(struct device_node *np,
+					     unsigned int num_regs,
+					     void __iomem *base, u8 flags)
+{
+	return rockchip_register_softrst_lut(np, NULL, num_regs, base, flags);
+}
+
 #endif
diff --git a/drivers/clk/rockchip/softrst.c b/drivers/clk/rockchip/softrst.c
index 5d07266745b8..fd56aaefe6d1 100644
--- a/drivers/clk/rockchip/softrst.c
+++ b/drivers/clk/rockchip/softrst.c
@@ -12,6 +12,7 @@
 
 struct rockchip_softrst {
 	struct reset_controller_dev	rcdev;
+	const int			*lut;
 	void __iomem			*reg_base;
 	int				num_regs;
 	int				num_per_reg;
@@ -25,8 +26,13 @@ static int rockchip_softrst_assert(struct reset_controller_dev *rcdev,
 	struct rockchip_softrst *softrst = container_of(rcdev,
 						     struct rockchip_softrst,
 						     rcdev);
-	int bank = id / softrst->num_per_reg;
-	int offset = id % softrst->num_per_reg;
+	int bank, offset;
+
+	if (softrst->lut)
+		id = softrst->lut[id];
+
+	bank = id / softrst->num_per_reg;
+	offset = id % softrst->num_per_reg;
 
 	if (softrst->flags & ROCKCHIP_SOFTRST_HIWORD_MASK) {
 		writel(BIT(offset) | (BIT(offset) << 16),
@@ -52,8 +58,13 @@ static int rockchip_softrst_deassert(struct reset_controller_dev *rcdev,
 	struct rockchip_softrst *softrst = container_of(rcdev,
 						     struct rockchip_softrst,
 						     rcdev);
-	int bank = id / softrst->num_per_reg;
-	int offset = id % softrst->num_per_reg;
+	int bank, offset;
+
+	if (softrst->lut)
+		id = softrst->lut[id];
+
+	bank = id / softrst->num_per_reg;
+	offset = id % softrst->num_per_reg;
 
 	if (softrst->flags & ROCKCHIP_SOFTRST_HIWORD_MASK) {
 		writel((BIT(offset) << 16), softrst->reg_base + (bank * 4));
@@ -77,9 +88,10 @@ static const struct reset_control_ops rockchip_softrst_ops = {
 	.deassert	= rockchip_softrst_deassert,
 };
 
-void rockchip_register_softrst(struct device_node *np,
-			       unsigned int num_regs,
-			       void __iomem *base, u8 flags)
+void rockchip_register_softrst_lut(struct device_node *np,
+				   const int *lookup_table,
+				   unsigned int num_regs,
+				   void __iomem *base, u8 flags)
 {
 	struct rockchip_softrst *softrst;
 	int ret;
@@ -91,13 +103,17 @@ void rockchip_register_softrst(struct device_node *np,
 	spin_lock_init(&softrst->lock);
 
 	softrst->reg_base = base;
+	softrst->lut = lookup_table;
 	softrst->flags = flags;
 	softrst->num_regs = num_regs;
 	softrst->num_per_reg = (flags & ROCKCHIP_SOFTRST_HIWORD_MASK) ? 16
 								      : 32;
 
 	softrst->rcdev.owner = THIS_MODULE;
-	softrst->rcdev.nr_resets =  num_regs * softrst->num_per_reg;
+	if (lookup_table)
+		softrst->rcdev.nr_resets = num_regs;
+	else
+		softrst->rcdev.nr_resets = num_regs * softrst->num_per_reg;
 	softrst->rcdev.ops = &rockchip_softrst_ops;
 	softrst->rcdev.of_node = np;
 	ret = reset_controller_register(&softrst->rcdev);
@@ -107,4 +123,4 @@ void rockchip_register_softrst(struct device_node *np,
 		kfree(softrst);
 	}
 };
-EXPORT_SYMBOL_GPL(rockchip_register_softrst);
+EXPORT_SYMBOL_GPL(rockchip_register_softrst_lut);
-- 
2.35.1

