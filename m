Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714D947A868
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714925; cv=none; b=ufp4P5jRoyaEogEx1EgDeGip1INaj3Xwv+GJDSmsmHpfIjZ00ZJWxM2dOto6LXXQlBiVB4E+fDxF8bZVz3KRIBHz5G2U4+vAiJ2L3ySLjefKSTzOgBnMgpbztbsOujNEf39WcT2nwUA9F5Om3TguYuJN3zz2jMGucxa2oYdixtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714925; c=relaxed/simple;
	bh=jdM+/aN/09aDljMrxaz9Ru0JnOaXweJ9me5BbEytW2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQqY+QUym54qJumm+6SbwTjUmUfijiiMhXxM3Gn1jq8Af1w9dTwuCIQ/OIQpMn36jCqWYh5S497CmQ1XeIuE6o/1LHYIABSUfoDWh+Wbw+SO0POPf38YEwIbu3f8sdPmNXdaKp31ZrrN6JGrNnEqAKrY0lEhpcEluUFmnV+CD8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TL30AGjO; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TL30AGjO"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso861319a91.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714923; x=1787319723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vesdrJBOwlQOlA8CDULI3Zoo3petA5kgW0e7uLS9npA=;
        b=TL30AGjOUqFY+eJvkPa5C6L9II9uXe65L0yQcWrE3SSY4qehuoEMBOXPowp09YnxgQ
         2YZX6cIs0iWK2LMQmQKASIIGN/aK4IKWZ9d8MyC4EP5ybDbSH+wESxPimVuCkMMoNamh
         J3mTYDZQpmtE4DNn+38oqoug2oisr9R1gesX/yWLrFQJYerk55tYfaK+0jHKsaiJ+Mh+
         E8nHMKMjwtEbY1J0qAId9jUOZdYlA5MDng3PsWvcAfwqUPCNmngCzweK+QokhMvM3Uzg
         GdzWlNZuBlRbRcOjl/lU5n4xxgpZY57qraIHlZZFIOfQFBC1HipD10E4FxGp7zWykk8b
         lS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714923; x=1787319723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vesdrJBOwlQOlA8CDULI3Zoo3petA5kgW0e7uLS9npA=;
        b=kfjiw6RgPVC9XhLMvKyLB05TW9efPpIaLrmBIQC61QfU2NvV2db/oZovlISXO7Bjg/
         PBkHTuoGb7Zm/sfH+XzGLnTUS3cmd97Mek/tfAtUJYJwTgrA1PZv6UEtnyiieFCEryT1
         1kwSiLNC8RuDx9TrqlxwOsBtNw7umgoW6hBpF12fGIoXOBp6uU7YVb0AZHH5i6cri0LF
         IgBa7rxGI2wEYxygqJ8Qx81ZWFMentSBNi1vg5+St5vs8vjqZxW+AtsO4/+qFDJT+Dbp
         Mxb/u9f95gyBoy7yJfwcrT3dcrJJfYgjLdaFr283WirnAwZPUToDbYT3tmn+LE3X8Ixq
         tUkw==
X-Gm-Message-State: AOJu0Yy1oL0UyPZRDx7Y2vthOJtm19G5QfP9naRlWdQciNtUrQwWWHnM
	Aabi8ltm0HgUD/0Svyw3fa0rDGrirIUvU0BPe0r+0+hZ6bNzXovX0zDV
X-Gm-Gg: AR+sD10BZj6mV4sCRi/iloapXMe+n/Tqg4ELfegKen+Bgxm0Xgy0TwztTnQwgv04Shv
	0OUroXiTqLoa2QUknfagLpq/Nv3Z6ohm+/gajr7SY6GdOzoFQkNBF4QVYLZLWrrPn/tKeZXMpZZ
	kI2T7oFi1yVriXpcnDKykOu8aSs2MHmpwIyDMdvOy2EIPB9GSjHM3Vaj/nlXyQfUrul9YZB27gH
	akClNpHhhbdTuFrl/R+pwNVTI+jzxojGU+w2g2T5rL0441AkCpdNcXLzakQF/bWAGiEyjAB12ps
	jY/11RJNu0wdR+FuCGtJ+mLXl6AL96+lZr0g+X2nmxVOkACnzIopeEmIEcdSerRv32H2lkO399D
	thdwZ2e7k5WP2CbgxR17Wx7fmiMonCOB55HkUBZtINJ8LSjzCaoHwzU4owSTk3BaB5Xh7NdouJq
	ZifwJwcjezpiKjM2H7o439CJI59yioYzN7tuTE0JW17MyaJ1vdqgsZKGPZtvjepPnu8V0ckigGb
	xxZ+sDB
X-Received: by 2002:a17:90b:510a:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-3933ba87422mr6655253a91.16.1786714922710;
        Fri, 14 Aug 2026 06:42:02 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea972c79sm2932232a91.4.2026.08.14.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:42:02 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Wenzhen Yu <wenzhen.yu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] clk: mediatek: mt7629: Properly use CLK_IS_CRITICAL flag
Date: Fri, 14 Aug 2026 21:41:56 +0800
Message-ID: <20260814134156.1388413-1-ruoyuw560@gmail.com>
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
UART0 gate with CLK_IS_CRITICAL, and remove the manual enable calls. Keep
CLK_SET_RATE_PARENT on the three muxes while adding the critical flag.
The common clock framework then preserves the existing always-on behavior
without driver-owned prepare and enable references.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
Changes in v2:
- Preserve CLK_SET_RATE_PARENT on the AXI, memory and DDRPHY muxes.
- Rebase onto clk-next and repeat the focused ARM W=1 build.

v1: https://lore.kernel.org/r/20260813153113.3952621-1-ruoyuw560@gmail.com/

 drivers/clk/mediatek/clk-mt7629.c | 39 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8bb..1a3abffd3238f 100644
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
@@ -459,12 +464,15 @@ static struct mtk_composite infra_muxes[] = {
 
 static struct mtk_composite top_muxes[] = {
 	/* CLK_CFG_0 */
-	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
-		 0x040, 0, 3, 7),
-	MUX_GATE(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
-		 0x040, 8, 1, 15),
-	MUX_GATE(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
-		 0x040, 16, 1, 23),
+	MUX_GATE_FLAGS(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
+		       0x040, 0, 3, 7,
+		       CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
+		       0x040, 8, 1, 15,
+		       CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
+		       0x040, 16, 1, 23,
+		       CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
 	MUX_GATE(CLK_TOP_ETH_SEL, "eth_sel", eth_parents,
 		 0x040, 24, 3, 31),
 	/* CLK_CFG_1 */
@@ -568,10 +576,6 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 				    ARRAY_SIZE(top_muxes), base,
 				    &mt7629_clk_lock, clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_TOP_AXI_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_MEM_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_DDRPHYCFG_SEL]->clk);
-
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
@@ -620,8 +624,6 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	clk_prepare_enable(clk_data->hws[CLK_PERI_UART0_PD]->clk);
-
 	return 0;
 }
 
@@ -640,9 +642,6 @@ static int mtk_apmixedsys_init(struct platform_device *pdev)
 	mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
 			       ARRAY_SIZE(apmixed_clks), clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_ARMPLL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_MAIN_CORE_EN]->clk);
-
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 

base-commit: 684633bd76956b5d7ed59eb799e6fe7f45e47be4
-- 
2.51.0
