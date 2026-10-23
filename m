Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792750711;
	b=pKhEJaDQ4fR1Vjai6bb0gGEyiR07ec1tLrZQqbTy8YzPciReMGc+P/mFQcULbdjt6yre
	 tF7PmYdnRkzE8D2A8SgvTLyuJYUBkTAdr4UHA4Lu/LuitBlP+aARFd6Uz77qCeojTg72H
	 WCpVECHIPYXI450KxHJ3b/6TR3s5T8OYFriSdmKm5r62SI0Sw/w9Z/4w9kO0dUTAo0Zk/
	 +UicxhcOYp6JsDT1PfNygVmnqP2JpC6khL2rJQcv97G6MM1rNHip2T1IhPL4pKk9UQ+Tg
	 +tD93Q7yU7Xas0ctqj3Ly5IFsgcV0QuJ8Ru7A+17tVzu26x35eeF0Lk5adxWpAsqfBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750711;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JYWyavs1OxxGT2qSBvCj6jEeJodb260A+oeQnUOlX3Y=;
	b=I/Rl0giZDC8qE3Wbn0eUyevv+uvpS18lyYkLuFjTLEK2V1G7xCnQ5n0zHqPAYriO+Z+/
	 1uPvovbshqjYU3m+hBz/QFc+ySfxJN+EVBXmEVu7StH7I3TSnc+P8jxg03aAPViJEzsqZ
	 qvz92Boeva0P8pgsXPJteOxn7tto8U32KdcUN+Obzs2QLmZbxdbbiTR8BjSzhX172rqL7
	 C4PRhCTEMNUYAFp+5J/cA01WmluNwDMCs0nKa3dA88NZujJ1WSwQHaL+gp88RMU2Dfsyn
	 sjGUfKkH0BQncr+5bCH3aQMnU5gUtS+OZaXBcfSP0s38zf001OmYTlMbu3SfO0NDgWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bt6ZVQp9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1F6606A328;
	Fri, 23 Oct 2026 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bt6ZVQp9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792750710;
	b=PPFgtD/X1R5RE6d9mrO8kiSE0vCiju+yetzt+uCt1qhX9d5oQCKPN4QGDuTtbE27b34x
	 8nKK//w44uW77KbLCPAI/u8O6K5yMcUWPXKMlLvMyDoG4voRxI69Hy3yss1KST4BsiPQx
	 SEgy5s0j0U0tDqyVdJEJUhJpe0wKXTZaOzwRroYOaoYHSKGoFDEWvvMgchImQY6gSCxvy
	 8fnufs+k98ZhSPiBy81kFGYumzXicQcFgKc8KHUTMpKI1SuTRieycuvYK3toEdfTqH7eh
	 DvHG6F1POHT63Y0I9juWDTuI5PeRgcmJxMj3Tt1sMz0arXYR11g8efm5isCzXOV1fqg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792750710;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JYWyavs1OxxGT2qSBvCj6jEeJodb260A+oeQnUOlX3Y=;
	b=m3hV7dtwCsCFyueX+RhKVY6dRTkYFMUTmIYyc6QLdeqF9AdvKaMvpt5GXCMBU0Ru9pu/
	 0Gt5H0yMFwkncslwC2m7g82O6oQ4HkxOtT/+mSjvxn4Y5RYq6dHs4LZQmtK6MuLFiGPx2
	 kRLep2PwWOVO2Rv63jJRdwvJSv+7uKxeY46Y6Z8/UhWbpmec5R9w6taHgZnF1K6WbZ7+S
	 YZrIBabWH9HivU+x83xwRjM+A/RAaG8dsS+jBgfzLK28rmXiIU35hPpMWVapzIh5nc0Zh
	 jVw3wuxfdtV6Xp+9ikmLg04hJKPQg3bBsK+oIW9n6t4uxmVE4K6gwCDDKG+JTbZF+8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2F2D1F01829;
	Fri, 23 Oct 2026 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792750710;
	bh=JYWyavs1OxxGT2qSBvCj6jEeJodb260A+oeQnUOlX3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bt6ZVQp9v5ajH3jghmXUForihudId36+z70hKmk9SnHHw1WUVaAMnYYIcQ6gWOTMb
	 +iIm0CSyyIIQ7sY8lF36nCMbCgj+BpQCXjuSwQ1J5NAI9u0MRoiRZHhh4zKZL6+E0E
	 XJsSSmLZPUtgPBvcBJEopPDR3/J03JYoa7hPhYrp3+5cO4WUOvB6pkbS3DeMOX1z0s
	 ToCXWQOHQMseikS7SEg/ETHLNj+pfUf3LRna5I3tsFD5AUbk0yopvg8ZeC9njcGoW3
	 LWpm9xRcrc7Uh90JP2irYmrjwglaKsliefe9Or4rdIHD2j1V4oQ8imXFJdKtYoEH1V
	 BdOdQihCtmaXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 68A58444A9;
	Fri, 23 Oct 2026 10:18:28 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 23 Oct 2026 15:48:25 +0530
