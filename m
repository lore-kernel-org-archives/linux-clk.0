Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487827;
	b=pTtUv4qJfi8cTIrv/2xslEKwomr4eDAzFD5vo141r4GmA9ACuphNbZ9dgvmTz4mutWUl
	 LLR5Y51xoLLs7ZS04SZxoBzylx74qpPzDZIJtLnbPeZJGP4Sszj7XkilMtwYGU2eyUbyN
	 YCE1+QvOYeNdXRnxhfvR52Ijlnps5aH0d4J8unyVdyQljvs7XwEhQvKQKeS5zG4K5lZNk
	 Nt2Bg2AoXJstMhypch4IJNXLmbHcjC4KJjGXDikJvkArH9EQwV7zH6CTFvdNRdLePVwnx
	 LsNHKJpZ45Z9eK1lVrmWhXx9iUpgoPlRot5sLzKZlugbcwsp/3QWF7ott+JCZc4IzMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487827;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=FVN1EWFVtFkjBSBfPmaVzfIvbPHQSJp5Zzaj3Zafdws=;
	b=qrdSze/HhwueYmEmv4xLlbB2EtitH5UOeUSjwg3pbR53emIHYn/G6MMBU4bKVUMv9D0b
	 p4cLqGfNJbQCYsr+8kyh4LWE+0DyUDvs8fbMjIP5fJnq3k8GHNGgLxNmUZ5yGw2UPOH5x
	 4RW5sP3ymGDUo4ENshTqgcZWmGa5fnVUMFIHKZEKPvuH44ydt6uTGrC3FXO0Ls8xFZMWH
	 JWxv1plJfXwcsWhy01QC5Xqwv+MjTZc3s3UX3LbSatInSxeEgvz2OTOi0WOmbHnW+Dtx7
	 c1krfbM1yrbfCpiAPwyMqsyTmYjOSujM6N2Y3VQ2mwBli5j7I2qN6HJNLsRI2W+2Dpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ZAEWRPj7;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5B8606A322;
	Tue, 24 Nov 2026 02:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5B8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ZAEWRPj7
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2Zx3I22160557, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487760; bh=FVN1EWFVtFkjBSBfPmaVzfIvbPHQSJp5Zzaj3Zafdws=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=ZAEWRPj7h4lHRi5939ldAhaX0Tw+BWloY5xetXE1QM6HByWdGVI47cCyProGEgWe1
	 Uf6DyK1TsW2JbhMciEuFn7tePPBrtJYf89benqrU+9rSOye2YONwj7M6NlEQyeQI6B
	 +y6bzOAgwaF5bghkAuzqIey0gF+LHGWG33Ey6aQmOOezsm53w6s+6rftdADIQqFoWp
	 fQ7OrGF8qyMgLoTOxXKGUeddzfvP+3e6ilTjQTP5xsZZ561cmiyuS+SNc17pHmXTcT
	 0ArwN0FTNTgWI9X/xHE4J6bsHqjWTJ7ijQTlBNm4/FdcKm+OqhqyC7W4Px6KLBzFq6
	 maojIwB8LDPSA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2Zx3I22160557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 10:35:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:59 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 10:35:59 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v17 6/9] clk: realtek: Add support for MMC-tuned PLL clocks
Date: Tue, 24 Nov 2026 10:35:54 +0800
Message-ID: <20261124023558.4088635-7-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124023558.4088635-1-eleanor.lin@realtek.com>
References: <20261124023558.4088635-1-eleanor.lin@realtek.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Add clk_pll_mmc_ops for enable/disable, rate control, and status operations
on MMC PLL clocks.

Also add clk_pll_mmc_phase_ops to support phase get/set operations.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Jyan Chou <jyanchou@realtek.com>
Signed-off-by: Jyan Chou <jyanchou@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v17:
- Reuse the 'ftbl_find_closest_by_rate()' macro and drop the local duplicate.
- Make 'rate_tbl' optional and add a built-in default table covering both
operating points of this PLL: the eMMC and the SPI-NAND controllers are
clocked by the same PLL instance on this SoC, 196,999,969 Hz with SSC enabled
for eMMC and 99,999,206 Hz with SSC disabled for SPI-NAND.
- Add an 'ssc' flag to 'struct rtk_clk_pll_mmc_rate', so that the SSC analog
registers are left untouched in SPI-NAND mode.
- Replace 'shift' with 'phsel_mask' in 'struct rtk_clk_pll_mmc_phase', and use
'field_prep()'/'field_get()'.
- '.recalc_rate()' always computes the rate from the dividers instead of
reverse-matching the rate table.
---
 drivers/clk/realtek/Kconfig              |   3 +
 drivers/clk/realtek/Makefile             |   2 +
 drivers/clk/realtek/clk-regmap-pll-mmc.c | 443 +++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-pll-mmc.h |  69 ++++
 drivers/clk/realtek/freq_table.c         |   1 +
 5 files changed, 518 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-pll-mmc.c
 create mode 100644 drivers/clk/realtek/clk-regmap-pll-mmc.h

diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
index fc16fd71c50b..f3197031f753 100644
--- a/drivers/clk/realtek/Kconfig
+++ b/drivers/clk/realtek/Kconfig
@@ -19,4 +19,7 @@ config RTK_CLK_COMMON
 	select AUXILIARY_BUS
 	select REGMAP_MMIO
 
+config RTK_CLK_PLL_MMC
+	bool
+
 endif
diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 4be39e2dd5b4..5fefe9bf901f 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -6,3 +6,5 @@ clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += clk-regmap-pll.o
 clk-rtk-y += freq_table.o
+
+clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-regmap-pll-mmc.o
diff --git a/drivers/clk/realtek/clk-regmap-pll-mmc.c b/drivers/clk/realtek/clk-regmap-pll-mmc.c
new file mode 100644
index 000000000000..91f9982be972
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-pll-mmc.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/math64.h>
+#include <linux/regmap.h>
+#include "clk-regmap-pll-mmc.h"
+#include "freq_table.h"
+
+#define RTK_PLL_EMMC1_OFFSET            0x0
+#define RTK_PLL_EMMC2_OFFSET            0x4
+#define RTK_PLL_EMMC3_OFFSET            0x8
+#define RTK_PLL_EMMC4_OFFSET            0xc
+#define RTK_PLL_SSC_DIG_EMMC0_OFFSET    0x0
+#define RTK_PLL_SSC_DIG_EMMC3_OFFSET    0xc
+#define RTK_PLL_SSC_DIG_EMMC4_OFFSET    0x10
+
+#define RTK_PLL_EMMC1_PHRT0		BIT(1)
+#define RTK_PLL_SSCPLL_RS_MASK          GENMASK(12, 10)
+#define RTK_PLL_SSCPLL_ICP_MASK         GENMASK(9, 5)
+#define RTK_PLL_SSC_DIV_EXT_F_MASK      GENMASK(25, 13)
+#define RTK_PLL_PI_IBSELH_MASK          GENMASK(28, 27)
+#define RTK_PLL_SSC_DIV_N_MASK          GENMASK(23, 16)
+#define RTK_PLL_NCODE_SSC_EMMC_MASK     GENMASK(20, 13)
+#define RTK_PLL_FCODE_SSC_EMMC_MASK     GENMASK(12, 0)
+#define RTK_PLL_GRAN_EST_EM_MC_MASK     GENMASK(20, 0)
+#define RTK_PLL_SSC_DIG_EMMC0_OC_EN     BIT(0)
+#define RTK_PLL_SSC_DIG_EMMC0_EN_SSC    BIT(1)
+#define RTK_PLL_FLAG_INITIAL_EMMC_MASK  BIT(8)
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
+static inline struct rtk_clk_pll_mmc_phase *to_clk_pll_mmc_phase(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_pll_mmc_phase, clkr);
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
+	*val = FIELD_GET(RTK_PLL_EMMC1_PHRT0, reg);
+
+	return 0;
+}
+
+static inline int set_phrt0(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET,
+				  RTK_PLL_EMMC1_PHRT0, FIELD_PREP(RTK_PLL_EMMC1_PHRT0, val));
+}
+
+static inline int clk_pll_emmc_set_sscpll_rs(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
+				  RTK_PLL_SSCPLL_RS_MASK, FIELD_PREP(RTK_PLL_SSCPLL_RS_MASK, val));
+}
+
+static inline int clk_pll_emmc_set_sscpll_icp(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap,
+				  clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
+				  RTK_PLL_SSCPLL_ICP_MASK,
+				  FIELD_PREP(RTK_PLL_SSCPLL_ICP_MASK, val));
+}
+
+static inline int clk_pll_emmc_set_ssc_div_ext_f(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
+				  RTK_PLL_SSC_DIV_EXT_F_MASK,
+				  FIELD_PREP(RTK_PLL_SSC_DIV_EXT_F_MASK, val));
+}
+
+static inline int clk_pll_emmc_set_pi_ibselh(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
+				  RTK_PLL_PI_IBSELH_MASK, FIELD_PREP(RTK_PLL_PI_IBSELH_MASK, val));
+}
+
+static inline int clk_pll_emmc_set_ssc_div_n(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET,
+				  RTK_PLL_SSC_DIV_N_MASK, FIELD_PREP(RTK_PLL_SSC_DIV_N_MASK, val));
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
+static inline int clk_pll_emmc_set_phsel(struct rtk_clk_pll_mmc_phase *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_mmc->pll_ofs + RTK_PLL_EMMC1_OFFSET,
+				  clkm->phsel_mask, field_prep(clkm->phsel_mask, val));
+}
+
+static inline int clk_pll_emmc_get_phsel(struct rtk_clk_pll_mmc_phase *clkm, u32 *val)
+{
+	unsigned int raw_val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_mmc->pll_ofs + RTK_PLL_EMMC1_OFFSET,
+			  &raw_val);
+	if (ret)
+		return ret;
+
+	*val = field_get(clkm->phsel_mask, raw_val);
+
+	return 0;
+}
+
+static int rtk_clk_regmap_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct rtk_clk_pll_mmc_phase *clkm = to_clk_pll_mmc_phase(hw);
+	int ret;
+	u32 val;
+
+	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
+
+	ret = clk_pll_emmc_set_phsel(clkm, val);
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
+	struct rtk_clk_pll_mmc_phase *clkm = to_clk_pll_mmc_phase(hw);
+	int ret;
+	u32 val;
+
+	ret = clk_pll_emmc_get_phsel(clkm, &val);
+	if (ret)
+		return ret;
+
+	return DIV_ROUND_CLOSEST(val * CYCLE_DEGREES, PHASE_STEPS);
+}
+
+const struct clk_ops rtk_clk_pll_mmc_phase_ops = {
+	.set_phase = rtk_clk_regmap_pll_mmc_phase_set_phase,
+	.get_phase = rtk_clk_regmap_pll_mmc_phase_get_phase,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_phase_ops, "CLK_REALTEK");
+
+/*
+ * Default operating points of the eMMC PLL, used by SoCs that do not provide
+ * their own table. The same PLL serves two modes: 196,999,969 Hz with SSC
+ * enabled for eMMC, and 99,999,206 Hz with SSC disabled for SPI-NAND.
+ */
+static const struct rtk_clk_pll_mmc_rate rtk_clk_pll_mmc_default_rate_tbl[] = {
+	{ .rate = 99999206,  .ssc_div_n = 12, .ssc_div_ext_f = 6674 },
+	{ .rate = 196999969, .ssc_div_n = 27, .ssc_div_ext_f = 1517,
+	  .ncode = 27, .fcode = 321, .gran_est = 5985, .ssc = 1 },
+	FREQ_TABLE_END,
+};
+
+static const struct rtk_clk_pll_mmc_rate *
+rtk_clk_regmap_pll_mmc_get_rate_tbl(const struct rtk_clk_regmap_pll_mmc *clkm)
+{
+	if (clkm->rate_tbl)
+		return clkm->rate_tbl;
+
+	return rtk_clk_pll_mmc_default_rate_tbl;
+}
+
+static const struct rtk_clk_pll_mmc_rate *
+rtk_clk_regmap_pll_mmc_find_rate(const struct rtk_clk_regmap_pll_mmc *clkm, unsigned long rate)
+{
+	const struct rtk_clk_pll_mmc_rate *entry;
+
+	for (entry = rtk_clk_regmap_pll_mmc_get_rate_tbl(clkm); entry->rate; entry++)
+		if (entry->rate == rate)
+			return entry;
+
+	return NULL;
+}
+
+static int rtk_clk_regmap_pll_mmc_enable(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	int ret;
+
+	ret = set_pow_ctl(clkm, 7);
+	if (ret)
+		return ret;
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
+	set_pow_ctl(clkm, 0);
+}
+
+static int rtk_clk_regmap_pll_mmc_is_enabled(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 pow_val, phrt_val;
+	int ret;
+
+	ret = get_pow_ctl(clkm, &pow_val);
+	if (ret)
+		return 1;
+
+	ret = get_phrt0(clkm, &phrt_val);
+	if (ret)
+		return 1;
+
+	return (pow_val != 0x0) && (phrt_val == 0x1);
+}
+
+static unsigned long clk_pll_mmc_calc_rate(unsigned long parent_rate,
+					   u32 div_n, u32 div_ext_f)
+{
+	u64 rate = (u64)parent_rate * (div_n + 2);
+
+	rate += (u64)parent_rate * div_ext_f / 8192;
+
+	return div64_u64(rate, 4);
+}
+
+static unsigned long rtk_clk_regmap_pll_mmc_recalc_rate(struct clk_hw *hw,
+							unsigned long parent_rate)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 emmc2, emmc3, val, ext_f;
+
+	if (regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET, &emmc2))
+		return 0;
+
+	if (regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET, &emmc3))
+		return 0;
+
+	val = FIELD_GET(RTK_PLL_SSC_DIV_N_MASK, emmc3);
+	ext_f = FIELD_GET(RTK_PLL_SSC_DIV_EXT_F_MASK, emmc2);
+
+	return clk_pll_mmc_calc_rate(parent_rate, val, ext_f);
+}
+
+static int rtk_clk_regmap_pll_mmc_determine_rate(struct clk_hw *hw,
+						 struct clk_rate_request *req)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	const struct rtk_clk_pll_mmc_rate *entry;
+
+	entry = ftbl_find_closest_by_rate(rtk_clk_regmap_pll_mmc_get_rate_tbl(clkm),
+					  req->rate, req->min_rate, req->max_rate);
+	if (!entry)
+		return -EINVAL;
+
+	req->rate = entry->rate;
+
+	return 0;
+}
+
+static const struct rtk_clk_pll_mmc_div_cfg clk_pll_emmc_default_div_cfg[] = {
+	{ 31, 46, 3, 3, 2 },
+	{ 20, 30, 2, 3, 1 },
+	{ 10, 19, 1, 2, 1 },
+	{  5,  9, 0, 2, 0 },
+};
+
+static const struct rtk_clk_pll_mmc_div_cfg *
+clk_pll_emmc_find_div_cfg(struct rtk_clk_regmap_pll_mmc *clkm, u32 div)
+{
+	const struct rtk_clk_pll_mmc_div_cfg *tbl = clkm->div_cfg;
+	u32 num = clkm->num_div_cfg;
+
+	if (!tbl) {
+		tbl = clk_pll_emmc_default_div_cfg;
+		num = ARRAY_SIZE(clk_pll_emmc_default_div_cfg);
+	}
+
+	for (unsigned int i = 0; i < num; i++) {
+		if (div >= tbl[i].div_min && div <= tbl[i].div_max)
+			return &tbl[i];
+	}
+
+	return NULL;
+}
+
+static int clk_pll_emmc_program_div_cfg(struct rtk_clk_regmap_pll_mmc *clkm, u32 div)
+{
+	const struct rtk_clk_pll_mmc_div_cfg *t = clk_pll_emmc_find_div_cfg(clkm, div);
+	int ret;
+
+	if (!t)
+		return -EINVAL;
+
+	ret = clk_pll_emmc_set_pi_ibselh(clkm, t->ibselh);
+	if (ret)
+		return ret;
+
+	ret = clk_pll_emmc_set_sscpll_rs(clkm, t->rs);
+	if (ret)
+		return ret;
+
+	return clk_pll_emmc_set_sscpll_icp(clkm, t->icp);
+}
+
+static int rtk_clk_regmap_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate,
+					   unsigned long parent_rate)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	const struct rtk_clk_pll_mmc_rate *entry = rtk_clk_regmap_pll_mmc_find_rate(clkm, rate);
+	int ret;
+
+	if (!entry)
+		return -EINVAL;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
+				 RTK_PLL_FLAG_INITIAL_EMMC_MASK,
+				 FIELD_PREP(RTK_PLL_FLAG_INITIAL_EMMC_MASK, 0));
+	if (ret)
+		return ret;
+
+	ret = clk_pll_emmc_set_ssc_div_n(clkm, entry->ssc_div_n);
+	if (ret)
+		return ret;
+
+	ret = clk_pll_emmc_set_ssc_div_ext_f(clkm, entry->ssc_div_ext_f);
+	if (ret)
+		return ret;
+
+	ret = clk_pll_emmc_program_div_cfg(clkm, entry->ssc_div_n);
+	if (ret)
+		return ret;
+
+	if (entry->ssc) {
+		ret = regmap_update_bits(clkm->clkr.regmap,
+					 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
+					 RTK_PLL_NCODE_SSC_EMMC_MASK,
+					 FIELD_PREP(RTK_PLL_NCODE_SSC_EMMC_MASK, entry->ncode));
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(clkm->clkr.regmap,
+					 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
+					 RTK_PLL_FCODE_SSC_EMMC_MASK,
+					 FIELD_PREP(RTK_PLL_FCODE_SSC_EMMC_MASK, entry->fcode));
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(clkm->clkr.regmap,
+					 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC4_OFFSET,
+					 RTK_PLL_GRAN_EST_EM_MC_MASK,
+					 FIELD_PREP(RTK_PLL_GRAN_EST_EM_MC_MASK, entry->gran_est));
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
+				 RTK_PLL_SSC_DIG_EMMC0_EN_SSC,
+				 FIELD_PREP(RTK_PLL_SSC_DIG_EMMC0_EN_SSC, entry->ssc));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
+				 RTK_PLL_SSC_DIG_EMMC0_OC_EN,
+				 FIELD_PREP(RTK_PLL_SSC_DIG_EMMC0_OC_EN, 1));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
+				 RTK_PLL_SSC_DIG_EMMC0_OC_EN,
+				 FIELD_PREP(RTK_PLL_SSC_DIG_EMMC0_OC_EN, 0));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
+				 RTK_PLL_FLAG_INITIAL_EMMC_MASK,
+				 FIELD_PREP(RTK_PLL_FLAG_INITIAL_EMMC_MASK, 1));
+	if (ret)
+		return ret;
+
+	usleep_range(10, 20);
+
+	return 0;
+}
+
+const struct clk_ops rtk_clk_pll_mmc_ops = {
+	.enable           = rtk_clk_regmap_pll_mmc_enable,
+	.disable          = rtk_clk_regmap_pll_mmc_disable,
+	.is_enabled       = rtk_clk_regmap_pll_mmc_is_enabled,
+	.recalc_rate      = rtk_clk_regmap_pll_mmc_recalc_rate,
+	.determine_rate   = rtk_clk_regmap_pll_mmc_determine_rate,
+	.set_rate         = rtk_clk_regmap_pll_mmc_set_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-regmap-pll-mmc.h b/drivers/clk/realtek/clk-regmap-pll-mmc.h
new file mode 100644
index 000000000000..53badf89d5d0
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-pll-mmc.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Realtek Semiconductor Corporation
+ */
+
+#ifndef __CLK_REALTEK_CLK_PLL_MMC_H
+#define __CLK_REALTEK_CLK_PLL_MMC_H
+
+#include "clk-rtk-common.h"
+
+/* SSCPLL charge-pump settings per divider range */
+struct rtk_clk_pll_mmc_div_cfg {
+	u16 div_min;
+	u16 div_max;
+	u8 ibselh;
+	u8 rs;
+	u8 icp;
+};
+
+/* Register settings for a specific eMMC PLL rate */
+struct rtk_clk_pll_mmc_rate {
+	unsigned long rate;
+	u32 ssc_div_n;
+	u32 ssc_div_ext_f;
+	u32 ncode;
+	u32 fcode;
+	u32 gran_est;
+
+	/*
+	 * Enable SSC and program its modulation parameters. When clear,
+	 * set_rate() leaves NCODE/FCODE/GRAN_EST unchanged and disables SSC.
+	 */
+	u32 ssc: 1;
+};
+
+struct rtk_clk_regmap_pll_mmc {
+	struct rtk_clk_regmap clkr;
+	unsigned int pll_ofs;
+	unsigned int ssc_dig_ofs;
+
+	/*
+	 * Optional per-SoC tuning table. When NULL, the driver's default table
+	 * is used and num_div_cfg is ignored.
+	 */
+	const struct rtk_clk_pll_mmc_div_cfg *div_cfg;
+	u32 num_div_cfg;
+
+	/*
+	 * Optional per-SoC operating points. When NULL, the driver's default
+	 * table is used. A table is terminated by an entry with .rate == 0.
+	 */
+	const struct rtk_clk_pll_mmc_rate *rate_tbl;
+};
+
+#define __rtk_clk_regmap_pll_mmc_hw(_ptr)  __rtk_clk_regmap_hw(&(_ptr)->clkr)
+
+extern const struct clk_ops rtk_clk_pll_mmc_ops;
+
+struct rtk_clk_pll_mmc_phase {
+	struct rtk_clk_regmap clkr;
+	struct rtk_clk_regmap_pll_mmc *pll_mmc;
+	u32 phsel_mask;
+};
+
+#define __rtk_clk_regmap_pll_mmc_phase_hw(_ptr) __rtk_clk_regmap_hw(&(_ptr)->clkr)
+
+extern const struct clk_ops rtk_clk_pll_mmc_phase_ops;
+
+#endif /* __CLK_REALTEK_CLK_PLL_MMC_H */
diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_table.c
index 3446657a437b..bf3d46df20c8 100644
--- a/drivers/clk/realtek/freq_table.c
+++ b/drivers/clk/realtek/freq_table.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/limits.h>
 #include <linux/types.h>
 #include "freq_table.h"
 
-- 
2.43.0

