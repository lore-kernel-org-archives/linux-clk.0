Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810111;
	b=zaFufjc7hnhhZxy7QBl6Tfek7xnsoKDxLqLYQcrTIZ6jPr1YovRtEt4z+dp7FuWjl/w5
	 PFdQX8QQFr/ZPE8xN31P6N2mfBVqdGx2csHkT7s2ZkjwXiUKaQHto9rk4qb+1sonf6KrO
	 dCBs6MBM/YNxMTsVC95jFCatNx8TmQblPr08xvDUWgP4de5bQJdLfzQ5j3pya5Zc/rvwz
	 J6beo7xguNtXdJnDqC1C6VWeNvVICRADlIZxJySJ169jjqqtyd+5+GN3mt5EbEajsx1oQ
	 p9CC9NuwAWonQ/CnichcRs6iZf0LzkVzDxlgvDjCYL8tjrwVETsfVgIxwopNrWG2h3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810111;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K1iD1cRNoIchz7YibK6Xjd37LHFtddkJTve0pYIktac=;
	b=Q1P2P59L9dZMleIvwUR6R5CKLd6S6dheY3x183ehkrgIb95ON1v5UKDCWai10NMlu+dB
	 Wf3adcEPLtVt6/7nAA2ZjzdP+Cd5+i11A+USILM2ISyF0Mq8o8UIkuzY5WA+YIKZY6fHx
	 iW/l3U7ACzRA63PWKSrFoxn9LvKbhmTqCgkGaiB8Ais9XfsVl0Z6nshavTDZgFxY3wlyt
	 2Bl/ZrCo7UhH4KxJ1loWwQOkMMjTkIbJdfU0WyhIKlMwr8WSoWFYJGoryghW8ta1CLKm7
	 VFm5SsM2W0pFdevdegxk8LmWsICyoHfLgMLxhtJirMxkKphiTh1slEt8ZCxkcAOP4BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkMhmPQQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA503606A33E;
	Mon, 16 Nov 2026 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkMhmPQQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794810110;
	b=Mj0YhQGvpUwRGU0AtPi/3jnRVC9I4o8FZh1bMvURxqrvO1zNSsVoc1jvKLCspnc/FRXp
	 HYYGDgrvYgRaXeTyNyQWx+7+dTqPo5+5JMsxbDJdJpTVmesdDISR1h0w4faLOHfH1L1jt
	 LD8bNocf7qGHAoIg+YfTEvg8pbAnlx5ZN3ddTwOY5yBW9x+iEuGPzDvaZRmsT8ngw4LoG
	 crJveTK+aD1KvlfFRiyiI6rjboQMIrVI/50LWrCSTdcuaMUKgxQwcNz+Tg77mRTJsLV4X
	 D7xOoVJHzALPtohVG/Zm9AgA7XaZJvzifendqzrtWdqVuMkkwbDrY4UZI8xdtrKIOvQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794810110;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K1iD1cRNoIchz7YibK6Xjd37LHFtddkJTve0pYIktac=;
	b=WhXqO8eDGGS+CY4QVjtm29oY/IXO2TIHmFtJvlYuJ+OYg/vhPfbqBFebbQT3s5iFSuLM
	 P1f1+VwHDMVGDlck7JnmEt1LsqUhpVtcFab0BNBU6ysi4WOkVcztt62x4Hkv0OuYV9cJf
	 zW7XGj3bZStbaKz7Fs1h4scl65kKzonPK1QoLMJ7W6P7vNPbHCkP1O81C5c80kT5CETwt
	 QGsjc86ON9wALUik4D9RDYv7u8aeeVtbBpYd1BTNN4Lrat4VQz7dvrP91lwFRZUkp5fCy
	 LDVa3WIYaWav1/cHaMhraZlBB81VlcXTw1zcH6rTjletPX9rkRLC94BhenDgIgB5BZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 937481F000C6;
	Mon, 16 Nov 2026 06:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794810110;
	bh=K1iD1cRNoIchz7YibK6Xjd37LHFtddkJTve0pYIktac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TkMhmPQQQSX7gS9l+nHaHbI4azpYNpaGD+KO2tA8ZjnT5KzpvWnIT9+9+boO//GY7
	 Uj3gA80hTOPQreZ8bUa1sdPSYr4AtKoJMcxE76GnpvV/BSw1KdScTlaoxMRhNyx+MN
	 QFTh5ptPghTHlgVHZHXKJIedIAI1ehM04CTLv7k3Pgi4nlDNQ4LbJ3HAJ9EzTcDxuD
	 RAHTtFQdBvCnhEpSV7uaSjfl+f3kR1rIHlpi9FU6QBYfECi12CRZ+YiAICTSS/QTJ1
	 FMm/VQP7ba4HbC3p7IfkwuUIlicVDRzaYrJ4mi7YeU3kBmcZYj0oobAL3kstHPWruA
	 XUG8uZSAhBocg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2400B4A34E;
	Mon, 16 Nov 2026 06:21:49 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Mon, 16 Nov 2026 11:51:33 +0530
