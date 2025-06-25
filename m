Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B912E29AB02
	for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842765; cv=none; b=Vhe2PY3TGKq0zAaaBcMhLZoFngjx9J47YTImofCCkzHvG3Zb+2fgr8cbqFALzSB/Y8z/tyT4tcmhb8xYoByGydB1Skuo4nWh0gF3d/PMWYJst6RjhNGAX3a6vWOn9KhPKDCdwJwvi5VH1j6TAuPZ2/7IgeuMX9pY+1pQWRBnsbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842765; c=relaxed/simple;
	bh=Gs4t14y/wdv/QHP56VKfWdKmL18TwrzVaj4WDjNFYsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrUjG3HofsHIEbBq+YaxDnwFCCgK5/yBM85jKcgtquyn4ZZLnkKDw/jnyNIfSxbwe/7T0c4dMdmwV5DZXfIHycLJUazP0wMUocB7HBotaG8fG28U+jQss69R7VOV99HQrERQN4zueN9PLc7xfomzt9/MxbYB6fSTV0Lximj+MrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tFzlfwcz; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tFzlfwcz"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so11091550a12.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842757; x=1751447557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSOCWwLV9Wjjw58Bj3vnW4Ne/5S7dwsCDIoEh8Stj+Q=;
        b=tFzlfwcz+mD3J1lNbwN008WoE7MUiwWhWcAnOUPulS6Z79WJh5SEQqaZ4lInxMmhW9
         TL7vX/XWcn2rpLAy/k0Mw+MCHnHOVCRSXPw6ouXKYoO6P5ezZfy8uZEIGwxoV6UBlF87
         zM1IZ22uX95i5vmW3CImshE+ADxBLZ6NhleL+bMGVYO0/N0fVK5kL3ekmunWwL9DTIuX
         hENgLFk8KH0usd7N+0my/gsHScr8oCC50COgXG2NkUBzRRpL28eXuawSjrD1HTWQ6map
         M3ITP9FsO+L5Jl/FiaLX2Xbc9ZKk8J9Fe7JucF/WV8i0bp6odqca5903BZR9FCA8A4sc
         UXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842757; x=1751447557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSOCWwLV9Wjjw58Bj3vnW4Ne/5S7dwsCDIoEh8Stj+Q=;
        b=QxMwksor+BbcEblYASif4ajuK9P9mlxkC4DvzNbzYpR3BrlIjhNMYBKZuxO9rt9VN+
         VYEoYUs/u29SnOuwDBoUjjO9R5s0Ow9NOrXq2gBO2hE6kLu1sUXtZsDo+DQiit8+hUiq
         iGScTiUBS30GR/GgNKxDIK0YMFKmUH+KSAtySSFTEzJK2Qdc4b++ez7RPxCARrQU8ryd
         pMYu4/HUerr8ndc/6Bleu+dbnYKDBMJoK0czEUJIP7Gn2OLidAyrszT8pZHc812eBzpL
         sIYcnGrWX5cu9aEZUE4qUR+Wb5vcPactF9kTJTu/lm/O5pK+hmzhl+m9eeLP0lXqVBVa
         LwfA==
X-Forwarded-Encrypted: i=1; AJvYcCUuFF3b4AbG3erEaEp+15zcGD7Z2VlNrGFvLolIqtJ6/s1OHTpH3MbKATgLVWEKlXNSeQe/P1IeawU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXmTtJ6y6nImt41a/CJjimYl3G4KO1+I1t3I84+SjxVCoMO2mP
	ZhAk1E8rvvbRCOd4Der8MIRV8MNczB29RTPWg0XpK4w1r+6r8iBnhJE6em+7sZk7jJE=
