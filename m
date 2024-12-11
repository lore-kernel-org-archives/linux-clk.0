Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E1D17BEC6;
	Wed, 11 Dec 2024 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936411; cv=none; b=ZB87NrtZx/6IrVamCZ3toahJh4ioOpOKiw6sYNpHBx9S07fsqa52SyectGsJPdX/nPDolMN3mrLTLPItQu/YFxsEgu1sd10rOO2H68eEIYSEVq3e4+l4X4gPrlRtulLEhMnEPbLeB/nM9AyUyiDT+IcteSfsbEU2o/2Q4i8LbyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936411; c=relaxed/simple;
	bh=mp+w/6c+kLm2PeoceMc05WLjbyMA2Nm5bQQoGr192yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgt4DO8cNaMev1ZPAkOJ3GmCFds7tBm8nFYMFvK0OOnj0wV6zjCdPgsEOrIf5FnJDXsR52m82a/HYXtAad9NF5ihramTt6R/KVGgLjx28m+eNhNyPBWDzcloid4alk+DARoCM+2i5Bmzi24sThKmKz/A1cbueWPccEn2K0GSHxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W4RdAmt6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W4RdAmt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733936399;
	bh=mp+w/6c+kLm2PeoceMc05WLjbyMA2Nm5bQQoGr192yM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W4RdAmt6/4OXFB72/YhHQDzOMPtlW+2h6EDP6eiij79IT8Mi7GC0n0h6P8JnMbl19
	 SQ6vm98dhw2a6dcSVq++S5/XfhsBghGH5NH+uYXXk+86YMOM8wZHMgmreV9jDacNvr
	 LCSFoQuPSs5UZ6jQLJZKmVnau8VXKB0AhtcX+5PiaK5o7l0bwkU84yWy3nkYwDOAb4
	 RcRafhYs1MfRt2JiVHI4axEfKSXyfAe/d7CI1hw+1F/6DkzvRP105XzT52IuBFkK0V
	 iX/2a7JVT5x4Jx1Ck+ZSqR4xKJvf3QNcxQfJtc3v0uHcjApQri1FCHraNmM4A0g4f/
	 5O5fU3FscD5FA==