Subject: [PATCH RESEND v3 2/2] clk: qcom: Add SM7250 graphics clock
 controller driver
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
Message-Id: <20261116-gpucc-sm7250-v3-2-df68449f0e36@brar.si>
References: <20261116-gpucc-sm7250-v3-0-df68449f0e36@brar.si>
In-Reply-To: <20261116-gpucc-sm7250-v3-0-df68449f0e36@brar.si>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794810107; l=12422;
 i=patches@brar.si; h=from:subject:message-id;
 bh=ckhgizjQwGlEVMzW3DWXfG30a/SEFDgI20VGz+xSEiY=;
 b=MrYfej/xd8lwPxooFcGnqUHeCf5+Rgu+ReDQxG9+MtRWpuoL0oGoVRL8sjrKzc0/4CeRs/Pj2
 Z4HQCv5K/jIB/D6TVWIlKF0c9KGqz8l7fUw3WmLoq18+GQP/cl+Uc/3
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Add a driver for the graphics clock controller of the Qualcomm SM7250
SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
follows the SM8250 driver, since both use a Lucid PLL and the same GMU
clock setup; the PLL settings, frequency table, register offsets and
GDSC data come from the downstream driver of the platform.

Tested on a OnePlus Nord: the controller probes and provides the clocks and
power domains for the Adreno 620 GPU.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/clk/qcom/Kconfig        |  10 ++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/gpucc-sm7250.c | 379 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 390 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a..2df28d213246 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1878,6 +1878,16 @@ config SM_GPUCC_6350
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config SM_GPUCC_7250
+	tristate "SM7250 Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_7250
+	default m if ARCH_QCOM
+	help
+	  Support for the graphics clock controller on SM7250 devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config SM_GPUCC_MILOS
 	tristate "Milos Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073f26..421a9e5053c0 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -205,6 +205,7 @@ obj-$(CONFIG_SM_GPUCC_6115) += gpucc-sm6115.o
 obj-$(CONFIG_SM_GPUCC_6125) += gpucc-sm6125.o
 obj-$(CONFIG_SM_GPUCC_6350) += gpucc-sm6350.o
 obj-$(CONFIG_SM_GPUCC_6375) += gpucc-sm6375.o
+obj-$(CONFIG_SM_GPUCC_7250) += gpucc-sm7250.o
 obj-$(CONFIG_SM_GPUCC_8150) += gpucc-sm8150.o
 obj-$(CONFIG_SM_GPUCC_8250) += gpucc-sm8250.o
 obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
