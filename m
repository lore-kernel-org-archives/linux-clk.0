Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B8E24DFFA
	for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740566323; cv=none; b=LzsLMfdREC6np8152oD6HIl2eCvu6Vt99w0cK8rRi9vw77pr0aP/CCHE6VnHdKQqCNfRe15araKwuAvDPrc0rKNtXq1AThIkwe1PUuChupQvBjB7BCE16xJ/LqFV5CNz7MVqvJwXStgmMqoSYgPAFU0QBLgp4UtwTVeYAXfiLgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740566323; c=relaxed/simple;
	bh=dTkbp/z8Ll0lrnhbr35swQzc9aZOaXbiU3Fa3836y8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mj9Pug9Q5BBc3ulXMixRfa4o1eL4zRiHrUHBrWUkYedj3sMhK//Q3vOaQZFmj42dY04ElJeKfktsvqu4CeqPIsiga1mopbEYqKILrUVPZ416MlXyIfwTAjZ+GyQUGV0FCx1YTM2VUb8ygkgrQ0fY4ssFmt2ywIQ0R3IEJNhHQWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 211FF2BC0;
	Wed, 26 Feb 2025 02:38:57 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 693993F6A8;
	Wed, 26 Feb 2025 02:38:39 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] clk: sunxi-ng: d1: Add missing divider for MMC mod clocks
Date: Wed, 26 Feb 2025 10:37:34 +0000
Message-Id: <20250226103734.1252013-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226103734.1252013-1-andre.przywara@arm.com>
References: <20250226103734.1252013-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The D1/R528/T113 SoCs have a hidden divider of 2 in the MMC mod clocks,
just as other recent SoCs. So far we did not describe that, which led
to the resulting MMC clock rate to be only half of its intended value.

Use a macro that allows to describe a fixed post-divider, to compensate
for that divisor.

This brings the MMC performance on those SoCs to its expected level,
so about 23 MB/s for SD cards, instead of the 11 MB/s measured so far.

Fixes: 35b97bb94111 ("clk: sunxi-ng: Add support for the D1 SoC clocks")
Reported-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun20i-d1.c | 43 ++++++++++++++++------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
index bb66c906ebbb6..d52a0ef43ea6c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
+++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
@@ -412,19 +412,24 @@ static const struct clk_parent_data mmc0_mmc1_parents[] = {
 	{ .hw = &pll_periph0_2x_clk.common.hw },
 	{ .hw = &pll_audio1_div2_clk.common.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc0_clk, "mmc0", mmc0_mmc1_parents, 0x830,
-				       0, 4,	/* M */
-				       8, 2,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc1_clk, "mmc1", mmc0_mmc1_parents, 0x834,
-				       0, 4,	/* M */
-				       8, 2,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc0_clk, "mmc0", mmc0_mmc1_parents,
+					  0x830,
+					  0, 4,		/* M */
+					  8, 2,		/* P */
+					  24, 3,	/* mux */
+					  BIT(31),	/* gate */
+					  2,            /* post-div */
+					  0, 0);
+
+static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc1_clk, "mmc1", mmc0_mmc1_parents,
+					  0x834,
+					  0, 4,		/* M */
+					  8, 2,		/* P */
+					  24, 3,	/* mux */
+					  BIT(31),	/* gate */
+					  2,            /* post-div */
+					  0, 0);
 
 static const struct clk_parent_data mmc2_parents[] = {
 	{ .fw_name = "hosc" },
@@ -433,12 +438,14 @@ static const struct clk_parent_data mmc2_parents[] = {
 	{ .hw = &pll_periph0_800M_clk.common.hw },
 	{ .hw = &pll_audio1_div2_clk.common.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc2_clk, "mmc2", mmc2_parents, 0x838,
-				       0, 4,	/* M */
-				       8, 2,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc2_clk, "mmc2", mmc2_parents,
+					  0x838,
+					  0, 4,	/* M */
+					  8, 2,	/* P */
+					  24, 3,	/* mux */
+					  BIT(31),	/* gate */
+					  2,            /* post-div */
+					  0, 0);
 
 static SUNXI_CCU_GATE_HWS(bus_mmc0_clk, "bus-mmc0", psi_ahb_hws,
 			  0x84c, BIT(0), 0);
-- 
2.25.1