X-Gm-Gg: ASbGncsFpdo5zY99Lhg6fJYKiUnBAKJCD8ZuGaNWKheUJnAgYN5hHNG3l4lFEssIB/q
	olL+dS5oBDS1zmAaQHM60N55iI8m7aJAqDMwQ1UT7yPc15ezET5y0d+JMFz7YGZy/Pvsu+XC7zD
	WxW5RxOZYagHJRdV//PH0G5ax9GTxXlBKta5vYawKyX3aU4bmzGqOipLZaPX7OHdogwfTHW+xS5
	yeiZQ5bOneO1CqxqoFaISGtAwPJauKl+B3sYTvPDck7A9/ITx5J5BBOwrdlRzjhsfmMoXff3DhF
	X8xLWlT3EAAhQZPe94H5GqefHHwLY/SU54NPtCkLK6tEVFlNwFpuAlgswDtEtKoteUeWv35Ir+P
	u9Uyg7GQkCmZshPK4OIUXyVhB8EXdxKtK
X-Google-Smtp-Source: AGHT+IEyg5y9Cs6BhJw1tchzZQW4Ac0ss21gTZqlz9ydFFDmi4L1LL4f/R1KKF+SBIonMKhgEQ3u+g==
X-Received: by 2002:a17:906:fa8b:b0:ad2:2ef3:d487 with SMTP id a640c23a62f3a-ae0beb75842mr188804966b.58.1750842756686;
        Wed, 25 Jun 2025 02:12:36 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm154937366b.129.2025.06.25.02.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:26 +0200
Subject: [PATCH 08/10] clk: qcom: Add Graphics Clock controller (GPUCC)
 driver for SM7635
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-v1-8-ca3120e3a80e@fairphone.com>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842748; l=17789;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Gs4t14y/wdv/QHP56VKfWdKmL18TwrzVaj4WDjNFYsQ=;
 b=4nCu1wYGqzUgG96hIEwEW+KBw4sdfDtRAO+UAbDRx72Jx8sywR1gn+OBU5kSyQjlk2MAvMomX
 yBFWRbQ69B6C9uRJwhCdfzd7313/HA9lOb5rQEOQnslwSpfz7ACEy9A
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the graphics clock controller found on SM7635 based
devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Kconfig        |   9 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/gpucc-sm7635.c | 563 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 573 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 6234c9e52987be963410ec6b6be693ab18ea3514..fc8c3e488a43dc50c8a3671da9ac6d32a28a4438 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1257,6 +1257,15 @@ config SM_GPUCC_6350
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config SM_GPUCC_7635
+	tristate "SM7635 Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_7635
+	help
+	  Support for the graphics clock controller on SM7635 devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config SM_GPUCC_8150
 	tristate "SM8150 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 4731367a57a7624b437908ae447dcf83a8555f87..59e165e8ec4436931652387cee10177336b7d8d6 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_SM_GPUCC_6115) += gpucc-sm6115.o
 obj-$(CONFIG_SM_GPUCC_6125) += gpucc-sm6125.o
 obj-$(CONFIG_SM_GPUCC_6350) += gpucc-sm6350.o
 obj-$(CONFIG_SM_GPUCC_6375) += gpucc-sm6375.o
+obj-$(CONFIG_SM_GPUCC_7635) += gpucc-sm7635.o
 obj-$(CONFIG_SM_GPUCC_8150) += gpucc-sm8150.o
 obj-$(CONFIG_SM_GPUCC_8250) += gpucc-sm8250.o
 obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