Subject: [PATCH 2/2] clk: qcom: Add SM7250 display clock controller driver
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261023-dispcc-sm7250-v1-2-07bdefb99801@brar.si>
References: <20261023-dispcc-sm7250-v1-0-07bdefb99801@brar.si>
In-Reply-To: <20261023-dispcc-sm7250-v1-0-07bdefb99801@brar.si>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792750706; l=31535;
 i=patches@brar.si; h=from:subject:message-id;
 bh=MYQ6KF13bh80QWT1LFmguqBHNi3cdNZbsQyBOmOir0w=;
 b=ZHyiP7Vy2YIqRFK/GpFPACBMBwtTkNrO1ffgq8wMD/LpkyfwfpOQSHNUBbgglTn8pD+8eiIwS
 g1iNSaJhhn8D+vQSDDGYtnxrW4J2NtpCpwKVr3j5wQoBNvg9G+zU89v
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Add a driver for the display clock controller of the Qualcomm SM7250
SoC (Snapdragon 765/765G/768G). It provides the MDSS clocks, the MDSS
GDSC and the core reset. The register layout is the same as on SM7150,
which this driver is derived from; the differences are the Lucid PLL, whose
settings come from the downstream driver of the platform, and the AHB, MDP
and rotator clocks, which take GPLL0 from the GCC as a parent.

Tested on a OnePlus Nord: the controller probes and the MDSS clocks and
power domain drive the DSI panel.

Assisted-by: Claude
Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/clk/qcom/Kconfig         |   11 +
 drivers/clk/qcom/Makefile        |    1 +
 drivers/clk/qcom/dispcc-sm7250.c | 1009 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 1021 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d..503b6aa12 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1609,6 +1609,17 @@ config SM_DISPCC_7150
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
+config SM_DISPCC_7250
+	tristate "SM7250 Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	depends on SM_GCC_7250
+	default m if ARCH_QCOM
+	help
+	  Support for the display clock controller on Qualcomm Technologies, Inc
+	  SM7250 devices.
+	  Say Y if you want to support display devices and functionality such as
+	  splash screen.
+
 config SM_DISPCC_8250
 	tristate "SM8150/SM8250/SM8350 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073..995be8e92 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -181,6 +181,7 @@ obj-$(CONFIG_SM_DISPCC_6125) += dispcc-sm6125.o
 obj-$(CONFIG_SM_DISPCC_6350) += dispcc-sm6350.o
 obj-$(CONFIG_SM_DISPCC_6375) += dispcc-sm6375.o
 obj-$(CONFIG_SM_DISPCC_7150) += dispcc-sm7150.o
+obj-$(CONFIG_SM_DISPCC_7250) += dispcc-sm7250.o
 obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
 obj-$(CONFIG_SM_DISPCC_8450) += dispcc-sm8450.o
 obj-$(CONFIG_SM_DISPCC_8550) += dispcc-sm8550.o
