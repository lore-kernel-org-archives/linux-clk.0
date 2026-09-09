Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECD556C63A
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962930; cv=none; b=CSw5iRwn3ZCjakU9MAqpOlpFQTD+cCLxBmiX+pUZopuNJlYGEVwRvP+dvBCXF0R7CFDVEa/+d9KoH0p1p5DrsG/PQn6tb4qVAUom93rYSo3S1NP/o8khG4PzISRBLV6v4KL7mzBt7arjnuDGn2iHJMlY1ALxT8qypWc9JQFKZoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962930; c=relaxed/simple;
	bh=w0QtlbTKpWa2vOrkQ4ReD72OhJcbUe7SlfJVrcZKo+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MOEm9mpyfVmt00zGt6jJy1uxYD8/md29iU+DYLaKNUkhEZuRKkRj/Xk2rYTaUTsgBCDpVxa3UoMMZegVxgegKUYfRsDWlqjsKT5ppostcro0cuLiMJCKM42dgY0VbMTegubA2jAISuKNRlSX3BAgtZbDYUAzJ408mdrwjA5jOZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=DBCfYmh4; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="DBCfYmh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788962838;
	bh=2lqK4nkUEBzZtoYDgRY3977IcZ7JI7mh3h2ZTDbGxbQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=DBCfYmh4elGsKuAWrwVKiOwEfbwaBni5ABXv8rxFhtNAf6fzav6L+SHJeVOO5/dd6
	 QEfnfKvV8gTdYp2xrqcB9RFa2hM+AGLqPpreVwCtGIt5LvGn7wvsbofwk9rq7vOynM
	 HiBePNvFNvQDFQKV2CJF6i2IK9X06v0sURfOAGWA=
X-QQ-mid: zesmtpsz3t1788962836tdc282f0c
X-QQ-Originating-IP: oMXzk2MIuN6L9wUzy4Z4OAOTi7U5ntfMro+/NaRnODc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 22:07:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17223578547801668794
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 09 Sep 2026 22:07:01 +0800
Subject: [PATCH 1/5] clk: spacemit: derive PLL rates from hardware
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-spacemit-pll-init-v1-1-b3065ad5a4ac@linux.spacemit.com>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
In-Reply-To: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5466;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=w0QtlbTKpWa2vOrkQ4ReD72OhJcbUe7SlfJVrcZKo+s=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLM9jb9i5ds+lqqIZS5O3Qyl6rmKSj7yK4D6TMzZpy8
 hHbkyU6HaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABOZ9YfhD+fDl3Gr2qVvXf5o
 zLfhBmu7xpv49Wd+VW7QUFb+8+Go61GG/8GyZsKN3rH/3Pb8jvF4ejpjT6RFpJTfg5ym7z8116g
 e5gAA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OTnfJ5NUztydH5Ib93djWMbBoiYzqOWbvkB2UU/6PolYHs/TDHuA51x4
	o4JGDk7ZmpXoszznCwGb0AITtJZ2TMNOiNnaVUPnrVrZZFq8pUfN+dY8DHR569bJIKR7Wje
	DTDHSKgBPI0AkoCL/gv+AMVGGwkKq5g/9yJDPuife7ibFLEuYQ4e+xhwSsnX7YnkbaQDi91
	luNKdWRo0s2jrPVjJ/8akIcKYB7L4Kc/r6QmIzQeTmJYnxewp0biwuxtzAQfZQ3HWyVdGpg
	TwjMzoSK9bDJhfpuDQhuaAByNc571adRse3WKif9WojY+NzUhZfOHKlGvq3wNTe+QxW1+PX
	128ugygFfuua2sTL2tnd3lpK13ADzwBJ3jwjWs4Tgsbx3aJ0Q8ZgCxmYxmWAsOoPb6rCUTM
	BPvPrBLmeR5x/4VUW5W5JlmL/fGGp0sC+PGAjgrgnWn2UoCpVvBMtTMgZS7eppBoO0q+BQo
	D2/nQ13r+kwI0aQ7sahTlMwZ0hVuk6+fTGiBDEt9JSZH9Qr1e6WHzWyNoH6w8AQtZN3RI9Y
	UXcd+GmnwXHZNqzH9stvEqhTBhmPyuwI3OYIFxXDy/YDIXQDJlMimPUJI81dOMhgBnhWqn3
	C6zl7bBaZBiBd6Q70/XSM1+aD4tPhCAbT16ZnqIhI6LafWnQDMs4ndHBPymqU2u5ej3kQov
	n4uP9Bw3EzMzHOLhWlhk8qCe6staA3m74mPJPLM8bdrnlBr25UjX9SMuqOXmrBIlAfRSYR4
	S9cl4GeEfIiKP9pY3nTmVzkHjMgqC5apfPxGBxa42I6YM0JpAyxN7ymRahiyrWE8taUmbap
	eZO+SP09kbzWmA0oqzlA4/buDQhihZyQKKeu61eF8pf3H2B2f6cH7RhbgYnBaxbLDkiTkkS
	LKpheLPyopBE86+q/YpEZQ2X3L08QY82fa5dDfFSIddWZn0xNTOtPqnZ9kT/VBDVdVy9oOf
	SOi7/Y15TMf8+qDzl14tJXecXQXYt3/QMeRTxRw846AalID/gcv5+OnG2vlFmAB/SijWJ/K
	1ipi9USzTfMfJmSfvfizyjrzngc1dN8HSZdJNXOnL2edEeEoCGKZOss8+AoOsBGu8LoZMHk
	MhYy8qzaMEckIRX3aCXV5SPu5Si3KtD5+mPRMVyRbySnoxcTcv+106Fk6q+UomJ8gJR5OxX
	+uYqTYUKNoKIM/KA8iSZB7SSC1Vspu1vfxxf1qMKiBPY6/4=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Firmware can program valid PLL settings that have no exact register
