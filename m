Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0927E3AEF27;
	Wed, 24 Jun 2026 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782300648; cv=none; b=opuhumE7xvUVozk8DmCvtO4F418K10lDor1tMKNzLLgusKy3HegHN0QiD/xhwnLvpjLIyRwVonSwPdN0YyrsDuZ3VXmx/O5BUqWNUYKl1uSh4BNOscFuWQ7vWi9dxtybnFXqvFpGEOr0w97wdMnCGM0cxrB6JhEHoxGrypmsV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782300648; c=relaxed/simple;
	bh=YHj4ohuGu+wb3ALns7THOM3uUHDuVLkVHxZDIUQHxmc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aSrAsRi/AOPUK6VPAr5ihk7PU13RgK8ZoE3Khr5IggdgzdU/WuokW+c/SoFwaCTbZndEKsaFX4RABcK1Q9+k8o165PJIUn14ylzC83hEzjPxPGS5qZ9OqIQOIpnyD1FzVVp/KwuFASQLVp72j9/1ccv1wPrxmhC/+JnAqQ1Blvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=wJaTAAD/; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="wJaTAAD/"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65OBTl2bA4147265, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782300587; bh=K+RNL254pNJiCa3VycWh8LSvn74NbGMb+36KwKpl9sM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=wJaTAAD/xVcbvQXpFUBr2OYcQB7iBMCsy4+Zh2AJX1pYu6hJq9FjDbhes7C6u03ZK
	 +vYswvFhJQgndrD6JgYfblNVbKsajWD0KJJ4DyCJDQ8EoEwlBBnAc91MOLvgvXpglB
	 7A5Ew8egdeXKeX7Mh7b3yxbdSvYVWnnINNp3G6HGSp7oK8Ayu9giZGY0QaKu7xJ95l
	 XMBaMHs0TwS/4lha7apGKQ2yqQwZAMW+4/CaI4A0mktuOMyiIzIpbMYKFJ/pqYdcmy
	 1fsZBbYULc1d1Gw8UfmeqGw/dCKLmvBxZN1TksXu1ROR3NjkkCLoy6lcLddp0VWM18
	 j+0hZZhLWNTig==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65OBTl2bA4147265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jun 2026 19:29:47 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Jun 2026 19:29:47 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Jun 2026 19:29:47 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 24 Jun 2026 19:29:46 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v9 09/12] clk: realtek: Add support for MMC-tuned PLL clocks
Date: Wed, 24 Jun 2026 19:29:37 +0800
Message-ID: <20260624112940.3475605-10-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260624112940.3475605-1-eleanor.lin@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
operations on MMC PLL clocks.

Also add clk_pll_mmc_phase_ops to support phase get/set operations.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Jyan Chou <jyanchou@realtek.com>
Signed-off-by: Jyan Chou <jyanchou@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v9:
- Fix potential integer overflow on 32-bit architectures in
'clk_pll_mmc_determine_rate()' by casting to 'u64' and using
'DIV_ROUND_CLOSEST_ULL()'.

- Add comments in 'clk_pll_mmc_set_rate()' to clarify why 'rate' and
'parent_rate' are intentionally unused.

 MAINTAINERS                       |   8 +
 drivers/clk/realtek/Kconfig       |   3 +
 drivers/clk/realtek/Makefile      |   2 +
 drivers/clk/realtek/clk-pll-mmc.c | 430 ++++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-pll.h     |  13 +
 5 files changed, 456 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-pll-mmc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9cdcb333b68f..071110948cc8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22680,6 +22680,14 @@ F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 F:	include/dt-bindings/reset/realtek*
 
+REALTEK SOC PLL CLOCK FOR MMC SUPPORT
+M:	Cheng-Yu Lee <cylee12@realtek.com>
+M:	Jyan Chou <jyanchou@realtek.com>
+M:	Yu-Chun Lin <eleanor.lin@realtek.com>
+L:	linux-clk@vger.kernel.org
+S:	Supported
+F:	drivers/clk/realtek/clk-pll-mmc.c
+
 REALTEK SPI-NAND
 M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
 S:	Maintained
diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
index ed97531e321d..2ff780581ae0 100644
--- a/drivers/clk/realtek/Kconfig
+++ b/drivers/clk/realtek/Kconfig
@@ -27,4 +27,7 @@ config RTK_CLK_COMMON
 	  multiple Realtek clock implementations, and include integration
 	  with reset controllers where required.
 
+config RTK_CLK_PLL_MMC
+	bool
+
 endif
diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 3b014240a211..97447e92bc35 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -6,3 +6,5 @@ clk-rtk-y += clk-pll.o
 clk-rtk-y += freq_table.o
 clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += clk-regmap-mux.o
+
+clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-pll-mmc.c
new file mode 100644
index 000000000000..eefb0da04823
--- /dev/null
+++ b/drivers/clk/realtek/clk-pll-mmc.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/export.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include "clk-pll.h"
+
+#define PLL_MMC_VAL_MIN 1
+#define PLL_MMC_VAL_MAX 255
+
+#define PLL_EMMC1_OFFSET           0x0
+#define PLL_EMMC2_OFFSET           0x4
+#define PLL_EMMC3_OFFSET           0x8
+#define PLL_EMMC4_OFFSET           0xc
+#define PLL_SSC_DIG_EMMC1_OFFSET   0x0
+#define PLL_SSC_DIG_EMMC3_OFFSET   0xc
+#define PLL_SSC_DIG_EMMC4_OFFSET   0x10
+
+#define PLL_MMC_SSC_DIV_N_VAL      0x1b
+
+#define PLL_PHRT0_MASK             BIT(0)
+#define PLL_PHSEL_MASK             GENMASK(4, 0)
+#define PLL_SSCPLL_RS_MASK         GENMASK(12, 10)
+#define PLL_SSCPLL_ICP_MASK        GENMASK(9, 5)
+#define PLL_SSC_DIV_EXT_F_MASK     GENMASK(25, 13)
+#define PLL_PI_IBSELH_MASK         GENMASK(28, 27)
+#define PLL_SSC_DIV_N_MASK         GENMASK(23, 16)
+#define PLL_NCODE_SSC_EMMC_MASK    GENMASK(20, 13)
+#define PLL_FCODE_SSC_EMMC_MASK    GENMASK(12, 0)
+#define PLL_GRAN_EST_EM_MC_MASK    GENMASK(20, 0)
+#define PLL_EN_SSC_EMMC_MASK       BIT(0)
+#define PLL_FLAG_INITAL_EMMC_MASK  BIT(8)
+
+#define PLL_PHRT0_SHIFT            1
+#define PLL_SSCPLL_RS_SHIFT        10
+#define PLL_SSCPLL_ICP_SHIFT       5
+#define PLL_SSC_DIV_EXT_F_SHIFT    13
+#define PLL_PI_IBSELH_SHIFT        27
+#define PLL_SSC_DIV_N_SHIFT        16
+#define PLL_NCODE_SSC_EMMC_SHIFT   13
+#define PLL_FLAG_INITAL_EMMC_SHIFT 8
+
+#define CYCLE_DEGREES              360
+#define PHASE_STEPS                32
+#define PHASE_SCALE_FACTOR         1125
+
+static inline struct clk_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+
+	return container_of(clkr, struct clk_pll_mmc, clkr);
+}
+
+static inline int get_phrt0(struct clk_pll_mmc *clkm, u32 *val)
+{
+	u32 reg;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &reg);
+	if (ret)
+		return ret;
+
+	*val = (reg >> PLL_PHRT0_SHIFT) & PLL_PHRT0_MASK;
+
+	return 0;
+}
+
+static inline int set_phrt0(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
+				  PLL_PHRT0_MASK << PLL_PHRT0_SHIFT, val << PLL_PHRT0_SHIFT);
+}
+
+static inline int get_phsel(struct clk_pll_mmc *clkm, int id, u32 *val)
+{
+	u32 sft = id ? 8 : 3;
+	u32 raw_val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val >> sft) & PLL_PHSEL_MASK;
+
+	return 0;
+}
+
+static inline int set_phsel(struct clk_pll_mmc *clkm, int id, u32 val)
+{
+	u32 sft = id ? 8 : 3;
+
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
+				  PLL_PHSEL_MASK << sft, val << sft);
+}
+
+static inline int set_sscpll_rs(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_SSCPLL_RS_MASK, val << PLL_SSCPLL_RS_SHIFT);
+}
+
+static inline int set_sscpll_icp(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_SSCPLL_ICP_MASK, val << PLL_SSCPLL_ICP_SHIFT);
+}
+
+static inline int get_ssc_div_ext_f(struct clk_pll_mmc *clkm, u32 *val)
+{
+	u32 raw_val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val & PLL_SSC_DIV_EXT_F_MASK) >> PLL_SSC_DIV_EXT_F_SHIFT;
+
+	return 0;
+}
+
+static inline int set_ssc_div_ext_f(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_SSC_DIV_EXT_F_MASK,
+				  val << PLL_SSC_DIV_EXT_F_SHIFT);
+}
+
+static inline int set_pi_ibselh(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_PI_IBSELH_MASK, val << PLL_PI_IBSELH_SHIFT);
+}
+
+static inline int set_ssc_div_n(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC3_OFFSET,
+				  PLL_SSC_DIV_N_MASK, val << PLL_SSC_DIV_N_SHIFT);
+}
+
+static inline int get_ssc_div_n(struct clk_pll_mmc *clkm, u32 *val)
+{
+	int ret;
+	u32 raw_val;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC3_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val & PLL_SSC_DIV_N_MASK) >> PLL_SSC_DIV_N_SHIFT;
+
+	return 0;
+}
+
+static inline int set_pow_ctl(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_write(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC4_OFFSET, val);
+}
+
+static inline int get_pow_ctl(struct clk_pll_mmc *clkm, u32 *val)
+{
+	int ret;
+	u32 raw_val;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC4_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = raw_val;
+
+	return 0;
+}
+
+static int clk_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct clk_hw *hwp = clk_hw_get_parent(hw);
+	struct clk_pll_mmc *clkm;
+	int phase_id;
+	int ret;
+	u32 val;
+
+	if (!hwp)
+		return -ENOENT;
+
+	clkm = to_clk_pll_mmc(hwp);
+	phase_id = (hw == &clkm->phase0_hw) ? 0 : 1;
+	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
+	ret = set_phsel(clkm, phase_id, val);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 20);
+
+	return 0;
+}
+
+static int clk_pll_mmc_phase_get_phase(struct clk_hw *hw)
+{
+	struct clk_hw *hwp;
+	struct clk_pll_mmc *clkm;
+	int phase_id;
+	int ret;
+	u32 val;
+
+	hwp = clk_hw_get_parent(hw);
+	if (!hwp)
+		return -ENOENT;
+
+	clkm = to_clk_pll_mmc(hwp);
+	phase_id = (hw == &clkm->phase0_hw) ? 0 : 1;
+	ret = get_phsel(clkm, phase_id, &val);
+	if (ret)
+		return ret;
+
+	val = DIV_ROUND_CLOSEST(val * CYCLE_DEGREES, PHASE_STEPS);
+
+	return val;
+}
+
+const struct clk_ops rtk_clk_pll_mmc_phase_ops = {
+	.set_phase = clk_pll_mmc_phase_set_phase,
+	.get_phase = clk_pll_mmc_phase_get_phase,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_phase_ops, "REALTEK_CLK");
+
+static int clk_pll_mmc_prepare(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	return set_pow_ctl(clkm, 7);
+}
+
+static void clk_pll_mmc_unprepare(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	set_pow_ctl(clkm, 0);
+}
+
+static int clk_pll_mmc_is_prepared(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val;
+	int ret;
+
+	ret = get_pow_ctl(clkm, &val);
+	if (ret)
+		return 1;
+
+	return val != 0x0;
+}
+
+static int clk_pll_mmc_enable(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	int ret;
+
+	ret = set_phrt0(clkm, 1);
+	if (ret)
+		return ret;
+
+	udelay(10);
+
+	return 0;
+}
+
+static void clk_pll_mmc_disable(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	set_phrt0(clkm, 0);
+	udelay(10);
+}
+
+static int clk_pll_mmc_is_enabled(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val;
+	int ret;
+
+	ret = get_phrt0(clkm, &val);
+	if (ret)
+		return 1;
+
+	return val == 0x1;
+}
+
+static unsigned long clk_pll_mmc_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val, ext_f;
+	u64 rate, base;
+	int ret;
+
+	ret = get_ssc_div_n(clkm, &val);
+	if (ret)
+		return 0;
+
+	ret = get_ssc_div_ext_f(clkm, &ext_f);
+	if (ret)
+		return 0;
+
+	base = parent_rate / 4;
+	rate = base * (val + 2);
+	rate += div_u64(base * ext_f, 8192);
+
+	return rate;
+}
+
+static int clk_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	u32 val;
+
+	if (!req->best_parent_rate)
+		return -EINVAL;
+
+	val = DIV_ROUND_CLOSEST_ULL((u64)req->rate * 4, req->best_parent_rate);
+	val = clamp_t(u32, val, PLL_MMC_VAL_MIN, PLL_MMC_VAL_MAX);
+	req->rate = req->best_parent_rate * val / 4;
+
+	return 0;
+}
+
+static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val = PLL_MMC_SSC_DIV_N_VAL;
+	int ret;
+
+	/*
+	 * The 'rate' and 'parent_rate' are intentionally unused here.
+	 *
+	 * Despite receiving various rate requests (e.g., 26MHz, 52MHz, 200MHz),
+	 * this function consistently configures the hardware for 27MHz (0x1b).
+	 * This is because these settings reflect the input reference clock
+	 * frequency to the SSCPLL, not the final PLL output frequency.
+	 *
+	 * The actual frequency division to achieve the requested eMMC rate
+	 * is handled internally by the downstream eMMC host controller.
+	 */
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_FLAG_INITAL_EMMC_MASK, 0x0 << PLL_FLAG_INITAL_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = set_ssc_div_n(clkm, val);
+	if (ret)
+		return ret;
+
+	ret = set_ssc_div_ext_f(clkm, 1517);
+	if (ret)
+		return ret;
+
+	ret = set_pi_ibselh(clkm, 2);
+	if (ret)
+		return ret;
+
+	ret = set_sscpll_rs(clkm, 3);
+	if (ret)
+		return ret;
+
+	ret = set_sscpll_icp(clkm, 1);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
+				 PLL_NCODE_SSC_EMMC_MASK,
+				 27 << PLL_NCODE_SSC_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
+				 PLL_FCODE_SSC_EMMC_MASK, 321);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC4_OFFSET,
+				 PLL_GRAN_EST_EM_MC_MASK, 5985);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_EN_SSC_EMMC_MASK, 0x1);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_EN_SSC_EMMC_MASK, 0x0);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_FLAG_INITAL_EMMC_MASK,
+				 0x1 << PLL_FLAG_INITAL_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 20);
+
+	return 0;
+}
+
+const struct clk_ops rtk_clk_pll_mmc_ops = {
+	.prepare          = clk_pll_mmc_prepare,
+	.unprepare        = clk_pll_mmc_unprepare,
+	.is_prepared      = clk_pll_mmc_is_prepared,
+	.enable           = clk_pll_mmc_enable,
+	.disable          = clk_pll_mmc_disable,
+	.is_enabled       = clk_pll_mmc_is_enabled,
+	.recalc_rate      = clk_pll_mmc_recalc_rate,
+	.determine_rate   = clk_pll_mmc_determine_rate,
+	.set_rate         = clk_pll_mmc_set_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_ops, "REALTEK_CLK");
diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
index b70d6b3ec61e..ecc51898ae2d 100644
--- a/drivers/clk/realtek/clk-pll.h
+++ b/drivers/clk/realtek/clk-pll.h
@@ -44,4 +44,17 @@ struct clk_pll {
 extern const struct clk_ops rtk_clk_pll_ops;
 extern const struct clk_ops rtk_clk_pll_ro_ops;
 
+struct clk_pll_mmc {
+	struct clk_regmap clkr;
+	unsigned int pll_ofs;
+	unsigned int ssc_dig_ofs;
+	struct clk_hw phase0_hw;
+	struct clk_hw phase1_hw;
+};
+
+#define __clk_pll_mmc_hw(_ptr)  __clk_regmap_hw(&(_ptr)->clkr)
+
+extern const struct clk_ops rtk_clk_pll_mmc_ops;
+extern const struct clk_ops rtk_clk_pll_mmc_phase_ops;
+
 #endif /* __CLK_REALTEK_CLK_PLL_H */
-- 
2.43.0

