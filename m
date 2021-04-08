Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0D4C43461
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 18:57:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5035961041
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 18:57:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbhDHS6D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 14:58:03 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:46310 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbhDHS6D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Apr 2021 14:58:03 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4FGVrZ3slWz1qs3n;
        Thu,  8 Apr 2021 20:57:50 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4FGVrZ3MQgz1sP6L;
        Thu,  8 Apr 2021 20:57:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 38IfaBtYSKAk; Thu,  8 Apr 2021 20:57:48 +0200 (CEST)
X-Auth-Info: J63wzc2qCa/aVLORef+YkWrrwZm7Uz9ZiA18D/Aqg/4=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  8 Apr 2021 20:57:48 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/7] clk: stm32mp1: Add parent_data to ETHRX clock
Date:   Thu,  8 Apr 2021 20:57:28 +0200
Message-Id: <20210408185731.135511-5-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408185731.135511-1-marex@denx.de>
References: <20210408185731.135511-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Pass parent_data to ETHRX clock with new fw_name = "ETH_RX_CLK/ETH_REF_CLK".
By default, this change has no impact on the operation of the clock driver.
However, due to the fw_name, it permits DT to override ETHRX clock parent,
which might be needed in case the ETHRX clock are supplied by external clock
source.

Example of MCO2 supplying clock to ETH_RX_CLK via external pad-to-pad wire:
&rcc {
         clocks = <&rcc CK_MCO2>;
         clock-names = "ETH_RX_CLK/ETH_REF_CLK";
};

Note that while this patch permits to implement this rare usecase, the issue
with ethernet RX and TX input clock modeling on MP1 is far more complex and
requires more core plumbing.

[1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
    Figure 83. Peripheral clock distribution for Ethernet
    https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-stm32mp1.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 85bba1ee5fbd..f9a9960945c6 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -152,6 +152,10 @@ static const char * const eth_src[] = {
 	"pll4_p", "pll3_q"
 };
 
+const struct clk_parent_data ethrx_src[] = {
+	{ .name = "ethck_k", .fw_name = "ETH_RX_CLK/ETH_REF_CLK" },
+};
+
 static const char * const rng_src[] = {
 	"ck_csi", "pll4_r", "ck_lse", "ck_lsi"
 };
@@ -314,6 +318,7 @@ struct clock_config {
 	const char *name;
 	const char *parent_name;
 	const char * const *parent_names;
+	const struct clk_parent_data *parent_data;
 	int num_parents;
 	unsigned long flags;
 	void *cfg;
@@ -567,6 +572,7 @@ static struct clk_hw *
 clk_stm32_register_gate_ops(struct device_node *np,
 			    const char *name,
 			    const char *parent_name,
+			    const struct clk_parent_data *parent_data,
 			    unsigned long flags,
 			    void __iomem *base,
 			    const struct stm32_gate_cfg *cfg,
@@ -577,7 +583,10 @@ clk_stm32_register_gate_ops(struct device_node *np,
 	int ret;
 
 	init.name = name;
-	init.parent_names = &parent_name;
+	if (parent_name)
+		init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = parent_data;
 	init.num_parents = 1;
 	init.flags = flags;
 
@@ -602,6 +611,7 @@ clk_stm32_register_gate_ops(struct device_node *np,
 static struct clk_hw *
 clk_stm32_register_composite(struct device_node *np,
 			     const char *name, const char * const *parent_names,
+			     const struct clk_parent_data *parent_data,
 			     int num_parents, void __iomem *base,
 			     const struct stm32_composite_cfg *cfg,
 			     unsigned long flags, spinlock_t *lock)
@@ -1066,6 +1076,7 @@ _clk_stm32_register_gate(struct device_node *np,
 	return clk_stm32_register_gate_ops(np,
 				    cfg->name,
 				    cfg->parent_name,
+				    cfg->parent_data,
 				    cfg->flags,
 				    base,
 				    cfg->cfg,
@@ -1079,8 +1090,8 @@ _clk_stm32_register_composite(struct device_node *np,
 			      const struct clock_config *cfg)
 {
 	return clk_stm32_register_composite(np, cfg->name, cfg->parent_names,
-					    cfg->num_parents, base, cfg->cfg,
-					    cfg->flags, lock);
+					    cfg->parent_data, cfg->num_parents,
+					    base, cfg->cfg, cfg->flags, lock);
 }
 
 #define GATE(_id, _name, _parent, _flags, _offset, _bit_idx, _gate_flags)\
@@ -1187,6 +1198,16 @@ _clk_stm32_register_composite(struct device_node *np,
 	.func		= _clk_stm32_register_gate,\
 }
 
+#define STM32_GATE_PDATA(_id, _name, _parent, _flags, _gate)\
+{\
+	.id		= _id,\
+	.name		= _name,\
+	.parent_data	= _parent,\
+	.flags		= _flags,\
+	.cfg		= (struct stm32_gate_cfg *) {_gate},\
+	.func		= _clk_stm32_register_gate,\
+}
+
 #define _STM32_GATE(_gate_offset, _gate_bit_idx, _gate_flags, _mgate, _ops)\
 	(&(struct stm32_gate_cfg) {\
 		&(struct gate_cfg) {\
@@ -1220,6 +1241,10 @@ _clk_stm32_register_composite(struct device_node *np,
 	STM32_GATE(_id, _name, _parent, _flags,\
 		   _STM32_MGATE(_mgate))
 
+#define MGATE_MP1_PDATA(_id, _name, _parent, _flags, _mgate)\
+	STM32_GATE_PDATA(_id, _name, _parent, _flags,\
+		   _STM32_MGATE(_mgate))
+
 #define _STM32_DIV(_div_offset, _div_shift, _div_width,\
 		   _div_flags, _div_table, _ops)\
 	.div = &(struct stm32_div_cfg) {\
@@ -1279,6 +1304,9 @@ _clk_stm32_register_composite(struct device_node *np,
 #define PCLK(_id, _name, _parent, _flags, _mgate)\
 	MGATE_MP1(_id, _name, _parent, _flags, _mgate)
 
+#define PCLK_PDATA(_id, _name, _parent, _flags, _mgate)\
+	MGATE_MP1_PDATA(_id, _name, _parent, _flags, _mgate)
+
 #define KCLK(_id, _name, _parents, _flags, _mgate, _mmux)\
 	     COMPOSITE(_id, _name, _parents, CLK_OPS_PARENT_ENABLE |\
 		       CLK_SET_RATE_NO_REPARENT | _flags,\
@@ -1886,7 +1914,7 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 	PCLK(MDMA, "mdma", "ck_axi", 0, G_MDMA),
 	PCLK(GPU, "gpu", "ck_axi", 0, G_GPU),
 	PCLK(ETHTX, "ethtx", "ck_axi", 0, G_ETHTX),
-	PCLK(ETHRX, "ethrx", "ck_axi", 0, G_ETHRX),
+	PCLK_PDATA(ETHRX, "ethrx", ethrx_src, 0, G_ETHRX),
 	PCLK(ETHMAC, "ethmac", "ck_axi", 0, G_ETHMAC),
 	PCLK(FMC, "fmc", "ck_axi", CLK_IGNORE_UNUSED, G_FMC),
 	PCLK(QSPI, "qspi", "ck_axi", CLK_IGNORE_UNUSED, G_QSPI),
-- 
2.30.2