diff --git a/drivers/clk/qcom/gpucc-sm7250.c b/drivers/clk/qcom/gpucc-sm7250.c
new file mode 100644
index 000000000000..6cdb50c3cca7
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-sm7250.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm7250-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+#define CX_GMU_CBCR_SLEEP_MASK		GENMASK(7, 4)
+#define CX_GMU_CBCR_WAKE_MASK		GENMASK(11, 8)
+
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static const struct alpha_pll_config gpu_cc_pll1_config = {
+	.l = 0x1a,
+	.alpha = 0xaaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0x329a699c,
+	.user_ctl_val = 0x00000001,
+	.user_ctl_hi_val = 0x00000805,
+	.user_ctl_hi1_val = 0x00000000,
+	.test_ctl_hi1_val = 0x01800000,
+};
+
+static struct clk_alpha_pll gpu_cc_pll1 = {
+	.offset = 0x100,
+	.config = &gpu_cc_pll1_config,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN_DIV, 1.5, 0, 0),
+	F(500000000, P_GPU_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x1120,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x1078,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_crc_ahb_clk = {
+	.halt_reg = 0x107c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x107c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_crc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_apb_clk = {
+	.halt_reg = 0x1088,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_apb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x1098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
+	.halt_reg = 0x108c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x108c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_snoc_dvm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_aon_clk = {
+	.halt_reg = 0x1004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_aon_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x109c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x109c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gmu_clk = {
+	.halt_reg = 0x1064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gmu_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_vsense_clk = {
+	.halt_reg = 0x1058,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_vsense_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_sleep_clk = {
+	.halt_reg = 0x1090,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
+	.halt_reg = 0x5000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cx_gdsc = {
+	.gdscr = 0x106c,
+	.gds_hw_ctrl = 0x1540,
+	.pd = {
+		.name = "gpu_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc gpu_gx_gdsc = {
+	.gdscr = 0x100c,
+	.clamp_io_ctrl = 0x1508,
+	.pd = {
+		.name = "gpu_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
+};
+
+static struct clk_regmap *gpu_cc_sm7250_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_APB_CLK] = &gpu_cc_cx_apb_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
+	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
+	[GPU_CC_GX_VSENSE_CLK] = &gpu_cc_gx_vsense_clk.clkr,
+	[GPU_CC_PLL1] = &gpu_cc_pll1.clkr,
+	[GPU_CC_SLEEP_CLK] = &gpu_cc_sleep_clk.clkr,
+	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
+};
+
+static const struct qcom_reset_map gpu_cc_sm7250_resets[] = {
+	[GPUCC_GPU_CC_ACD_BCR] = { 0x1160 },
+	[GPUCC_GPU_CC_CX_BCR] = { 0x1068 },
+	[GPUCC_GPU_CC_GFX3D_AON_BCR] = { 0x10a0 },
+	[GPUCC_GPU_CC_GMU_BCR] = { 0x111c },
+	[GPUCC_GPU_CC_GX_BCR] = { 0x1008 },
+	[GPUCC_GPU_CC_XO_BCR] = { 0x1000 },
+};
+
+static struct gdsc *gpu_cc_sm7250_gdscs[] = {
+	[GPU_CX_GDSC] = &gpu_cx_gdsc,
+	[GPU_GX_GDSC] = &gpu_gx_gdsc,
+};
+
+static struct clk_alpha_pll *gpu_cc_sm7250_plls[] = {
+	&gpu_cc_pll1,
+};
+
+static const struct regmap_config gpu_cc_sm7250_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8008,
+	.fast_io = true,
+};
+
+static void gpu_cc_sm7250_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	unsigned int value, mask;
+
+	/*
+	 * Configure gpu_cc_cx_gmu_clk with recommended
+	 * wakeup/sleep settings
+	 */
+	mask = CX_GMU_CBCR_WAKE_MASK | CX_GMU_CBCR_SLEEP_MASK;
+	value = FIELD_PREP(CX_GMU_CBCR_WAKE_MASK, 0xf) |
+		FIELD_PREP(CX_GMU_CBCR_SLEEP_MASK, 0xf);
+	regmap_update_bits(regmap, 0x1098, mask, value);
+}
+
+static const struct qcom_cc_driver_data gpu_cc_sm7250_driver_data = {
+	.alpha_plls = gpu_cc_sm7250_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_sm7250_plls),
+	.clk_regs_configure = gpu_cc_sm7250_regs_configure,
+};
+
+static const struct qcom_cc_desc gpu_cc_sm7250_desc = {
+	.config = &gpu_cc_sm7250_regmap_config,
+	.clks = gpu_cc_sm7250_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_sm7250_clocks),
+	.resets = gpu_cc_sm7250_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_sm7250_resets),
+	.gdscs = gpu_cc_sm7250_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_sm7250_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_sm7250_driver_data,
+};
+
+static const struct of_device_id gpu_cc_sm7250_match_table[] = {
+	{ .compatible = "qcom,sm7250-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_sm7250_match_table);
+
+static int gpu_cc_sm7250_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_sm7250_desc);
+}
+
+static struct platform_driver gpu_cc_sm7250_driver = {
+	.probe = gpu_cc_sm7250_probe,
+	.driver = {
+		.name = "sm7250-gpucc",
+		.of_match_table = gpu_cc_sm7250_match_table,
+	},
+};
+module_platform_driver(gpu_cc_sm7250_driver);
+
+MODULE_DESCRIPTION("QTI GPU_CC SM7250 Driver");
+MODULE_LICENSE("GPL");

-- 
2.56.1