diff --git a/drivers/clk/qcom/gpucc-sm7635.c b/drivers/clk/qcom/gpucc-sm7635.c
new file mode 100644
index 0000000000000000000000000000000000000000..77ae41199613c09e8d417d8822057dfee19e822a
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-sm7635.c
@@ -0,0 +1,563 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm7635-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+/* Need to match the order of clocks in DT binding */
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
+	P_GPU_CC_PLL0_OUT_EVEN,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL0_OUT_ODD,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 700.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x24,
+	.alpha = 0x7555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpu_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpu_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_gpu_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpu_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL0_OUT_EVEN, 2 },
+	{ P_GPU_CC_PLL0_OUT_ODD, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0_out_even.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_ff_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_ff_clk_src = {
+	.cmd_rcgr = 0x9474,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_ff_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_ff_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(350000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(650000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(687500000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x9318,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_hub_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x93ec,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_hub_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gpu_cc_hub_div_clk_src = {
+	.reg = 0x942c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_hub_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x90bc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x90bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x910c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x910c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_ff_clk = {
+	.halt_reg = 0x90ec,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x90d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x90e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_dpm_clk = {
+	.halt_reg = 0x9110,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9110,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_dpm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_freq_measure_clk = {
+	.halt_reg = 0x900c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x900c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_freq_measure_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_accu_shift_clk = {
+	.halt_reg = 0x9070,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_acd_ahb_ff_clk = {
+	.halt_reg = 0x9068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_acd_ahb_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gmu_clk = {
+	.halt_reg = 0x9060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_rcg_ahb_ff_clk = {
+	.halt_reg = 0x906c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x906c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_rcg_ahb_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x93e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x93e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_cx_int_clk = {
+	.halt_reg = 0x90e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x90f4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x9080,
+	.gds_hw_ctrl = 0x9094,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x8,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct clk_regmap *gpu_cc_sm7635_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
+	[GPU_CC_CX_FF_CLK] = &gpu_cc_cx_ff_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_DPM_CLK] = &gpu_cc_dpm_clk.clkr,
+	[GPU_CC_FF_CLK_SRC] = &gpu_cc_ff_clk_src.clkr,
+	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr,
+	[GPU_CC_GX_ACD_AHB_FF_CLK] = &gpu_cc_gx_acd_ahb_ff_clk.clkr,
+	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
+	[GPU_CC_GX_RCG_AHB_FF_CLK] = &gpu_cc_gx_rcg_ahb_ff_clk.clkr,
+	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_HUB_DIV_CLK_SRC] = &gpu_cc_hub_div_clk_src.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL0_OUT_EVEN] = &gpu_cc_pll0_out_even.clkr,
+};
+
+static struct gdsc *gpu_cc_sm7635_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_sm7635_resets[] = {
+	[GPU_CC_CB_BCR] = { 0x93a0 },
+	[GPU_CC_CX_BCR] = { 0x907c },
+	[GPU_CC_FAST_HUB_BCR] = { 0x93e4 },
+	[GPU_CC_FF_BCR] = { 0x9470 },
+	[GPU_CC_GMU_BCR] = { 0x9314 },
+	[GPU_CC_GX_BCR] = { 0x905c },
+	[GPU_CC_RBCPR_BCR] = { 0x91e0 },
+	[GPU_CC_XO_BCR] = { 0x9000 },
+};
+
+static const struct regmap_config gpu_cc_sm7635_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x95e8,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc gpu_cc_sm7635_desc = {
+	.config = &gpu_cc_sm7635_regmap_config,
+	.clks = gpu_cc_sm7635_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_sm7635_clocks),
+	.resets = gpu_cc_sm7635_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_sm7635_resets),
+	.gdscs = gpu_cc_sm7635_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_sm7635_gdscs),
+};
+
+static const struct of_device_id gpu_cc_sm7635_match_table[] = {
+	{ .compatible = "qcom,sm7635-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_sm7635_match_table);
+
+static int gpu_cc_sm7635_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &gpu_cc_sm7635_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+
+	/* Keep some clocks always-on */
+	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x9008); /* GPU_CC_CXO_AON_CLK */
+	qcom_branch_set_clk_en(regmap, 0x9010); /* GPU_CC_DEMET_CLK */
+	qcom_branch_set_clk_en(regmap, 0x9064); /* GPU_CC_GX_AHB_FF_CLK */
+	qcom_branch_set_clk_en(regmap, 0x93a8); /* GPU_CC_RSCC_HUB_AON_CLK */
+	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_RSCC_XO_AON_CLK */
+	qcom_branch_set_clk_en(regmap, 0x90cc); /* GPU_CC_SLEEP_CLK */
+
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm7635_desc, regmap);
+}
+
+static struct platform_driver gpu_cc_sm7635_driver = {
+	.probe = gpu_cc_sm7635_probe,
+	.driver = {
+		.name = "gpu_cc-sm7635",
+		.of_match_table = gpu_cc_sm7635_match_table,
+	},
+};
+
+module_platform_driver(gpu_cc_sm7635_driver);
+
+MODULE_DESCRIPTION("QTI GPU_CC SM7635 Driver");
+MODULE_LICENSE("GPL");

-- 
2.50.0

