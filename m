Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9918D4A4F10;
	Thu, 17 Sep 2026 22:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684773; cv=none; b=jOsPi7uxRWFIQvSav7CL4NklsfCZuwBJo6BmTHK67qRW3qq7QHgjcYLtWn7wDtAOBA0lbzVyCIZW06hof0JoApI/Lt50LvTVgPdo7kWGPAHcYHXGxyw2roh4XZpKJPnEjXC54ITIj5txDs801DO/iLbTSaP0cz6hMd29mi3CLNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684773; c=relaxed/simple;
	bh=SSjJ8TA7iIcrIpYz/AlAGO5Nlz3ZuXOyElLuqGPXx2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xf+jSMo7iYved1TGy9/BAwQ8itqWAGHMz3rrNdScXTvV12wooW5nhuR65URFrgzhzBDKyq3cd735T4VwvXhrubGc6dSgBmMdGdaJd7JgRhwUZkDPHe7bucLeU517LUgtch77PXCpldBvf8AyctKUMxvQwp9TspzchUpHKY5fJxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TltxdLjJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TltxdLjJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B6891596;
	Thu, 17 Sep 2026 15:39:26 -0700 (PDT)
Received: from e142021.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 123C23F86F;
	Thu, 17 Sep 2026 15:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789684769; bh=SSjJ8TA7iIcrIpYz/AlAGO5Nlz3ZuXOyElLuqGPXx2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TltxdLjJrnFLH051lZvkXTPaeSEK9m0QDsuNX8I6SYCafhEkikFnA5ACjj1rC+ybm
	 tC1fhJ6Km5kXQHAfb7H5HcQsQsLp0TtBkUXrnE0m5w2Lc4wOUE5JITw16Ne9B5cVoV
	 D1iRUsGkoYMcaqyDvx2L+qhROaLch4lpM51vjzQI=
From: Andre Przywara <andre.przywara@arm.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/5] clk: sunxi-ng: generalise update bit
Date: Fri, 18 Sep 2026 00:39:09 +0200
Message-ID: <20260917223913.1855301-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917223913.1855301-1-andre.przywara@arm.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few of the Allwinner A523 CCU clock registers introduced an "update" bit,
which must be set for changes to the other bits to take effect.
Of the three clocks where this was used, it was always bit 27, so we just
encoded this as a single bit feature flag.

Now the CPU PLL also features the update bit, but puts it at bit 26, so
this flag trick won't work anymore.

Add an "update_bit" field to the common sunxi clock struct, which takes a
bitmask, so we can encode any bit to use, even potentially multiple of
them. As uninitialised fields are set to 0, we can use this as a default
bitmask to set, so can OR this in unconditionally.
It turns out that the "update key" feature is doing something very
similar, so just convert it over to also use this same bitmask approach.

Change the existing update bit users to use this new encoding, and add
support for the ccu_nm clock on the way, since we will need it there
shortly.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 12 ++++++------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c   |  4 ++--
 drivers/clk/sunxi-ng/ccu_common.h      |  8 +++-----
 drivers/clk/sunxi-ng/ccu_div.c         |  3 +--
 drivers/clk/sunxi-ng/ccu_gate.c        |  6 ++----
 drivers/clk/sunxi-ng/ccu_mp.h          |  8 +++++---
 drivers/clk/sunxi-ng/ccu_mux.c         |  8 +-------
 drivers/clk/sunxi-ng/ccu_nm.c          |  1 +
 8 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 20dad06b37ca3..35cddab0749b3 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -386,8 +386,8 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
 					    0, 0,		/* no P */
 					    24, 3,	/* mux */
 					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+					    BIT(27),	/* update*/
+					    CLK_IS_CRITICAL, 0);
 
 static const struct clk_hw *mbus_hws[] = { &mbus_clk.common.hw };
 
@@ -590,8 +590,8 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
 					    0, 0,	/* no P */
 					    24, 3,	/* mux */
 					    BIT(31),	/* gate */
-					    CLK_SET_RATE_PARENT,
-					    CCU_FEATURE_UPDATE_BIT);
+					    BIT(27),	/* update */
+					    CLK_SET_RATE_PARENT, 0);
 
 static SUNXI_CCU_GATE_HWS(bus_iommu_clk, "bus-iommu", apb0_hws, 0x7bc,
 			  BIT(0), 0);
@@ -609,8 +609,8 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
 					    0, 0,	/* no P */
 					    24, 3,	/* mux */
 					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+					    BIT(27),	/* update*/
+					    CLK_IS_CRITICAL, 0);
 
 static SUNXI_CCU_GATE_HWS(mbus_dma_clk, "mbus-dma", mbus_hws,
 			  0x804, BIT(0), 0);
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 98ae10307f438..dde56529f281d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -214,7 +214,7 @@ static struct ccu_mux osc32k_clk = {
 	.mux	= _SUNXI_CCU_MUX(0, 1),
 	.common	= {
 		.reg		= LOSC_CTRL_REG,
-		.features	= CCU_FEATURE_KEY_FIELD,
+		.update_bits	= CCU_MUX_KEY_VALUE,
 		.hw.init	= &osc32k_init_data,
 	},
 };
@@ -280,7 +280,7 @@ static struct ccu_mux rtc_32k_clk = {
 	.mux	= _SUNXI_CCU_MUX(1, 1),
 	.common	= {
 		.reg		= LOSC_CTRL_REG,
-		.features	= CCU_FEATURE_KEY_FIELD,
+		.update_bits	= CCU_MUX_KEY_VALUE,
 		.hw.init	= &rtc_32k_init_data,
 	},
 };
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index d9dc24ad55039..e0ed861735beb 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -17,17 +17,14 @@
 #define CCU_FEATURE_LOCK_REG		BIT(5)
 #define CCU_FEATURE_MMC_TIMING_SWITCH	BIT(6)
 #define CCU_FEATURE_SIGMA_DELTA_MOD	BIT(7)
