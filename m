Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4999336883;
	Thu, 26 Mar 2026 05:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501880; cv=none; b=DClE02MTw2VNH9hxgMqjCBX9hxJZGFQGFNh7gXtFujtnKsytFSVXHJbaa61UzfCiXHYDjO2qqk6yDhmRcPDFk4nlFXd02GxLe/t7wrvtmkwL+KtD0MSCEKLEIfHw7OuHz+I3O3O4cu6gvw5uLG4TDn4vs5NUSo476i+P9ZZwuvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501880; c=relaxed/simple;
	bh=ovjHhxuJmR36VfPtZcQ3akjHWlGKARYQTrKMbjn6SFM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4JnffAjP6wX2e/LjVSO+rmn7S3TKzwkDN8aNe6q0ZVsTEBD8TMNNV1NXj6PimPc0ItYwb1wGmysgT2+dBhcdlqYPz988dSUT7n1px6yLS8WlbRbIe9s1nNvEqyGYFJYHerGr7ehLhOzWLVxFYxIceDluLk8h8WutiNdvoqDpkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1w5czz-000000006rQ-2Glz;
	Thu, 26 Mar 2026 05:11:15 +0000
Date: Thu, 26 Mar 2026 05:11:12 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Ikjoon Jang <ikjn@chromium.org>, Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/3] clk: mediatek: mt7988: use MUX_CLR_SET for gate-less
 muxes
Message-ID: <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774499536.git.daniel@makrotopia.org>

All 19 muxes in the infra_muxes[] array are pure mux selectors without
a clock gate or update register, yet they were defined using
MUX_GATE_CLR_SET_UPD with gate_shift = -1.

This macro assigns mtk_mux_gate_clr_set_upd_ops, whose
enable/disable/is_enabled callbacks perform BIT(gate_shift). Since
gate_shift is stored as u8, the -1 truncates to 255, causing a
shift-out-of-bounds at runtime:

UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
shift exponent 255 is too large for 64-bit type 'long unsigned int'

UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:102:4
shift exponent 255 is too large for 64-bit type 'long unsigned int'

UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:122:16
shift exponent 255 is too large for 64-bit type 'long unsigned int'

Switch these definitions to MUX_CLR_SET, which uses
mtk_mux_clr_set_upd_ops (no gate callbacks) and does not require
callers to pass sentinel values for unused update register fields.
The actual clock gating for these peripherals is handled by the
separate GATE_INFRA* definitions further down.

Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 80 ++++++++++------------
 1 file changed, 38 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index ef8267319d91b..13ffa9d88e24b 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -56,49 +56,45 @@ static const char *const infra_pcie_gfmux_tl_ck_o_p3_parents[] __initconst = {
 
 static const struct mtk_mux infra_muxes[] = {
 	/* MODULE_CLK_SEL_0 */
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
-			     infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
-			     infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
-			     infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel", infra_mux_spi0_parents,
-			     0x0018, 0x0010, 0x0014, 4, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel", infra_mux_spi1_parents,
-			     0x0018, 0x0010, 0x0014, 5, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel", infra_mux_spi0_parents,
-			     0x0018, 0x0010, 0x0014, 6, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_SEL, "infra_pwm_sel", infra_pwm_bck_parents, 0x0018,
-			     0x0010, 0x0014, 14, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 16, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 18, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 20, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 22, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 24, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 26, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 28, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 30, 2, -1, -1, -1),
+	MUX_CLR_SET(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
+		    infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
+		    infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
+		    infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel",
+		    infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 4, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel",
+		    infra_mux_spi1_parents, 0x0018, 0x0010, 0x0014, 5, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel",
+		    infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 6, 1),
+	MUX_CLR_SET(CLK_INFRA_PWM_SEL, "infra_pwm_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 14, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 16, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 18, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 20, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 22, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 24, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 26, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 28, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 30, 2),
 	/* MODULE_CLK_SEL_1 */
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL, "infra_pcie_gfmux_tl_o_p0_sel",
-			     infra_pcie_gfmux_tl_ck_o_p0_parents, 0x0028, 0x0020, 0x0024, 0, 2, -1,
-			     -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL, "infra_pcie_gfmux_tl_o_p1_sel",
-			     infra_pcie_gfmux_tl_ck_o_p1_parents, 0x0028, 0x0020, 0x0024, 2, 2, -1,
-			     -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL, "infra_pcie_gfmux_tl_o_p2_sel",
-			     infra_pcie_gfmux_tl_ck_o_p2_parents, 0x0028, 0x0020, 0x0024, 4, 2, -1,
-			     -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL, "infra_pcie_gfmux_tl_o_p3_sel",
-			     infra_pcie_gfmux_tl_ck_o_p3_parents, 0x0028, 0x0020, 0x0024, 6, 2, -1,
-			     -1, -1),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL, "infra_pcie_gfmux_tl_o_p0_sel",
+		    infra_pcie_gfmux_tl_ck_o_p0_parents, 0x0028, 0x0020, 0x0024, 0, 2),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL, "infra_pcie_gfmux_tl_o_p1_sel",
+		    infra_pcie_gfmux_tl_ck_o_p1_parents, 0x0028, 0x0020, 0x0024, 2, 2),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL, "infra_pcie_gfmux_tl_o_p2_sel",
+		    infra_pcie_gfmux_tl_ck_o_p2_parents, 0x0028, 0x0020, 0x0024, 4, 2),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL, "infra_pcie_gfmux_tl_o_p3_sel",
+		    infra_pcie_gfmux_tl_ck_o_p3_parents, 0x0028, 0x0020, 0x0024, 6, 2),
 };
 
 static const struct mtk_gate_regs infra0_cg_regs = {
-- 
2.53.0
