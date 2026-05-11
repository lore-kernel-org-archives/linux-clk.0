Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4DC3A383B;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503657; cv=none; b=t9/tHtobkv/i2iO+YYfPbJTj7jXowRu7mBLOfWANNEDNFt6hapAJZ4yA8B/VdOgqPC+wAvky9OcqdZFyq1cbs/pz9E6hCTeJQlhB8wW9HcQ1r6L91zQwSMvw6X4gidSyW7gAQ9Sdv2vFBIXLGYLdenAmN/WxCpyRyL/x9wX09dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503657; c=relaxed/simple;
	bh=dBKVlNivUsaAifQ1ih8w2u1+cBsc/GfhVOg52xevDzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0wUWjS6ppUqImUlFvpKY6tgwZ2AZqHNj3jaWOy+KU9a0hopfUpZKzYjUpijnZoHSxX+9Gt88Wp0gQPP3gv7CDGeHNdSapWkeBPjuwhdFV/knZG4oxNAEJMaMAtZwIdqKIGkkfgvk1Em3Debl7kfzw4fXsby+HL4t9rYUaAUCGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUYq/X/y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUYq/X/y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A626AC2BCFD;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778503657;
	bh=dBKVlNivUsaAifQ1ih8w2u1+cBsc/GfhVOg52xevDzc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gUYq/X/yIhrtOHYo1fQX/iHc7hr8jfVw8HCSOp95kKZ9G7kBZZbpn9DmHBvZDgBrK
	 q3aynDu+eAUePreP8cRTbt6sac3Fu3yJ0fGE0urbqk1OGjeF3SxoWs27Ba7aCjePeb
	 0rnyAu+lVgmIUnpORzbHmVPUSaVruymFwBNzTsqyzIMWLA0h3UCbffpt4VeN9uzmid
	 RmU0wWBMcoqYda+x1s9RSkvDL9IMSyemO5a2Xcd5ApS8nKVqMzuO2LMCJd+B9RpjgE
	 +ekC+HsgcxkKUcsthkQfJ6q4tHO2QYGL8aAZYjzqsaeokF4/Qcl1Frw1cDaBaV8cP4
	 1lwr1VRQISsWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAFCCD4840;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Mon, 11 May 2026 20:47:29 +0800
Subject: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
In-Reply-To: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503655; l=3404;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=FRbURImYvA8PQjPZwUxTkKIfvVnFpwlbaEEEXy1Gh6U=;
 b=KrXJyAt4hyF2WeuGjIVZL8f8n3cBg3cWKcxKTvtoIKcHlRcHPl7Rp3QDx/sh3jFUER0XYtN3M
 4SqQC59BIUSAiw9KJ3WB4kh0V7HF7PbIt972ZNfe8nJpWKa2Q0AhLv9
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

From: Jian Hu <jian.hu@amlogic.com>

The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
duty cycle of 50% after predivision.

Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
pre-divider division factor is 2^n.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 28 +++++++++++++++++++++++-----
 drivers/clk/meson/clk-pll.h |  2 ++
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 8568ad6ba7b6..49483e431d44 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -66,6 +66,9 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
 		rate += DIV_ROUND_UP_ULL(frac_rate, frac_max);
 	}
 
+	if (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)
+		n = 1 << n;
+
 	return DIV_ROUND_UP_ULL(rate, n);
 }
 
@@ -83,7 +86,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	 * it would result in a division by zero. The rate can't be
 	 * calculated in this case
 	 */
-	if (n == 0)
+	if (n == 0 && !(pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))
 		return 0;
 
 	m = meson_parm_read(clk->map, &pll->m);
@@ -103,7 +106,12 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
 {
 	unsigned int frac_max = pll->frac_max ? pll->frac_max :
 						(1 << pll->frac.width);
-	u64 val = (u64)rate * n;
+	u64 val;
+
+	if (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)
+		n = 1 << n;
+
+	val = (u64)rate * n;
 
 	/* Bail out if we are already over the requested rate */
 	if (rate < parent_rate * m / n)
@@ -142,7 +150,8 @@ static int meson_clk_get_pll_table_index(unsigned int index,
 					 unsigned int *n,
 					 struct meson_clk_pll_data *pll)
 {
-	if (!pll->table[index].n)
+	if (!pll->table[index].n &&
+	    !(pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))
 		return -EINVAL;
 
 	*m = pll->table[index].m;
@@ -156,7 +165,12 @@ static unsigned int meson_clk_get_pll_range_m(unsigned long rate,
 					      unsigned int n,
 					      struct meson_clk_pll_data *pll)
 {
-	u64 val = (u64)rate * n;
+	u64 val;
+
+	if (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)
+		n = 1 << n;
+
+	val = (u64)rate * n;
 
 	if (__pll_round_closest_mult(pll))
 		return DIV_ROUND_CLOSEST_ULL(val, parent_rate);
@@ -173,11 +187,15 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 {
 	*n = index + 1;
 
+	if ((pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))
+		*n = index;
+
 	/* Check the predivider range */
 	if (*n >= (1 << pll->n.width))
 		return -EINVAL;
 
-	if (*n == 1) {
+	if ((*n == 1 && !(pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)) ||
+	    (*n == 0 && (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))) {
 		/* Get the boundaries out the way */
 		if (rate <= pll->range->min * parent_rate) {
 			*m = pll->range->min;
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 1be7e6e77631..60b2772a54c8 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -33,6 +33,8 @@ struct pll_mult_range {
 #define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
 /* rst signal is active-low (Power-on reset) */
 #define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(3)
+/* The division factor of the PLL pre-divider is 2^n */
+#define CLK_MESON_PLL_N_POWER_OF_TWO	BIT(4)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.47.1


