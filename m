Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0941412C0F;
	Fri,  2 Oct 2026 07:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927072; cv=none; b=JA3SmGGKbljLdklwBrlwGQfK+eg1VyQ/IySESSr5TI09xlGqcRqPM3iY9NgqjtB2tloFfX21WsOhP9jLCL2SYuWL8utV7Gf+yB/O8ModiUjd/PBdVgfHxm1vzM4d8Yfx1fMim0MfvSYIEU4Uhrg9KzbAaTclI98mWWrXcNkLD3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927072; c=relaxed/simple;
	bh=WbXgQwFwVdbOb0t3jcjc3zqWRmHiiLbos/UZQgohawg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aVImhzZwCn6Dz1XGP5SNsI8FWNH2ZLynFB/wZTaAqqT5njPzZokuhc7/jbtSlaMPnLGqlDoxZOy0fPMHNhNZm2bVRydXBrRTV02U9bWdCjS6eMmzmaec2UidBk5FvAMclyYXsdtGJqSl9g9SBrdTzYkHKBCO7RWmKf43v9jFtl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=p5jC4NA0; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="p5jC4NA0"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6927hncX73646822, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790927029; bh=oP06fDniIpzkVtuRfee/DejiSv4Ly3yjfmnB4oKGYRo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=p5jC4NA0zYoBTUpUnGc2QjxVWUMXonUjk4yTwfWTOY4NCcuMdGBjlOvi5E3BICFeA
	 4qvsVT1m2A2pulGbc6+pm1WnCBHGhJ5mXU7+HhlFzXpjyjCjy9YVzVdOJF4Z85VVf1
	 iFZ8euXuX+BZvoJSwKwVGsPT2m5JxgT/wdB6jmxsKUeIVcLXMyAKeoXk7VmIBgu0z1
	 rgCvK8dZAWkUwd81NF8rJya42xbZFPoit+9hFt85Lfpxc5FJxTUVdfuxJJE/ccDGG+
	 GbfKvHfpHbmIe6aXonICN1Pu4aB01edlUiNMmGYIbU4JEhrY/a3HQ41+ECP+t6AmAL
	 7OmSi7iQdRLdQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6927hncX73646822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Oct 2026 15:43:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:43:34 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 2 Oct 2026 15:43:34 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <jbrunet+clk@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney+clk@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>, Brian Masney <bmasney@redhat.com>
Subject: [PATCH v15 08/11] clk: realtek: Add support for MMC-tuned PLL clocks
Date: Fri, 2 Oct 2026 15:43:28 +0800
Message-ID: <20261002074331.3066919-9-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261002074331.3066919-1-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
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
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v15:
- None.
---
 drivers/clk/realtek/Kconfig       |   3 +
 drivers/clk/realtek/Makefile      |   2 +
 drivers/clk/realtek/clk-pll-mmc.c | 430 ++++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-pll.h     |  13 +
 4 files changed, 448 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-pll-mmc.c

diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
index e8deccf93f94..00ef9c5ba969 100644
--- a/drivers/clk/realtek/Kconfig
+++ b/drivers/clk/realtek/Kconfig
@@ -26,4 +26,7 @@ config RTK_CLK_COMMON
 	  infrastructure to spawn reset controllers via the auxiliary bus
 	  where required.
 
+config RTK_CLK_PLL_MMC
+	bool
+
 endif
diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 217ccaf5644a..52b9cb9c2323 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -6,3 +6,5 @@ clk-rtk-y += clk-pll.o
 clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += freq_table.o