match in the rate table, even when they produce a listed frequency.
An exact table lookup in recalc_rate() therefore returns zero instead of
the hardware rate.

Replace the register-table lookup with calculations from the K1 PLL and
K3 PLLA register fields, accounting for signed and unsigned fractional
feedback respectively. Return zero for unsupported modes or register
read failures. Rate selection and programming remain table-based.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu_pll.c | 100 +++++++++++++++++++++++++++++++++++------
 1 file changed, 86 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index d4066a0ed4526..c9852fed31017 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -4,8 +4,10 @@
  * Copyright (c) 2024-2025 Haylen Chu <heylenay@4d2.org>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/math.h>
+#include <linux/math64.h>
 #include <linux/regmap.h>
 
 #include "ccu_common.h"
@@ -14,12 +16,24 @@
 #define PLL_TIMEOUT_US		3000
 #define PLL_DELAY_US		5
 
+#define PLL_SWCR1_PREDIV	GENMASK(13, 12)
+#define PLL_SWCR1_INTERNAL	BIT(29)
+#define PLL_SWCR3_INT		GENMASK(30, 24)
+#define PLL_SWCR3_FRAC		GENMASK(23, 0)
+
 #define PLL_SWCR3_EN		((u32)BIT(31))
 #define PLL_SWCR3_MASK		GENMASK(30, 0)
 
 #define PLLA_SWCR2_EN		((u32)BIT(16))
 #define PLLA_SWCR2_MASK		GENMASK(15, 8)
 
