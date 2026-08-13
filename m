Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82183483BC2
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635081; cv=none; b=gbVZXKnnte2UedodnsPIkod0YYXvXjd91jtKpzrvIMc1MZ6dd6Qiy7pmyA0+Mo5Y/EVJg2AAd0WuHpr85H20e5yDGJLgnu0DFg3Au5elpuuoz3VwMuM1qY9gBg/2Nzbb5lrfnmKJ1FU440/KA3Bv/HuK6WlNJh2Rdu8qLYdYvVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635081; c=relaxed/simple;
	bh=VmWbf+toWEJsE06Na14vN8Hlg4tQaRf9yR83ocbu2no=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IVsXR9M6OMbHTtFxor2heSZdfP8BVya92I2c66bob5I60yc036XUyX4s3tANn0VxbyUghMOMpb2psDbkuTi5TxkBuX6BMeTsCJsb09h/jcW2xxUQv3BHqXMrEyow6EEWfR1ohydPmt7w697travqJx0i50fr/SUzo4wnIffc/rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqny1AKp; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqny1AKp"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c998fd549a8so713571a12.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635080; x=1787239880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lm7VmGRk9PxJZxv0GuzFpDT3tfIPdeIoyGQVz1zDLXY=;
        b=nqny1AKp68Z1Qh+LF+5w6SAVev1+3eQjuRtszCvDJomC0eJXdQ+jNQ0rlzqtwOsQ4K
         aDR5D0ryXYGWKAxIMIJZD3zLMkt5LKAaqgydfo0J82rVAaVpYMnQ/yJjVb2HuwqgpPRE
         hdnfGOcpMl4t3OtwYKsLAllFKHUQcmk6qeNV0j33SAlAXBGs2iUdXRJBLUJjJi/jGKYR
         xcyUluomDUgNNP8AIJmm2aJsfvYk/t2Y4+GSuJOoM+nZuHLs/UK6JXhlziyBfNi4wCWT
         FbOttW0NgJCfn7wuHpKv0ZpWtg4ecLtQzHCbHapxMT24P0aXMExy4Yv6bDMknt0xp3fI
         +Fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635080; x=1787239880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lm7VmGRk9PxJZxv0GuzFpDT3tfIPdeIoyGQVz1zDLXY=;
        b=Ra48nrspx9/tYksz+OfUJhLBvQs7MfoST0q5G0h/lclBib+/7S7tDcTUtyJHSGSTe6
         XzKBY0BDCJ0+6KMzbGLSHmbaCDtI4KhPG9KcXlaswRZo14g7L83rwb5ehN5Y6/DJ9cx6
         T1z3TNc3005hh7lg+uCKkCWlwq4ahO2EMxFMHNXfC+bKAcyu8yk1ywBXFvOPSY/WOMpd
         yzlkLNvV59Un1R6g6CDdg34MyQ4XP0j2tZWpLDtTaqqf9VdJXWzA/euPnnYB4jHaqC9Q
         kDzsmzwE+yRoVtv3YtF6Oj5BUEcgD5QsWys6MeWs+gDjx+kUd6/mXiSqoYx0ESlB/OYZ
         ewPg==
X-Gm-Message-State: AOJu0Yy7EUx5pSBbBxQpa8njbAkfEBp2DECOvshioOh4zAN58eZwS1ge
	9Z8eieExqJL23jeigCUm2VOLghBAlpNpPCwxpBWpO4vmdUJF+ns9VnejtWjnk9FyyJk=
X-Gm-Gg: AR+sD10T66aPH8r+Ii3HNSwq5w6hAtgFx1Z7SGRFYQMFd4+sLz9yXc6GQg78cyroqLz
	1FcAQ1OHbnx/nJPaiG0CYs2GONmp2WgckurJdPWrbRaSFakO3Ptwct1GN2oGTrvxqSM3EpAs/I2
	NcogNUeD2SR7AFmzUvLCh3fECRLU0DPjzngJ7zL2oDYCsDPYZ3bEmasyuuNgPtM7CzrUMURAJzt
	XXE1XGn9UpeH4PweQwhtuSq5oM5DB0BbgL0Uvjhqm/njtxGyglRPELTBelpHd1Ej3JE/7FtR+Jv
	16KCr5j0UxsySJFO9nBtSNLXLyNtuSCv2bnaJaz4UJdAiqNDduWVU9pmtetaJte2Y72MkvZCY1F
	8ahjB94Jw5S2XtzunvTxdt5YyqCmuzffKABdY8V6jIKrt1B8qFJQ9b6r35jbt+WR5E7IgSsJsfX
	zZDhGKxvxjeoDiLa0mZJqFVeeVvvjUPsyfTQHtx2elHBKxPl7IONwf5FqHTDS/aWvFSPZ3CcIfX
	ErG5eg=
X-Received: by 2002:a05:6a20:9143:b0:3c4:3321:5009 with SMTP id adf61e73a8af0-3cc55305f99mr7932500637.29.1786635079708;
        Thu, 13 Aug 2026 08:31:19 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:3b7:6da1:c188:d14f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef71081b5sm1234318a12.21.2026.08.13.08.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:31:19 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] clk: mediatek: mt7629: Properly use CLK_IS_CRITICAL flag
