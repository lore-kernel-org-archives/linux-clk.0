Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461198;
	b=vpkUDObEc/FUNueQcic8J05NL02gpu+ak/kszvFVUNY5O4a1fEDdZeaWWAHva554qmKM
	 U9egTo0aKwePye85ZQKzinwNks1EriGMnMi5LBTNznuHSQWc1XC7FdMYBAJwh4hjxmUu2
	 bE89MgJTjpYZDcmqrre9AX8Jg+f8obmpbepLVEzTf3c6gUm1ejva+dJg0wCmDWtYHtVi1
	 Y6BeXndeYkFKo+na3I0ujh4lsuh5bptDx9aZXqOJjdByFwiEkmOQbDBGl9Zaq2wW2/8vl
	 IqggFvvxR5Ut3Ngh55DTfJL3+3HzgGB/hiwYeWQ4Mt7MvG/4u3m6dsGtktKufCjCLdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461198;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=d6Vmz2yO8JeCHPhwWe9fXInHv17oitJtHUvnGtbPBpI=;
	b=D3E76lhyIbqK6MYonP7aZ8I6kDqjMQimMVxltoMJ0rA7tQwigz36QVhHzcPe89FoqqDM
	 bxrCPD2k9SL8zomr3zmoJg30h2KRYKrdEP/1ImB+6G/fU/9rqGWqYYTuxTQIHUjgjy2VC
	 sKfW2HK02ykSlusIk+rCcxvD7NRtRlHD0YA0++wtGdhmtKGINzb0zxkPDhIHFs2ixzCTZ
	 W0lFrf26B5RY5ckDxVXxnw32qRoHfZvtFCFSD1/lR5FOpVlIx1SaEruoj0gP0hcsjq1T9
	 UFGEvj3+E7ZN3NgxA2DlMfvkCHGRzreQU9c0W1o3CGuAKSCYomI76vmj/G1OhXPFJEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lqmIS5Fx;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F380606A8A5;
	Thu, 12 Nov 2026 05:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F380606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lqmIS5Fx
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5PlcqE3459346, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461147; bh=d6Vmz2yO8JeCHPhwWe9fXInHv17oitJtHUvnGtbPBpI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=lqmIS5FxZbgyGt51vBC26jn04SGJnGFgUnnFPKjhzf7GkVFHkq0gWkq9fiRirNvKP
	 HVZe9dPxyqtQaFF6FBzIbNNPdwasqXzLnZvtaHTbl0fO7BZhstkXbQ1ArF5jg0K7il
	 mWJteCSlGOzkmqzv0w/X1//6Z3cJxpdpSS31Awu5reAdOgq9S/L/CHuQdVOj5cSRxL
	 9p3jL9BQ2N0UW38BIw/s2/CUUO3DCl+6l1bB8BXulCYb/xVDuUtoYbuUQh5oZ1Tf5i
	 oVXcDN/C5W6T4V6VIQyWRGvCooYQt3td022u4auQlwNGiKTmOyAYtAst1E8Iu0o801
	 AAt60e2vylVrA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5PlcqE3459346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:25:47 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:46 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:25:46 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 6/9] clk: realtek: Add support for MMC-tuned PLL clocks
Date: Thu, 12 Nov 2026 13:25:41 +0800
Message-ID: <20261112052544.555563-7-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112052544.555563-1-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
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
Changes in v16:
- Remove Brian's reviewed-by tag.
- Move the MMC PLL structs and ops declarations out of clk-pll.h into a new
  clk-regmap-pll-mmc.h.
- Add a separate 'struct rtk_clk_pll_mmc_phase' with its own to_clk_pll_mmc_phase().
- Merge prepare/unprepare/is_prepared into enable/disable/is_enabled, as
  suggested: there is no sleeping operation.
- Introduce the 'rtk_clk_pll_mmc_div_cfg' table for the SSCPLL analog tuning.
- Introduce the 'rtk_clk_pll_mmc_rate' table.
   - determine_rate() selects the closest entry within [min_rate, max_rate]
   - set_rate() programs that entry only
   - recalc_rate() matches all five raw register fields against the table. However,
   only on a miss does it fall back to 'clk_pll_mmc_calc_rate()', which implements
   the formula.