+#define PLLA_SWCR1_USER_MODE	BIT(25)
+#define PLLA_SWCR1_INT		GENMASK(22, 16)
+#define PLLA_SWCR1_REFSEL	GENMASK(15, 14)
+#define PLLA_SWCR1_FRAC		GENMASK(13, 0)
+#define PLLA_SWCR3_PREDIV	GENMASK(21, 20)
+#define PLL_FRAC_BITS		22
+
 static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *pll,
 							       unsigned long rate)
 {
@@ -115,17 +129,78 @@ static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
-					 unsigned long parent_rate)
+static int ccu_pll_get_params(struct ccu_pll *pll,
+			      struct ccu_pll_rate_tbl *params, bool plla)
 {
-	struct ccu_pll *pll = hw_to_ccu_pll(hw);
-	const struct ccu_pll_rate_tbl *entry;
+	struct ccu_common *common = &pll->common;
+	int ret;
+
+	ret = regmap_read(common->regmap, common->reg_swcr1, &params->swcr1);
+	if (ret)
+		return ret;
+	params->swcr2 = 0;
+	if (plla) {
+		ret = regmap_read(common->regmap, common->reg_swcr2, &params->swcr2);
+		if (ret)
+			return ret;
+	}
+	return regmap_read(common->regmap, common->reg_swcr3, &params->swcr3);
+}
+
+static unsigned long ccu_pll_calc_rate(const struct ccu_pll_rate_tbl *params,
+				      unsigned long parent_rate)
+{
+	u32 swcr1 = params->swcr1, swcr3 = params->swcr3, prediv;
+	s64 divider;
+	u64 rate;
+
+	/* The programmed divider is not used in internal configuration mode. */
+	if (swcr1 & PLL_SWCR1_INTERNAL)
+		return 0;
+
+	prediv = FIELD_GET(PLL_SWCR1_PREDIV, swcr1) + 1;
+	divider = (s64)FIELD_GET(PLL_SWCR3_INT, swcr3) << PLL_FRAC_BITS;
+	/* The 24-bit fractional code is signed, with an LSB of 2^-22. */
+	divider += sign_extend32(FIELD_GET(PLL_SWCR3_FRAC, swcr3), 23);
+	if (divider <= 0)
+		return 0;
+
+	/* Fvco = Fref * Npre * (Nint + Nfrac). */
+	rate = (u64)parent_rate * prediv * divider;
+	return DIV_ROUND_CLOSEST_ULL(rate, BIT_ULL(PLL_FRAC_BITS));
+}
+
+static unsigned long ccu_plla_calc_rate(const struct ccu_pll_rate_tbl *params,
+				       unsigned long parent_rate)
+{
+	u32 swcr1 = params->swcr1, swcr2 = params->swcr2;
+	u32 swcr3 = params->swcr3, prediv, frac;
+	u64 divider, rate;
+
+	/* Decode the software-controlled mode described by the PLL calculator. */
+	if (!(swcr1 & PLLA_SWCR1_USER_MODE) ||
+	    (swcr1 & PLLA_SWCR1_REFSEL))
+		return 0;
+
+	prediv = FIELD_GET(PLLA_SWCR3_PREDIV, swcr3) + 1;
+	frac = FIELD_GET(PLLA_SWCR1_FRAC, swcr1) << 8;
+	frac |= FIELD_GET(PLLA_SWCR2_MASK, swcr2);
+	divider = (u64)FIELD_GET(PLLA_SWCR1_INT, swcr1) << PLL_FRAC_BITS;
+	divider += frac;
 
-	entry = ccu_pll_lookup_matched_entry(pll);
+	/* Fvco = Fref * Npre * (Nint + Nfrac), with an unsigned fraction. */
+	rate = (u64)parent_rate * prediv * divider;
+	return DIV_ROUND_CLOSEST_ULL(rate, BIT_ULL(PLL_FRAC_BITS));
+}
 
-	WARN_ON_ONCE(!entry);
+static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct ccu_pll_rate_tbl params;
 
-	return entry ? entry->rate : 0;
+	if (ccu_pll_get_params(hw_to_ccu_pll(hw), &params, false))
+		return 0;
+	return ccu_pll_calc_rate(&params, parent_rate);
 }
 
 static int ccu_pll_determine_rate(struct clk_hw *hw,
@@ -232,14 +307,11 @@ static int ccu_plla_set_rate(struct clk_hw *hw, unsigned long rate,
 static unsigned long ccu_plla_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
 {
-	struct ccu_pll *pll = hw_to_ccu_pll(hw);
-	const struct ccu_pll_rate_tbl *entry;
-
-	entry = ccu_plla_lookup_matched_entry(pll);
+	struct ccu_pll_rate_tbl params;
 
-	WARN_ON_ONCE(!entry);
-
-	return entry ? entry->rate : 0;
+	if (ccu_pll_get_params(hw_to_ccu_pll(hw), &params, true))
+		return 0;
+	return ccu_plla_calc_rate(&params, parent_rate);
 }
 
 static int ccu_plla_init(struct clk_hw *hw)

-- 
2.55.0