+
+clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-pll-mmc.c
new file mode 100644
index 000000000000..2ee90b5d8a38
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
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include "clk-pll.h"
+
+#define RTK_PLL_EMMC1_OFFSET            0x0
+#define RTK_PLL_EMMC2_OFFSET            0x4
+#define RTK_PLL_EMMC3_OFFSET            0x8
+#define RTK_PLL_EMMC4_OFFSET            0xc
+#define RTK_PLL_SSC_DIG_EMMC1_OFFSET    0x0
+#define RTK_PLL_SSC_DIG_EMMC3_OFFSET    0xc
+#define RTK_PLL_SSC_DIG_EMMC4_OFFSET    0x10
+
+#define RTK_PLL_MMC_SSC_DIV_N_VAL       0x1b
+
+#define RTK_PLL_PHRT0_MASK              BIT(0)
+#define RTK_PLL_PHSEL_MASK              GENMASK(4, 0)
+#define RTK_PLL_SSCPLL_RS_MASK          GENMASK(12, 10)
+#define RTK_PLL_SSCPLL_ICP_MASK         GENMASK(9, 5)
+#define RTK_PLL_SSC_DIV_EXT_F_MASK      GENMASK(25, 13)
+#define RTK_PLL_PI_IBSELH_MASK          GENMASK(28, 27)
+#define RTK_PLL_SSC_DIV_N_MASK          GENMASK(23, 16)
+#define RTK_PLL_NCODE_SSC_EMMC_MASK     GENMASK(20, 13)
+#define RTK_PLL_FCODE_SSC_EMMC_MASK     GENMASK(12, 0)
+#define RTK_PLL_GRAN_EST_EM_MC_MASK     GENMASK(20, 0)
+#define RTK_PLL_EN_SSC_EMMC_MASK        BIT(0)
+#define RTK_PLL_FLAG_INITIAL_EMMC_MASK  BIT(8)
+
+#define RTK_PLL_PHRT0_SHIFT             1
+#define RTK_PLL_SSCPLL_RS_SHIFT         10
+#define RTK_PLL_SSCPLL_ICP_SHIFT        5
+#define RTK_PLL_SSC_DIV_EXT_F_SHIFT     13
+#define RTK_PLL_PI_IBSELH_SHIFT         27
+#define RTK_PLL_SSC_DIV_N_SHIFT         16
+#define RTK_PLL_NCODE_SSC_EMMC_SHIFT    13
+#define RTK_PLL_FLAG_INITIAL_EMMC_SHIFT 8
+
+#define CYCLE_DEGREES                   360
+#define PHASE_STEPS                     32
+#define PHASE_SCALE_FACTOR              1125
+
+static inline struct rtk_clk_regmap_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_regmap_pll_mmc, clkr);
+}
+
+static inline int get_phrt0(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
+{
+	u32 reg;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET, &reg);
+	if (ret)
+		return ret;
+
+	*val = (reg >> RTK_PLL_PHRT0_SHIFT) & RTK_PLL_PHRT0_MASK;
+
+	return 0;
+}
+
+static inline int set_phrt0(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET,
+				  RTK_PLL_PHRT0_MASK << RTK_PLL_PHRT0_SHIFT,
+				  val << RTK_PLL_PHRT0_SHIFT);
+}
+
+static inline int get_phsel(struct rtk_clk_regmap_pll_mmc *clkm, int id, u32 *val)
+{
+	u32 sft = id ? 8 : 3;
+	u32 raw_val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val >> sft) & RTK_PLL_PHSEL_MASK;
+
+	return 0;
+}
+
+static inline int set_phsel(struct rtk_clk_regmap_pll_mmc *clkm, int id, u32 val)
+{
+	u32 sft = id ? 8 : 3;
+
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET,
+				  RTK_PLL_PHSEL_MASK << sft, val << sft);
+}
+
+static inline int set_sscpll_rs(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
+				  RTK_PLL_SSCPLL_RS_MASK, val << RTK_PLL_SSCPLL_RS_SHIFT);
+}
+
+static inline int set_sscpll_icp(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
+				  RTK_PLL_SSCPLL_ICP_MASK, val << RTK_PLL_SSCPLL_ICP_SHIFT);
+}
+
+static inline int get_ssc_div_ext_f(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
+{
+	u32 raw_val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val & RTK_PLL_SSC_DIV_EXT_F_MASK) >> RTK_PLL_SSC_DIV_EXT_F_SHIFT;
+
+	return 0;
+}
+
+static inline int set_ssc_div_ext_f(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
+				  RTK_PLL_SSC_DIV_EXT_F_MASK,
+				  val << RTK_PLL_SSC_DIV_EXT_F_SHIFT);
+}
+
+static inline int set_pi_ibselh(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
+				  RTK_PLL_PI_IBSELH_MASK, val << RTK_PLL_PI_IBSELH_SHIFT);
+}
+
+static inline int set_ssc_div_n(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET,
+				  RTK_PLL_SSC_DIV_N_MASK, val << RTK_PLL_SSC_DIV_N_SHIFT);
+}
+
+static inline int get_ssc_div_n(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
+{
+	u32 raw_val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val & RTK_PLL_SSC_DIV_N_MASK) >> RTK_PLL_SSC_DIV_N_SHIFT;
+
+	return 0;
+}
+
+static inline int set_pow_ctl(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_write(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC4_OFFSET, val);
+}
+
+static inline int get_pow_ctl(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
+{
+	u32 raw_val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC4_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = raw_val;
+
+	return 0;
+}
+
+static int rtk_clk_regmap_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct clk_hw *hwp = clk_hw_get_parent(hw);
+	struct rtk_clk_regmap_pll_mmc *clkm;
+	int phase_id, ret;
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
+static int rtk_clk_regmap_pll_mmc_phase_get_phase(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm;
+	struct clk_hw *hwp;
+	int phase_id, ret;
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
+	.set_phase = rtk_clk_regmap_pll_mmc_phase_set_phase,
+	.get_phase = rtk_clk_regmap_pll_mmc_phase_get_phase,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_phase_ops, "CLK_REALTEK");
+
+static int rtk_clk_regmap_pll_mmc_prepare(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	return set_pow_ctl(clkm, 7);
+}
+
+static void rtk_clk_regmap_pll_mmc_unprepare(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	set_pow_ctl(clkm, 0);
+}
+
+static int rtk_clk_regmap_pll_mmc_is_prepared(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
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
+static int rtk_clk_regmap_pll_mmc_enable(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
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
+static void rtk_clk_regmap_pll_mmc_disable(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	set_phrt0(clkm, 0);
+	udelay(10);
+}
+
+static int rtk_clk_regmap_pll_mmc_is_enabled(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
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
+static unsigned long rtk_clk_regmap_pll_mmc_recalc_rate(struct clk_hw *hw,
+							unsigned long parent_rate)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
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
+static int rtk_clk_regmap_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	u32 val = RTK_PLL_MMC_SSC_DIV_N_VAL + 2;
+	u64 tmp;
+
+	if (!req->best_parent_rate)
+		return -EINVAL;
+
+	req->rate = req->best_parent_rate / 4 * val;
+	tmp = (u64)(req->best_parent_rate / 4) * 1517;
+	req->rate += tmp >> 13;
+
+	return 0;
+}
+
+static int rtk_clk_regmap_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate,
+					   unsigned long parent_rate)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val = RTK_PLL_MMC_SSC_DIV_N_VAL;
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
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
+				 RTK_PLL_FLAG_INITIAL_EMMC_MASK,
+				 0x0 << RTK_PLL_FLAG_INITIAL_EMMC_SHIFT);
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
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
+				 RTK_PLL_NCODE_SSC_EMMC_MASK,
+				 27 << RTK_PLL_NCODE_SSC_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
+				 RTK_PLL_FCODE_SSC_EMMC_MASK, 321);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC4_OFFSET,
+				 RTK_PLL_GRAN_EST_EM_MC_MASK, 5985);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
+				 RTK_PLL_EN_SSC_EMMC_MASK, 0x1);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
+				 RTK_PLL_EN_SSC_EMMC_MASK, 0x0);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
+				 RTK_PLL_FLAG_INITIAL_EMMC_MASK,
+				 0x1 << RTK_PLL_FLAG_INITIAL_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 20);
+
+	return 0;
+}
+
+const struct clk_ops rtk_clk_pll_mmc_ops = {
+	.prepare          = rtk_clk_regmap_pll_mmc_prepare,
+	.unprepare        = rtk_clk_regmap_pll_mmc_unprepare,
+	.is_prepared      = rtk_clk_regmap_pll_mmc_is_prepared,
+	.enable           = rtk_clk_regmap_pll_mmc_enable,
+	.disable          = rtk_clk_regmap_pll_mmc_disable,
+	.is_enabled       = rtk_clk_regmap_pll_mmc_is_enabled,
+	.recalc_rate      = rtk_clk_regmap_pll_mmc_recalc_rate,
+	.determine_rate   = rtk_clk_regmap_pll_mmc_determine_rate,
+	.set_rate         = rtk_clk_regmap_pll_mmc_set_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
index 023b49bbcbee..d21793387eee 100644
--- a/drivers/clk/realtek/clk-pll.h
+++ b/drivers/clk/realtek/clk-pll.h
@@ -44,4 +44,17 @@ struct rtk_clk_regmap_pll {
 extern const struct clk_ops rtk_clk_pll_ops;
 extern const struct clk_ops rtk_clk_pll_ro_ops;
 
+struct rtk_clk_regmap_pll_mmc {
+	struct rtk_clk_regmap clkr;
+	unsigned int pll_ofs;
+	unsigned int ssc_dig_ofs;
+	struct clk_hw phase0_hw;
+	struct clk_hw phase1_hw;
+};
+
+#define __rtk_clk_regmap_pll_mmc_hw(_ptr)  __rtk_clk_regmap_hw(&(_ptr)->clkr)
+
+extern const struct clk_ops rtk_clk_pll_mmc_ops;
+extern const struct clk_ops rtk_clk_pll_mmc_phase_ops;
+
 #endif /* __CLK_REALTEK_CLK_PLL_H */
-- 
2.43.0