-#define CCU_FEATURE_KEY_FIELD		BIT(8)
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
-#define CCU_FEATURE_UPDATE_BIT		BIT(11)
-#define CCU_FEATURE_IOSC_CALIBRATION	BIT(12)
+#define CCU_FEATURE_IOSC_CALIBRATION	BIT(11)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)
 
-/* Some clocks need this bit to actually apply register changes */
-#define CCU_SUNXI_UPDATE_BIT		BIT(27)
+#define CCU_MUX_KEY_VALUE		0x16aa0000
 
 struct device_node;
 
@@ -36,6 +33,7 @@ struct ccu_common {
 	u16		reg;
 	u16		lock_reg;
 	u32		prediv;
+	u32		update_bits;
 
 	unsigned long	min_rate;
 	unsigned long	max_rate;
diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index c385e0160f13b..a6e81bac18d6e 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -119,8 +119,7 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	reg = readl(cd->common.base + cd->common.reg);
 	reg &= ~GENMASK(cd->div.width + cd->div.shift - 1, cd->div.shift);
-	if (cd->common.features & CCU_FEATURE_UPDATE_BIT)
-		reg |= CCU_SUNXI_UPDATE_BIT;
+	reg |= cd->common.update_bits;
 
 	writel(reg | (val << cd->div.shift),
 	       cd->common.base + cd->common.reg);
diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_gate.c
index 30673fe4e3c2c..532e661b5f4b1 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.c
+++ b/drivers/clk/sunxi-ng/ccu_gate.c
@@ -20,8 +20,7 @@ void ccu_gate_helper_disable(struct ccu_common *common, u32 gate)
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
-	if (common->features & CCU_FEATURE_UPDATE_BIT)
-		reg |= CCU_SUNXI_UPDATE_BIT;
+	reg |= common->update_bits;
 	writel(reg & ~gate, common->base + common->reg);
 
 	spin_unlock_irqrestore(common->lock, flags);
@@ -46,8 +45,7 @@ int ccu_gate_helper_enable(struct ccu_common *common, u32 gate)
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
-	if (common->features & CCU_FEATURE_UPDATE_BIT)
-		reg |= CCU_SUNXI_UPDATE_BIT;
+	reg |= common->update_bits;
 	writel(reg | gate, common->base + common->reg);
 
 	spin_unlock_irqrestore(common->lock, flags);
diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
index bb09c649bfa35..6ebb48438b5d4 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.h
+++ b/drivers/clk/sunxi-ng/ccu_mp.h
@@ -131,7 +131,8 @@ struct ccu_mp {
 					     _mshift, _mwidth,		\
 					     _pshift, _pwidth,		\
 					     _muxshift, _muxwidth,	\
-					     _gate, _flags, _features)	\
+					     _gate, _key_update,	\
+					     _flags, _features)		\
 	struct ccu_mp _struct = {					\
 		.enable	= _gate,					\
 		.m	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
@@ -140,6 +141,7 @@ struct ccu_mp {
 		.common	= {						\
 			.reg		= _reg,				\
 			.features	= _features,			\
+			.update_bits	= _key_update,			\
 			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name, \
 								   _parents, \
 								   &ccu_mp_ops, \
@@ -156,7 +158,7 @@ struct ccu_mp {
 					     _reg, _mshift, _mwidth,	\
 					     _pshift, _pwidth,		\
 					     _muxshift, _muxwidth,	\
-					     _gate, _flags, 0)
+					     _gate, 0, _flags, 0)
 
 #define SUNXI_CCU_DUALDIV_MUX_GATE(_struct, _name, _parents, _reg,	\
 				   _mshift, _mwidth,			\
@@ -167,7 +169,7 @@ struct ccu_mp {
 					     _reg, _mshift, _mwidth,	\
 					     _pshift, _pwidth,		\
 					     _muxshift, _muxwidth,	\
-					     _gate, _flags,		\
+					     _gate, 0, _flags,		\
 					     CCU_FEATURE_DUAL_DIV)
 
 #define SUNXI_CCU_MP_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 4503c9780c39f..3bb2ba5e809a3 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -12,8 +12,6 @@
 #include "ccu_gate.h"
 #include "ccu_mux.h"
 
-#define CCU_MUX_KEY_VALUE		0x16aa0000
-
 static u16 ccu_mux_get_prediv(struct ccu_common *common,
 			      struct ccu_mux_internal *cm,
 			      int parent_index)
@@ -203,11 +201,7 @@ int ccu_mux_helper_set_parent(struct ccu_common *common,
 
 	reg = readl(common->base + common->reg);
 
-	/* The key field always reads as zero. */
-	if (common->features & CCU_FEATURE_KEY_FIELD)
-		reg |= CCU_MUX_KEY_VALUE;
-	if (common->features & CCU_FEATURE_UPDATE_BIT)
-		reg |= CCU_SUNXI_UPDATE_BIT;
+	reg |= common->update_bits;
 
 	reg &= ~GENMASK(cm->width + cm->shift - 1, cm->shift);
 	writel(reg | (index << cm->shift), common->base + common->reg);
diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index df01ed3b37a6b..80aad0650f348 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -219,6 +219,7 @@ static int ccu_nm_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	reg |= (_nm.n - nm->n.offset) << nm->n.shift;
 	reg |= (_nm.m - nm->m.offset) << nm->m.shift;
+	reg |= nm->common.update_bits;
 	writel(reg, nm->common.base + nm->common.reg);
 
 	spin_unlock_irqrestore(nm->common.lock, flags);
-- 
2.43.0