Received: from jupiter.universe (dyndsl-091-248-215-089.ewe-ip-backbone.de [91.248.215.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84B9D17E37C4;
	Wed, 11 Dec 2024 17:59:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8260148CC8F; Wed, 11 Dec 2024 17:59:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>,
	Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v12 5/5] clk: rockchip: rk3588: drop RK3588_LINKED_CLK
Date: Wed, 11 Dec 2024 17:58:54 +0100
Message-ID: <20241211165957.94922-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211165957.94922-1-sebastian.reichel@collabora.com>
References: <20241211165957.94922-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the proper GATE_LINK support, we no longer need to keep the
linked clocks always on. Thus it's time to drop the CLK_IS_CRITICAL
flag for them.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index d76ab27dd1b8..46dcbbcee54e 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -12,9 +12,6 @@
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include "clk.h"
 
-#define RK3588_LINKED_CLK		CLK_IS_CRITICAL
-
-
 #define RK3588_GRF_SOC_STATUS0		0x600
 #define RK3588_PHYREF_ALT_GATE		0xc38
 
@@ -1439,7 +1436,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE_NODIV(HCLK_NVM_ROOT,  "hclk_nvm_root", mux_200m_100m_50m_24m_p, 0,
 			RK3588_CLKSEL_CON(77), 0, 2, MFLAGS,
 			RK3588_CLKGATE_CON(31), 0, GFLAGS),
-	COMPOSITE(ACLK_NVM_ROOT, "aclk_nvm_root", gpll_cpll_p, RK3588_LINKED_CLK,
+	COMPOSITE(ACLK_NVM_ROOT, "aclk_nvm_root", gpll_cpll_p, 0,
 			RK3588_CLKSEL_CON(77), 7, 1, MFLAGS, 2, 5, DFLAGS,
 			RK3588_CLKGATE_CON(31), 1, GFLAGS),
 	GATE(ACLK_EMMC, "aclk_emmc", "aclk_nvm_root", 0,
@@ -1668,13 +1665,13 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(42), 9, GFLAGS),
 
 	/* vdpu */
-	COMPOSITE(ACLK_VDPU_ROOT, "aclk_vdpu_root", gpll_cpll_aupll_p, RK3588_LINKED_CLK,
+	COMPOSITE(ACLK_VDPU_ROOT, "aclk_vdpu_root", gpll_cpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(98), 5, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(44), 0, GFLAGS),
 	COMPOSITE_NODIV(ACLK_VDPU_LOW_ROOT, "aclk_vdpu_low_root", mux_400m_200m_100m_24m_p, 0,
 			RK3588_CLKSEL_CON(98), 7, 2, MFLAGS,
 			RK3588_CLKGATE_CON(44), 1, GFLAGS),
-	COMPOSITE_NODIV(HCLK_VDPU_ROOT, "hclk_vdpu_root", mux_200m_100m_50m_24m_p, RK3588_LINKED_CLK,
+	COMPOSITE_NODIV(HCLK_VDPU_ROOT, "hclk_vdpu_root", mux_200m_100m_50m_24m_p, 0,
 			RK3588_CLKSEL_CON(98), 9, 2, MFLAGS,
 			RK3588_CLKGATE_CON(44), 2, GFLAGS),
 	COMPOSITE(ACLK_JPEG_DECODER_ROOT, "aclk_jpeg_decoder_root", gpll_cpll_aupll_spll_p, 0,
@@ -1725,9 +1722,9 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(ACLK_RKVENC0_ROOT, "aclk_rkvenc0_root", gpll_cpll_npll_p, 0,
 			RK3588_CLKSEL_CON(102), 7, 2, MFLAGS, 2, 5, DFLAGS,
 			RK3588_CLKGATE_CON(47), 1, GFLAGS),
-	GATE(HCLK_RKVENC0, "hclk_rkvenc0", "hclk_rkvenc0_root", RK3588_LINKED_CLK,
+	GATE(HCLK_RKVENC0, "hclk_rkvenc0", "hclk_rkvenc0_root", 0,
 			RK3588_CLKGATE_CON(47), 4, GFLAGS),
-	GATE(ACLK_RKVENC0, "aclk_rkvenc0", "aclk_rkvenc0_root", RK3588_LINKED_CLK,
+	GATE(ACLK_RKVENC0, "aclk_rkvenc0", "aclk_rkvenc0_root", 0,
 			RK3588_CLKGATE_CON(47), 5, GFLAGS),
 	COMPOSITE(CLK_RKVENC0_CORE, "clk_rkvenc0_core", gpll_cpll_aupll_npll_p, 0,
 			RK3588_CLKSEL_CON(102), 14, 2, MFLAGS, 9, 5, DFLAGS,
@@ -1737,10 +1734,10 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(48), 6, GFLAGS),
 
 	/* vi */
-	COMPOSITE(ACLK_VI_ROOT, "aclk_vi_root", gpll_cpll_npll_aupll_spll_p, RK3588_LINKED_CLK,
+	COMPOSITE(ACLK_VI_ROOT, "aclk_vi_root", gpll_cpll_npll_aupll_spll_p, 0,
 			RK3588_CLKSEL_CON(106), 5, 3, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(49), 0, GFLAGS),
-	COMPOSITE_NODIV(HCLK_VI_ROOT, "hclk_vi_root", mux_200m_100m_50m_24m_p, RK3588_LINKED_CLK,
+	COMPOSITE_NODIV(HCLK_VI_ROOT, "hclk_vi_root", mux_200m_100m_50m_24m_p, 0,
 			RK3588_CLKSEL_CON(106), 8, 2, MFLAGS,
 			RK3588_CLKGATE_CON(49), 1, GFLAGS),
 	COMPOSITE_NODIV(PCLK_VI_ROOT, "pclk_vi_root", mux_100m_50m_24m_p, 0,
@@ -1910,10 +1907,10 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(ACLK_VOP_ROOT, "aclk_vop_root", gpll_cpll_dmyaupll_npll_spll_p, 0,
 			RK3588_CLKSEL_CON(110), 5, 3, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(52), 0, GFLAGS),
-	COMPOSITE_NODIV(ACLK_VOP_LOW_ROOT, "aclk_vop_low_root", mux_400m_200m_100m_24m_p, RK3588_LINKED_CLK,
+	COMPOSITE_NODIV(ACLK_VOP_LOW_ROOT, "aclk_vop_low_root", mux_400m_200m_100m_24m_p, 0,
 			RK3588_CLKSEL_CON(110), 8, 2, MFLAGS,
 			RK3588_CLKGATE_CON(52), 1, GFLAGS),
-	COMPOSITE_NODIV(HCLK_VOP_ROOT, "hclk_vop_root", mux_200m_100m_50m_24m_p, RK3588_LINKED_CLK,
+	COMPOSITE_NODIV(HCLK_VOP_ROOT, "hclk_vop_root", mux_200m_100m_50m_24m_p, 0,
 			RK3588_CLKSEL_CON(110), 10, 2, MFLAGS,
 			RK3588_CLKGATE_CON(52), 2, GFLAGS),
 	COMPOSITE_NODIV(PCLK_VOP_ROOT, "pclk_vop_root", mux_100m_50m_24m_p, 0,
@@ -2416,7 +2413,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 static struct rockchip_clk_branch rk3588_clk_branches[] = {
 	GATE_LINK(ACLK_ISP1_PRE, "aclk_isp1_pre", "aclk_isp1_root", ACLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 6, GFLAGS),
 	GATE_LINK(HCLK_ISP1_PRE, "hclk_isp1_pre", "hclk_isp1_root", HCLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 8, GFLAGS),
-	GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(31), 2, GFLAGS),
+	GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, 0, RK3588_CLKGATE_CON(31), 2, GFLAGS),
 	GATE_LINK(ACLK_USB, "aclk_usb", "aclk_usb_root", ACLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(42), 2, GFLAGS),
 	GATE_LINK(HCLK_USB, "hclk_usb", "hclk_usb_root", HCLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(42), 3, GFLAGS),
 	GATE_LINK(ACLK_JPEG_DECODER_PRE, "aclk_jpeg_decoder_pre", "aclk_jpeg_decoder_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(44), 7, GFLAGS),
@@ -2428,9 +2425,9 @@ static struct rockchip_clk_branch rk3588_clk_branches[] = {
 	GATE_LINK(HCLK_RKVDEC1_PRE, "hclk_rkvdec1_pre", "hclk_rkvdec1_root", HCLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(41), 4, GFLAGS),
 	GATE_LINK(ACLK_RKVDEC1_PRE, "aclk_rkvdec1_pre", "aclk_rkvdec1_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(41), 5, GFLAGS),
 	GATE_LINK(ACLK_HDCP0_PRE, "aclk_hdcp0_pre", "aclk_vo0_root", ACLK_VOP_LOW_ROOT, 0, RK3588_CLKGATE_CON(55), 9, GFLAGS),
-	GATE_LINK(HCLK_VO0, "hclk_vo0", "hclk_vo0_root", HCLK_VOP_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(55), 5, GFLAGS),
+	GATE_LINK(HCLK_VO0, "hclk_vo0", "hclk_vo0_root", HCLK_VOP_ROOT, 0, RK3588_CLKGATE_CON(55), 5, GFLAGS),
 	GATE_LINK(ACLK_HDCP1_PRE, "aclk_hdcp1_pre", "aclk_hdcp1_root", ACLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(59), 6, GFLAGS),
-	GATE_LINK(HCLK_VO1, "hclk_vo1", "hclk_vo1_root", HCLK_VO1USB_TOP_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(59), 9, GFLAGS),
+	GATE_LINK(HCLK_VO1, "hclk_vo1", "hclk_vo1_root", HCLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(59), 9, GFLAGS),
 	GATE_LINK(ACLK_AV1_PRE, "aclk_av1_pre", "aclk_av1_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(68), 1, GFLAGS),
 	GATE_LINK(PCLK_AV1_PRE, "pclk_av1_pre", "pclk_av1_root", HCLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(68), 4, GFLAGS),
 	GATE_LINK(HCLK_SDIO_PRE, "hclk_sdio_pre", "hclk_sdio_root", HCLK_NVM, 0, RK3588_CLKGATE_CON(75), 1, GFLAGS),
-- 
2.45.2

