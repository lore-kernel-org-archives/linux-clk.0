Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758C61F19A;
	Wed,  3 Sep 2025 00:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858185; cv=none; b=M9rNYnJ+qaV7kVmAXHJzhbk8C/POfmiBweEojGK57XkTm6gQ4du7ylfwmF23Lzew3zd37IjC6nEnLLOv0gQfMN5LnlhhlQLKeNDvMJH2cc7lf0I2Ar4bALFTOqFNWEDdQEnhLug9xc9pjxs538V1KqMnXPdG6/tTZGWoKIi9sbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858185; c=relaxed/simple;
	bh=7JPCPMlWGthZH0KOSRZQjMkWUESEryL+gfstKj3r1eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlaLEqCIKTlBcmIQOvBcbM8TGcVJVyAuo4jno8Fjq9+6wYppF1uNWVYrkXbol9unnxSXkivKRu3h1dth+p3RTQxzcA+mwzbPgBwbP92feKh/8R+cxba6UD0M7gOnrU3YweRF9hxkjrEk1oGTk5hkkJoC0g3jlJqfl4s1ET8n3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 804B41764;
	Tue,  2 Sep 2025 17:09:34 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A6363F63F;
	Tue,  2 Sep 2025 17:09:40 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [PATCH 2/5] clk: sunxi-ng: generalise update bit
Date: Wed,  3 Sep 2025 01:09:07 +0100
Message-ID: <20250903000910.4860-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250903000910.4860-1-andre.przywara@arm.com>
References: <20250903000910.4860-1-andre.przywara@arm.com>
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

Change the existing update bit users to use this new encoding, and add
support for the ccu_nm clock on the way, since we will need it there
shortly.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 12 ++++++------
 drivers/clk/sunxi-ng/ccu_common.h      |  5 +----
 drivers/clk/sunxi-ng/ccu_div.c         |  3 +--
 drivers/clk/sunxi-ng/ccu_gate.c        |  6 ++----
 drivers/clk/sunxi-ng/ccu_mp.h          |  8 +++++---
 drivers/clk/sunxi-ng/ccu_mux.c         |  3 +--
 drivers/clk/sunxi-ng/ccu_nm.c          |  1 +
 7 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 1a9a1cb869e23..736144f9e1833 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -385,8 +385,8 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
 					    0, 0,		/* no P */
 					    24, 3,	/* mux */
 					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+					    BIT(27),	/* update*/
+					    CLK_IS_CRITICAL, 0);
 
 static const struct clk_hw *mbus_hws[] = { &mbus_clk.common.hw };
 
@@ -577,8 +577,8 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
 					    0, 0,	/* no P */
 					    24, 3,	/* mux */
 					    BIT(31),	/* gate */
-					    CLK_SET_RATE_PARENT,
-					    CCU_FEATURE_UPDATE_BIT);
+					    BIT(27),	/* update */
+					    CLK_SET_RATE_PARENT, 0);
 
 static SUNXI_CCU_GATE_HWS(bus_iommu_clk, "bus-iommu", apb0_hws, 0x7bc,
 			  BIT(0), 0);
@@ -596,8 +596,8 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
 					    0, 0,	/* no P */
 					    24, 3,	/* mux */
 					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+					    BIT(27),	/* update*/
+					    CLK_IS_CRITICAL, 0);
 
 static SUNXI_CCU_GATE_HWS(mbus_dma_clk, "mbus-dma", mbus_hws,
 			  0x804, BIT(0), 0);
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index bbec283b9d993..e4caad2d8cef6 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -20,14 +20,10 @@
 #define CCU_FEATURE_KEY_FIELD		BIT(8)
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
-#define CCU_FEATURE_UPDATE_BIT		BIT(11)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)
 
-/* Some clocks need this bit to actually apply register changes */
-#define CCU_SUNXI_UPDATE_BIT		BIT(27)
-
 struct device_node;
 
 struct ccu_common {
@@ -35,6 +31,7 @@ struct ccu_common {
 	u16		reg;
 	u16		lock_reg;
 	u32		prediv;
+	u32		update_bit;
 
 	unsigned long	min_rate;
 	unsigned long	max_rate;
diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 916d6da6d8a3b..fe97875f7c82d 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -106,8 +106,7 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	reg = readl(cd->common.base + cd->common.reg);
 	reg &= ~GENMASK(cd->div.width + cd->div.shift - 1, cd->div.shift);
-	if (cd->common.features & CCU_FEATURE_UPDATE_BIT)
-		reg |= CCU_SUNXI_UPDATE_BIT;
+	reg |= cd->common.update_bit;
 
 	writel(reg | (val << cd->div.shift),
 	       cd->common.base + cd->common.reg);
diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_gate.c
index 30673fe4e3c2c..729d711c73fe7 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.c
+++ b/drivers/clk/sunxi-ng/ccu_gate.c
@@ -20,8 +20,7 @@ void ccu_gate_helper_disable(struct ccu_common *common, u32 gate)
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
-	if (common->features & CCU_FEATURE_UPDATE_BIT)
-		reg |= CCU_SUNXI_UPDATE_BIT;
+	reg |= common->update_bit;
 	writel(reg & ~gate, common->base + common->reg);
 
 	spin_unlock_irqrestore(common->lock, flags);
@@ -46,8 +45,7 @@ int ccu_gate_helper_enable(struct ccu_common *common, u32 gate)
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
-	if (common->features & CCU_FEATURE_UPDATE_BIT)
-		reg |= CCU_SUNXI_UPDATE_BIT;
+	reg |= common->update_bit;
 	writel(reg | gate, common->base + common->reg);
 
 	spin_unlock_irqrestore(common->lock, flags);
diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
index bb09c649bfa35..37d3128875194 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.h
+++ b/drivers/clk/sunxi-ng/ccu_mp.h
@@ -131,7 +131,8 @@ struct ccu_mp {
 					     _mshift, _mwidth,		\
 					     _pshift, _pwidth,		\
 					     _muxshift, _muxwidth,	\
-					     _gate, _flags, _features)	\
+					     _gate, _update,		\
+					     _flags, _features)		\
 	struct ccu_mp _struct = {					\
 		.enable	= _gate,					\
 		.m	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
@@ -140,6 +141,7 @@ struct ccu_mp {
 		.common	= {						\
 			.reg		= _reg,				\
 			.features	= _features,			\
+			.update_bit	= _update,			\
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
index 74f9e98a5d355..8ff9f15bab0bd 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -197,8 +197,7 @@ int ccu_mux_helper_set_parent(struct ccu_common *common,
 	/* The key field always reads as zero. */
 	if (common->features & CCU_FEATURE_KEY_FIELD)
 		reg |= CCU_MUX_KEY_VALUE;
-	if (common->features & CCU_FEATURE_UPDATE_BIT)
-		reg |= CCU_SUNXI_UPDATE_BIT;
+	reg |= common->update_bit;
 
 	reg &= ~GENMASK(cm->width + cm->shift - 1, cm->shift);
 	writel(reg | (index << cm->shift), common->base + common->reg);
diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index df01ed3b37a6b..e502b9c78c1b1 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -219,6 +219,7 @@ static int ccu_nm_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	reg |= (_nm.n - nm->n.offset) << nm->n.shift;
 	reg |= (_nm.m - nm->m.offset) << nm->m.shift;
+	reg |= nm->common.update_bit;
 	writel(reg, nm->common.base + nm->common.reg);
 
 	spin_unlock_irqrestore(nm->common.lock, flags);
-- 
2.46.3

