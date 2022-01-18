Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27F8C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 20:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiARUaW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 15:30:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349064AbiARUaV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 15:30:21 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64D4C061574
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 12:30:20 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 61FEB837FB;
        Tue, 18 Jan 2022 21:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1642537817;
        bh=uTDeTM2D48k2yzr9h85UvqziO2sb4/QxAgXOrgHVPhg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fJZi/0IxG4eQUpdSxVI6nqYr1x8KyqyFomAjCQgRJAgeKKQx6qbyzfHVD1BRfZBIg
         a6OJQHrfVG2LvfYXmsxN04MfM/CTmIpkwYn0zqu+4sFyldI5N8x3PaFpc+m6ZOl/Hx
         P8fLf0GUd8keywWWAV4f1UR8YrNDyiNKPfzLP4SZZ7NbHBiyNAhCvb/lTgg1DG/9XB
         ZjMEcWcWAEkpgOcx465s4Dl2+jeIpHIzzM4K6XVyFwmrvXD3qRqlmTAsE8tf13gAvn
         Q0HqsWR+AautSKOWwQRGtGSSrxvmXKs14KKZ2N3iPTWCfE7Q3aaob1/1ZX0GUPRwuL
         sphbRWvUhbDRQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     jneuhauser@dh-electronics.com, Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/5] clk: stm32mp1: Add parent_data to ETHRX clock
Date:   Tue, 18 Jan 2022 21:29:55 +0100
Message-Id: <20220118202958.1840431-2-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118202958.1840431-1-marex@denx.de>
References: <20220118202958.1840431-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-stm32mp1.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 23a34ab459a3b..7ad2e6203baef 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -155,6 +155,10 @@ static const char * const eth_src[] = {
 	"pll4_p", "pll3_q"
 };
 
+const struct clk_parent_data ethrx_src[] = {
+	{ .name = "ethck_k", .fw_name = "ETH_RX_CLK/ETH_REF_CLK" },
+};
+
 static const char * const rng_src[] = {
 	"ck_csi", "pll4_r", "ck_lse", "ck_lsi"
 };
@@ -317,6 +321,7 @@ struct clock_config {
 	const char *name;
 	const char *parent_name;
 	const char * const *parent_names;
+	const struct clk_parent_data *parent_data;
 	int num_parents;
 	unsigned long flags;
 	void *cfg;
@@ -576,6 +581,7 @@ static struct clk_hw *
 clk_stm32_register_gate_ops(struct device *dev,
 			    const char *name,
 			    const char *parent_name,
+			    const struct clk_parent_data *parent_data,
 			    unsigned long flags,
 			    void __iomem *base,
 			    const struct stm32_gate_cfg *cfg,
@@ -586,7 +592,10 @@ clk_stm32_register_gate_ops(struct device *dev,
 	int ret;
 
 	init.name = name;
-	init.parent_names = &parent_name;
+	if (parent_name)
+		init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = parent_data;
 	init.num_parents = 1;
 	init.flags = flags;
 
@@ -611,6 +620,7 @@ clk_stm32_register_gate_ops(struct device *dev,
 static struct clk_hw *
 clk_stm32_register_composite(struct device *dev,
 			     const char *name, const char * const *parent_names,
+			     const struct clk_parent_data *parent_data,
 			     int num_parents, void __iomem *base,
 			     const struct stm32_composite_cfg *cfg,
 			     unsigned long flags, spinlock_t *lock)
@@ -1135,6 +1145,7 @@ _clk_stm32_register_gate(struct device *dev,
 	return clk_stm32_register_gate_ops(dev,
 				    cfg->name,
 				    cfg->parent_name,
+				    cfg->parent_data,
 				    cfg->flags,
 				    base,
 				    cfg->cfg,
@@ -1148,8 +1159,8 @@ _clk_stm32_register_composite(struct device *dev,
 			      const struct clock_config *cfg)
 {
 	return clk_stm32_register_composite(dev, cfg->name, cfg->parent_names,
-					    cfg->num_parents, base, cfg->cfg,
-					    cfg->flags, lock);
+					    cfg->parent_data, cfg->num_parents,
+					    base, cfg->cfg, cfg->flags, lock);
 }
 
 #define GATE(_id, _name, _parent, _flags, _offset, _bit_idx, _gate_flags)\
@@ -1258,6 +1269,16 @@ _clk_stm32_register_composite(struct device *dev,
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
@@ -1291,6 +1312,10 @@ _clk_stm32_register_composite(struct device *dev,
 	STM32_GATE(_id, _name, _parent, _flags,\
 		   _STM32_MGATE(_mgate))
 
+#define MGATE_MP1_PDATA(_id, _name, _parent, _flags, _mgate)\
+	STM32_GATE_PDATA(_id, _name, _parent, _flags,\
+		   _STM32_MGATE(_mgate))
+
 #define _STM32_DIV(_div_offset, _div_shift, _div_width,\
 		   _div_flags, _div_table, _ops)\
 	.div = &(struct stm32_div_cfg) {\
@@ -1354,6 +1379,9 @@ _clk_stm32_register_composite(struct device *dev,
 #define PCLK(_id, _name, _parent, _flags, _mgate)\
 	MGATE_MP1(_id, _name, _parent, _flags, _mgate)
 
+#define PCLK_PDATA(_id, _name, _parent, _flags, _mgate)\
+	MGATE_MP1_PDATA(_id, _name, _parent, _flags, _mgate)
+
 #define KCLK(_id, _name, _parents, _flags, _mgate, _mmux)\
 	     COMPOSITE(_id, _name, _parents, CLK_OPS_PARENT_ENABLE |\
 		       CLK_SET_RATE_NO_REPARENT | _flags,\
@@ -1951,7 +1979,7 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 	PCLK(MDMA, "mdma", "ck_axi", 0, G_MDMA),
 	PCLK(GPU, "gpu", "ck_axi", 0, G_GPU),
 	PCLK(ETHTX, "ethtx", "ck_axi", 0, G_ETHTX),
-	PCLK(ETHRX, "ethrx", "ck_axi", 0, G_ETHRX),
+	PCLK_PDATA(ETHRX, "ethrx", ethrx_src, 0, G_ETHRX),
 	PCLK(ETHMAC, "ethmac", "ck_axi", 0, G_ETHMAC),
 	PCLK(FMC, "fmc", "ck_axi", CLK_IGNORE_UNUSED, G_FMC),
 	PCLK(QSPI, "qspi", "ck_axi", CLK_IGNORE_UNUSED, G_QSPI),
-- 
2.34.1