---
 drivers/clk/realtek/Kconfig              |   3 +
 drivers/clk/realtek/Makefile             |   2 +
 drivers/clk/realtek/clk-regmap-pll-mmc.c | 457 +++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-pll-mmc.h |  66 ++++
 drivers/clk/realtek/freq_table.c         |   1 +
 5 files changed, 529 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-pll-mmc.c
 create mode 100644 drivers/clk/realtek/clk-regmap-pll-mmc.h

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
index 000000000000..50df27ef8539
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-pll-mmc.c
@@ -0,0 +1,457 @@
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
+
+#define RTK_PLL_EMMC1_OFFSET            0x0
+#define RTK_PLL_EMMC2_OFFSET            0x4
+#define RTK_PLL_EMMC3_OFFSET            0x8
+#define RTK_PLL_EMMC4_OFFSET            0xc
+#define RTK_PLL_SSC_DIG_EMMC0_OFFSET    0x0
+#define RTK_PLL_SSC_DIG_EMMC3_OFFSET    0xc
+#define RTK_PLL_SSC_DIG_EMMC4_OFFSET    0x10
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
+#define RTK_PLL_SSC_DIG_EMMC0_EN_SSC    BIT(1)
+#define RTK_PLL_FLAG_INITIAL_EMMC_MASK  BIT(8)
+
+#define RTK_PLL_PHRT0_SHIFT             1
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
+static int rtk_clk_regmap_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct rtk_clk_pll_mmc_phase *clkm = to_clk_pll_mmc_phase(hw);
+	int ret;
+	u32 val;
+
+	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->pll_mmc->pll_ofs + RTK_PLL_EMMC1_OFFSET,
+				 RTK_PLL_PHSEL_MASK << clkm->shift, val << clkm->shift);
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
+	unsigned int raw_val;
+	int ret;
+	u32 val;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_mmc->pll_ofs + RTK_PLL_EMMC1_OFFSET,
+			  &raw_val);
+	if (ret)
+		return ret;
+
+	val = (raw_val >> clkm->shift) & RTK_PLL_PHSEL_MASK;
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
+	u32 emmc2, emmc3, ssc3, ssc4, val, ext_f, ncode, fcode, gran_est;
+
+	if (regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET, &emmc2))
+		return 0;
+
+	if (regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET, &emmc3))
+		return 0;
+
+	if (regmap_read(clkm->clkr.regmap, clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET, &ssc3))
+		return 0;
+
+	if (regmap_read(clkm->clkr.regmap, clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC4_OFFSET, &ssc4))
+		return 0;
+
+	val = FIELD_GET(RTK_PLL_SSC_DIV_N_MASK, emmc3);
+	ext_f = FIELD_GET(RTK_PLL_SSC_DIV_EXT_F_MASK, emmc2);
+	ncode = FIELD_GET(RTK_PLL_NCODE_SSC_EMMC_MASK, ssc3);
+	fcode = FIELD_GET(RTK_PLL_FCODE_SSC_EMMC_MASK, ssc3);
+	gran_est = FIELD_GET(RTK_PLL_GRAN_EST_EM_MC_MASK, ssc4);
+
+	for (unsigned int i = 0; clkm->rate_tbl && i < clkm->num_rate_tbl; i++) {
+		const struct rtk_clk_pll_mmc_rate *entry = &clkm->rate_tbl[i];
+
+		if (entry->ssc_div_n == val && entry->ssc_div_ext_f == ext_f &&
+		    entry->ncode == ncode && entry->fcode == fcode &&
+		    entry->gran_est == gran_est)
+			return entry->rate;
+	}
+
+	return clk_pll_mmc_calc_rate(parent_rate, val, ext_f);
+}
+
+static const struct rtk_clk_pll_mmc_rate *
+rtk_clk_pll_mmc_find_rate(const struct rtk_clk_regmap_pll_mmc *clkm, unsigned long rate)
+{
+	if (!clkm->rate_tbl || !clkm->num_rate_tbl)
+		return NULL;
+
+	for (unsigned int i = 0; i < clkm->num_rate_tbl; i++) {
+		if (clkm->rate_tbl[i].rate == rate)
+			return &clkm->rate_tbl[i];
+	}
+
+	return NULL;
+}
+
+static const struct rtk_clk_pll_mmc_rate *
+rtk_clk_pll_mmc_find_closest_rate(const struct rtk_clk_pll_mmc_rate *tbl, u32 num,
+				  unsigned long rate, unsigned long min_rate,
+				  unsigned long max_rate)
+{
+	const struct rtk_clk_pll_mmc_rate *best = NULL;
+	unsigned long best_delta = ~0UL;
+
+	for (unsigned int i = 0; i < num; i++) {
+		const struct rtk_clk_pll_mmc_rate *entry = &tbl[i];
+		unsigned long delta;
+
+		if (entry->rate < min_rate || entry->rate > max_rate)
+			continue;
+
+		delta = entry->rate >= rate ? entry->rate - rate : rate - entry->rate;
+		if (delta < best_delta) {
+			best = entry;
+			best_delta = delta;
+		}
+	}
+
+	return best;
+}
+
+static int rtk_clk_regmap_pll_mmc_determine_rate(struct clk_hw *hw,
+						 struct clk_rate_request *req)
+{
+	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	const struct rtk_clk_pll_mmc_rate *entry;
+
+	if (!clkm->rate_tbl || !clkm->num_rate_tbl ||
+	    req->min_rate > req->max_rate)
+		return -EINVAL;
+
+	entry = rtk_clk_pll_mmc_find_closest_rate(clkm->rate_tbl,
+						  clkm->num_rate_tbl, req->rate,
+						  req->min_rate, req->max_rate);
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
+	u8 num = clkm->num_div_cfg;
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
+	const struct rtk_clk_pll_mmc_rate *entry = rtk_clk_pll_mmc_find_rate(clkm, rate);
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
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
+				 RTK_PLL_NCODE_SSC_EMMC_MASK,
+				 FIELD_PREP(RTK_PLL_NCODE_SSC_EMMC_MASK, entry->ncode));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
+				 RTK_PLL_FCODE_SSC_EMMC_MASK,
+				 FIELD_PREP(RTK_PLL_FCODE_SSC_EMMC_MASK, entry->fcode));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC4_OFFSET,
+				 RTK_PLL_GRAN_EST_EM_MC_MASK,
+				 FIELD_PREP(RTK_PLL_GRAN_EST_EM_MC_MASK, entry->gran_est));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
+				 RTK_PLL_SSC_DIG_EMMC0_EN_SSC,
+				 FIELD_PREP(RTK_PLL_SSC_DIG_EMMC0_EN_SSC, 1));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
+				 RTK_PLL_EN_SSC_EMMC_MASK,
+				 FIELD_PREP(RTK_PLL_EN_SSC_EMMC_MASK, 1));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
+				 RTK_PLL_EN_SSC_EMMC_MASK,
+				 FIELD_PREP(RTK_PLL_EN_SSC_EMMC_MASK, 0));
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
index 000000000000..c2e973f3df72
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-pll-mmc.h
@@ -0,0 +1,66 @@
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
+};
+
+struct rtk_clk_regmap_pll_mmc {
+	struct rtk_clk_regmap clkr;
+	unsigned int pll_ofs;
+	unsigned int ssc_dig_ofs;
+
+	/*
+	 * Optional per-SoC tuning table. When NULL, the driver's default table
+	 * is used and num_div_cfg is ignored;
+	 */
+	const struct rtk_clk_pll_mmc_div_cfg *div_cfg;
+	u32 num_div_cfg;
+
+	/*
+	 * Supported operating points. Must be set: without a table
+	 * ->determine_rate() and ->set_rate() return -EINVAL, while
+	 * ->recalc_rate() falls back to the divider formula. There is no
+	 * default table here because the register values are SoC-specific.
+	 */
+	const struct rtk_clk_pll_mmc_rate *rate_tbl;
+	u32 num_rate_tbl;
+};
+
+#define __rtk_clk_regmap_pll_mmc_hw(_ptr)  __rtk_clk_regmap_hw(&(_ptr)->clkr)
+
+extern const struct clk_ops rtk_clk_pll_mmc_ops;
+
+struct rtk_clk_pll_mmc_phase {
+	struct rtk_clk_regmap clkr;
+	struct rtk_clk_regmap_pll_mmc *pll_mmc;
+	u32 shift;
+};
+
+#define __rtk_clk_regmap_pll_mmc_phase_hw(_ptr) __rtk_clk_regmap_hw(&(_ptr)->clkr)
+
+extern const struct clk_ops rtk_clk_pll_mmc_phase_ops;
+
+#endif /* __CLK_REALTEK_CLK_PLL_MMC_H */
diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_table.c
index 0f977a3fc902..d0e015131e57 100644
--- a/drivers/clk/realtek/freq_table.c
+++ b/drivers/clk/realtek/freq_table.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/limits.h>
 #include <linux/types.h>
 #include "freq_table.h"
 
-- 
2.43.0