diff --git a/drivers/clk/qcom/dispcc-sm7250.c b/drivers/clk/qcom/dispcc-sm7250.c
new file mode 100644
index 000000000..f114a9f54
--- /dev/null
+++ b/drivers/clk/qcom/dispcc-sm7250.c
@@ -0,0 +1,1009 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ * Copyright (c) 2024, David Wronek <david@mainlining.org>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm7250-dispcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_GCC_DISP_GPLL0_CLK,
+	DT_CHIP_SLEEP_CLK,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+	DT_DP_PHY_PLL_LINK_CLK,
+	DT_DP_PHY_PLL_VCO_DIV_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_CHIP_SLEEP_CLK,
+	P_DISPCC_PLL0_OUT_EVEN,
+	P_DISPCC_PLL0_OUT_MAIN,
+	P_DP_PHY_PLL_LINK_CLK,
+	P_DP_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+	P_GCC_DISP_GPLL0_CLK,
+};
+
+static const struct pll_vco lucid_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+/* 1035 MHz configuration (19.2 MHz * (0x35 + 0xe800 / 2^16)) */
+static const struct alpha_pll_config dispcc_pll0_config = {
+	.l = 0x35,
+	.cal_l = 0x44,
+	.alpha = 0xe800,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0x329a699c,
+	.user_ctl_val = 0x00000001,
+	.user_ctl_hi_val = 0x00000805,
+	.user_ctl_hi1_val = 0x00000000,
+	.test_ctl_hi1_val = 0x01800000,
+};
+
+static struct clk_alpha_pll dispcc_pll0 = {
+	.offset = 0x0,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct parent_map dispcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 2 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map dispcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map dispcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct clk_parent_data dispcc_parent_data_2_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct parent_map dispcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISPCC_PLL0_OUT_MAIN, 1 },
+	{ P_GCC_DISP_GPLL0_CLK, 4 },
+	{ P_DISPCC_PLL0_OUT_EVEN, 5 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dispcc_pll0.clkr.hw },
+	{ .index = DT_GCC_DISP_GPLL0_CLK },
+	{ .hw = &dispcc_pll0.clkr.hw },
+};
+
+static const struct parent_map dispcc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+};
+
+static const struct parent_map dispcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_DISP_GPLL0_CLK, 4 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GCC_DISP_GPLL0_CLK },
+};
+
+static const struct parent_map dispcc_parent_map_6[] = {
+	{ P_CHIP_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_6[] = {
+	{ .index = DT_CHIP_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_dispcc_mdss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(37500000, P_GCC_DISP_GPLL0_CLK, 16, 0, 0),
+	F(75000000, P_GCC_DISP_GPLL0_CLK, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x22bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_5,
+	.freq_tbl = ftbl_dispcc_mdss_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_ahb_clk_src",
+		.parent_data = dispcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dispcc_mdss_byte0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x2110,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_0,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_byte0_clk_src",
+		.parent_data = dispcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_byte1_clk_src = {
+	.cmd_rcgr = 0x212c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_0,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_byte1_clk_src",
+		.parent_data = dispcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_dp_aux_clk_src = {
+	.cmd_rcgr = 0x21dc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_2,
+	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_dp_aux_clk_src",
+		.parent_data = dispcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dispcc_mdss_dp_crypto_clk_src[] = {
+	F(108000, P_DP_PHY_PLL_LINK_CLK, 3, 0, 0),
+	F(180000, P_DP_PHY_PLL_LINK_CLK, 3, 0, 0),
+	F(360000, P_DP_PHY_PLL_LINK_CLK, 1.5, 0, 0),
+	F(540000, P_DP_PHY_PLL_LINK_CLK, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_mdss_dp_crypto_clk_src = {
+	.cmd_rcgr = 0x2194,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_1,
+	.freq_tbl = ftbl_dispcc_mdss_dp_crypto_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_dp_crypto_clk_src",
+		.parent_data = dispcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_dp_link_clk_src = {
+	.cmd_rcgr = 0x2178,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_1,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_dp_link_clk_src",
+		.parent_data = dispcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_dp_pixel1_clk_src = {
+	.cmd_rcgr = 0x21c4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_1,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_dp_pixel1_clk_src",
+		.parent_data = dispcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_dp_pixel_clk_src = {
+	.cmd_rcgr = 0x21ac,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_1,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_dp_pixel_clk_src",
+		.parent_data = dispcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x2148,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_0,
+	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_esc0_clk_src",
+		.parent_data = dispcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_esc1_clk_src = {
+	.cmd_rcgr = 0x2160,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_0,
+	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_esc1_clk_src",
+		.parent_data = dispcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dispcc_mdss_mdp_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_GCC_DISP_GPLL0_CLK, 3, 0, 0),
+	F(300000000, P_GCC_DISP_GPLL0_CLK, 2, 0, 0),
+	F(345000000, P_DISPCC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(460000000, P_DISPCC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x20c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_3,
+	.freq_tbl = ftbl_dispcc_mdss_mdp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_mdp_clk_src",
+		.parent_data = dispcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x2098,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_pclk0_clk_src",
+		.parent_data = dispcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_pclk1_clk_src = {
+	.cmd_rcgr = 0x20b0,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_pclk1_clk_src",
+		.parent_data = dispcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dispcc_mdss_rot_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_GCC_DISP_GPLL0_CLK, 3, 0, 0),
+	F(300000000, P_GCC_DISP_GPLL0_CLK, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_mdss_rot_clk_src = {
+	.cmd_rcgr = 0x20e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_3,
+	.freq_tbl = ftbl_dispcc_mdss_rot_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_rot_clk_src",
+		.parent_data = dispcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_3),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x20f8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_2,
+	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_vsync_clk_src",
+		.parent_data = dispcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dispcc_sleep_clk_src[] = {
+	F(32000, P_CHIP_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_sleep_clk_src = {
+	.cmd_rcgr = 0x6060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_6,
+	.freq_tbl = ftbl_dispcc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_sleep_clk_src",
+		.parent_data = dispcc_parent_data_6,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_6),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_xo_clk_src = {
+	.cmd_rcgr = 0x6044,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_2,
+	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_xo_clk_src",
+		.parent_data = dispcc_parent_data_2_ao,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_2_ao),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch dispcc_mdss_ahb_clk = {
+	.halt_reg = 0x2080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_byte0_clk = {
+	.halt_reg = 0x2028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div dispcc_mdss_byte0_div_clk_src = {
+	.reg = 0x2128,
+	.shift = 0,
+	.width = 2,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte0_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x202c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x202c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte0_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_byte1_clk = {
+	.halt_reg = 0x2030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div dispcc_mdss_byte1_div_clk_src = {
+	.reg = 0x2144,
+	.shift = 0,
+	.width = 2,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte1_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_byte1_intf_clk = {
+	.halt_reg = 0x2034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte1_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_aux_clk = {
+	.halt_reg = 0x2054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_crypto_clk = {
+	.halt_reg = 0x2048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_crypto_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_link_clk = {
+	.halt_reg = 0x2040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_link_intf_clk = {
+	.halt_reg = 0x2044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_pixel1_clk = {
+	.halt_reg = 0x2050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_pixel_clk = {
+	.halt_reg = 0x204c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x204c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_pixel_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_pixel_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_esc0_clk = {
+	.halt_reg = 0x2038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_esc1_clk = {
+	.halt_reg = 0x203c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x203c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_esc1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_mdp_clk = {
+	.halt_reg = 0x200c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x201c,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x201c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_mdp_lut_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0x4004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x4004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_non_gdsc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_pclk0_clk = {
+	.halt_reg = 0x2004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_pclk1_clk = {
+	.halt_reg = 0x2008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_pclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_rot_clk = {
+	.halt_reg = 0x2014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_rot_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_rot_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_rscc_ahb_clk = {
+	.halt_reg = 0x400c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x400c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_rscc_ahb_clk",
+			.parent_names = (const char *[]) {
+				"dispcc_mdss_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_rscc_vsync_clk = {
+	.halt_reg = 0x4008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_rscc_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_vsync_clk = {
+	.halt_reg = 0x2024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_sleep_clk = {
+	.halt_reg = 0x6078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_sleep_clk",
+			.parent_names = (const char *[]) {
+				"dispcc_sleep_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc mdss_gdsc = {
+	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
+};
+
+static struct clk_regmap *dispcc_sm7250_clocks[] = {
+	[DISPCC_MDSS_AHB_CLK] = &dispcc_mdss_ahb_clk.clkr,
+	[DISPCC_MDSS_AHB_CLK_SRC] = &dispcc_mdss_ahb_clk_src.clkr,
+	[DISPCC_MDSS_BYTE0_CLK] = &dispcc_mdss_byte0_clk.clkr,
+	[DISPCC_MDSS_BYTE0_CLK_SRC] = &dispcc_mdss_byte0_clk_src.clkr,
+	[DISPCC_MDSS_BYTE0_DIV_CLK_SRC] = &dispcc_mdss_byte0_div_clk_src.clkr,
+	[DISPCC_MDSS_BYTE0_INTF_CLK] = &dispcc_mdss_byte0_intf_clk.clkr,
+	[DISPCC_MDSS_BYTE1_CLK] = &dispcc_mdss_byte1_clk.clkr,
+	[DISPCC_MDSS_BYTE1_CLK_SRC] = &dispcc_mdss_byte1_clk_src.clkr,
+	[DISPCC_MDSS_BYTE1_DIV_CLK_SRC] = &dispcc_mdss_byte1_div_clk_src.clkr,
+	[DISPCC_MDSS_BYTE1_INTF_CLK] = &dispcc_mdss_byte1_intf_clk.clkr,
+	[DISPCC_MDSS_DP_AUX_CLK] = &dispcc_mdss_dp_aux_clk.clkr,
+	[DISPCC_MDSS_DP_AUX_CLK_SRC] = &dispcc_mdss_dp_aux_clk_src.clkr,
+	[DISPCC_MDSS_DP_CRYPTO_CLK] = &dispcc_mdss_dp_crypto_clk.clkr,
+	[DISPCC_MDSS_DP_CRYPTO_CLK_SRC] = &dispcc_mdss_dp_crypto_clk_src.clkr,
+	[DISPCC_MDSS_DP_LINK_CLK] = &dispcc_mdss_dp_link_clk.clkr,
+	[DISPCC_MDSS_DP_LINK_CLK_SRC] = &dispcc_mdss_dp_link_clk_src.clkr,
+	[DISPCC_MDSS_DP_LINK_INTF_CLK] = &dispcc_mdss_dp_link_intf_clk.clkr,
+	[DISPCC_MDSS_DP_PIXEL1_CLK] = &dispcc_mdss_dp_pixel1_clk.clkr,
+	[DISPCC_MDSS_DP_PIXEL1_CLK_SRC] = &dispcc_mdss_dp_pixel1_clk_src.clkr,
+	[DISPCC_MDSS_DP_PIXEL_CLK] = &dispcc_mdss_dp_pixel_clk.clkr,
+	[DISPCC_MDSS_DP_PIXEL_CLK_SRC] = &dispcc_mdss_dp_pixel_clk_src.clkr,
+	[DISPCC_MDSS_ESC0_CLK] = &dispcc_mdss_esc0_clk.clkr,
+	[DISPCC_MDSS_ESC0_CLK_SRC] = &dispcc_mdss_esc0_clk_src.clkr,
+	[DISPCC_MDSS_ESC1_CLK] = &dispcc_mdss_esc1_clk.clkr,
+	[DISPCC_MDSS_ESC1_CLK_SRC] = &dispcc_mdss_esc1_clk_src.clkr,
+	[DISPCC_MDSS_MDP_CLK] = &dispcc_mdss_mdp_clk.clkr,
+	[DISPCC_MDSS_MDP_CLK_SRC] = &dispcc_mdss_mdp_clk_src.clkr,
+	[DISPCC_MDSS_MDP_LUT_CLK] = &dispcc_mdss_mdp_lut_clk.clkr,
+	[DISPCC_MDSS_NON_GDSC_AHB_CLK] = &dispcc_mdss_non_gdsc_ahb_clk.clkr,
+	[DISPCC_MDSS_PCLK0_CLK] = &dispcc_mdss_pclk0_clk.clkr,
+	[DISPCC_MDSS_PCLK0_CLK_SRC] = &dispcc_mdss_pclk0_clk_src.clkr,
+	[DISPCC_MDSS_PCLK1_CLK] = &dispcc_mdss_pclk1_clk.clkr,
+	[DISPCC_MDSS_PCLK1_CLK_SRC] = &dispcc_mdss_pclk1_clk_src.clkr,
+	[DISPCC_MDSS_ROT_CLK] = &dispcc_mdss_rot_clk.clkr,
+	[DISPCC_MDSS_ROT_CLK_SRC] = &dispcc_mdss_rot_clk_src.clkr,
+	[DISPCC_MDSS_RSCC_AHB_CLK] = &dispcc_mdss_rscc_ahb_clk.clkr,
+	[DISPCC_MDSS_RSCC_VSYNC_CLK] = &dispcc_mdss_rscc_vsync_clk.clkr,
+	[DISPCC_MDSS_VSYNC_CLK] = &dispcc_mdss_vsync_clk.clkr,
+	[DISPCC_MDSS_VSYNC_CLK_SRC] = &dispcc_mdss_vsync_clk_src.clkr,
+	[DISPCC_PLL0] = &dispcc_pll0.clkr,
+	[DISPCC_SLEEP_CLK] = &dispcc_sleep_clk.clkr,
+	[DISPCC_SLEEP_CLK_SRC] = &dispcc_sleep_clk_src.clkr,
+	[DISPCC_XO_CLK_SRC] = &dispcc_xo_clk_src.clkr,
+};
+
+static struct gdsc *dispcc_sm7250_gdscs[] = {
+	[MDSS_GDSC] = &mdss_gdsc,
+};
+
+static const struct qcom_reset_map dispcc_sm7250_resets[] = {
+	[DISPCC_MDSS_CORE_BCR] = { 0x2000 },
+};
+
+static const struct regmap_config dispcc_sm7250_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x10000,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc dispcc_sm7250_desc = {
+	.config = &dispcc_sm7250_regmap_config,
+	.clks = dispcc_sm7250_clocks,
+	.num_clks = ARRAY_SIZE(dispcc_sm7250_clocks),
+	.gdscs = dispcc_sm7250_gdscs,
+	.num_gdscs = ARRAY_SIZE(dispcc_sm7250_gdscs),
+	.resets = dispcc_sm7250_resets,
+	.num_resets = ARRAY_SIZE(dispcc_sm7250_resets),
+};
+
+static const struct of_device_id dispcc_sm7250_match_table[] = {
+	{ .compatible = "qcom,sm7250-dispcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dispcc_sm7250_match_table);
+
+static int dispcc_sm7250_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &dispcc_sm7250_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_lucid_pll_configure(&dispcc_pll0, regmap, &dispcc_pll0_config);
+	/* Enable clock gating for DSI and MDP clocks */
+	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
+
+	/* Keep some clocks always-on */
+	qcom_branch_set_clk_en(regmap, 0x605c); /* DISPCC_XO_CLK */
+
+	return qcom_cc_really_probe(&pdev->dev, &dispcc_sm7250_desc, regmap);
+}
+
+static struct platform_driver dispcc_sm7250_driver = {
+	.probe = dispcc_sm7250_probe,
+	.driver = {
+		.name = "dispcc-sm7250",
+		.of_match_table = dispcc_sm7250_match_table,
+	},
+};
+
+module_platform_driver(dispcc_sm7250_driver);
+
+MODULE_DESCRIPTION("Qualcomm SM7250 Display Clock Controller");
+MODULE_LICENSE("GPL");

-- 
2.56.0