Date: Thu, 13 Aug 2026 23:31:13 +0800
Message-ID: <20260813153113.3952621-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT7629 clock driver calls clk_prepare_enable() for six clocks that
must remain running. These calls create permanent references owned by
the driver. In topckgen and apmixedsys, provider registration can fail
after the references are acquired, leaving them unreleased.

Mark ARMPLL, main_core_en, the AXI, memory and DDRPHY selectors, and the
UART0 gate with CLK_IS_CRITICAL, and remove the manual enable calls. The
common clock framework then keeps these clocks enabled without
driver-owned references. This preserves their always-on behavior and
avoids leaking references when provider registration fails.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 36 ++++++++++++++-----------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8bba..627e8017fa642f 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -48,8 +48,9 @@
 		_pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift,	\
 		NULL, "clk20m")
 
-#define GATE_APMIXED(_id, _name, _parent, _shift)			\
-	GATE_MTK(_id, _name, _parent, &apmixed_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+#define GATE_APMIXED_AO(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &apmixed_cg_regs, _shift,	\
+		 &mtk_clk_gate_ops_no_setclr_inv, CLK_IS_CRITICAL)
 
 #define GATE_INFRA(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &infra_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
@@ -57,6 +58,10 @@
 #define GATE_PERI0(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &peri0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_PERI0_AO(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &peri0_cg_regs, _shift,	\
+		 &mtk_clk_gate_ops_setclr, CLK_IS_CRITICAL)
+
 #define GATE_PERI1(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &peri1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -311,7 +316,7 @@ static const struct mtk_gate_regs peri1_cg_regs = {
 
 static const struct mtk_pll_data plls[] = {
 	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0,
-	    0, 21, 0x0204, 24, 0, 0x0204, 0),
+	    PLL_AO, 21, 0x0204, 24, 0, 0x0204, 0),
 	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0210, 0x021C, 0,
 	    HAVE_RST_BAR, 21, 0x0214, 24, 0, 0x0214, 0),
 	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0220, 0x022C, 0,
@@ -325,7 +330,7 @@ static const struct mtk_pll_data plls[] = {
 };
 
 static const struct mtk_gate apmixed_clks[] = {
-	GATE_APMIXED(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
+	GATE_APMIXED_AO(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
 };
 
 static const struct mtk_gate infra_clks[] = {
@@ -437,7 +442,7 @@ static const struct mtk_gate peri_clks[] = {
 	GATE_PERI0(CLK_PERI_PWM_PD, "peri_pwm_pd", "pwm_qtr_26m", 9),
 	GATE_PERI0(CLK_PERI_AP_DMA_PD, "peri_ap_dma_pd", "faxi", 12),
 	GATE_PERI0(CLK_PERI_MSDC30_1_PD, "peri_msdc30_1", "msdc30_1", 14),
-	GATE_PERI0(CLK_PERI_UART0_PD, "peri_uart0_pd", "faxi", 17),
+	GATE_PERI0_AO(CLK_PERI_UART0_PD, "peri_uart0_pd", "faxi", 17),
 	GATE_PERI0(CLK_PERI_UART1_PD, "peri_uart1_pd", "faxi", 18),
 	GATE_PERI0(CLK_PERI_UART2_PD, "peri_uart2_pd", "faxi", 19),
 	GATE_PERI0(CLK_PERI_UART3_PD, "peri_uart3_pd", "faxi", 20),
@@ -459,12 +464,12 @@ static struct mtk_composite infra_muxes[] = {
 
 static struct mtk_composite top_muxes[] = {
 	/* CLK_CFG_0 */
-	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
-		 0x040, 0, 3, 7),
-	MUX_GATE(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
-		 0x040, 8, 1, 15),
-	MUX_GATE(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
-		 0x040, 16, 1, 23),
+	MUX_GATE_FLAGS(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
+		       0x040, 0, 3, 7, CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
+		       0x040, 8, 1, 15, CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
+		       0x040, 16, 1, 23, CLK_IS_CRITICAL),
 	MUX_GATE(CLK_TOP_ETH_SEL, "eth_sel", eth_parents,
 		 0x040, 24, 3, 31),
 	/* CLK_CFG_1 */
@@ -568,10 +573,6 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 				    ARRAY_SIZE(top_muxes), base,
 				    &mt7629_clk_lock, clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_TOP_AXI_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_MEM_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_DDRPHYCFG_SEL]->clk);
-
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
@@ -620,8 +621,6 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	clk_prepare_enable(clk_data->hws[CLK_PERI_UART0_PD]->clk);
-
 	return 0;
 }
 
@@ -640,9 +639,6 @@ static int mtk_apmixedsys_init(struct platform_device *pdev)
 	mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
 			       ARRAY_SIZE(apmixed_clks), clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_ARMPLL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_MAIN_CORE_EN]->clk);
-
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
-- 
2.51.0

