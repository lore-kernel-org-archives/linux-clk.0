Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822957;
	b=kqPaSHTZX9ZGhI/zUTT8t8zsobMdneuNfpHkDGlRnXl0LkbPV7vmgUEuY7fJu+BTvR0R
	 9jsJe90TnZ7pXgmZ9l+LfNNpR2rL1dkhdVj09eal3+c1svlu+AbP/IIxZ2y1GNy6SKWWZ
	 /3LXTDFlyato9q0gnTDQZOcj9EzoHhNRzmw/ZEZoaGcDD6xC1QiJ61ZZe62DOcyH2P3Z8
	 KVAXEewRygCZPNGuv6bRQd+4nlwGRUKx+JqtQHALFsVSjtTQ+YEepkVupDYdPZVxNzbVR
	 CfznmJwXWGcbncipetm+qAcs5rr7lk/Ie1IaENFIGEDeDRhnaZ5bkZZeIW6Jf7wifCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822957;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=AySTfph9GgavAxh8AyirybB3B3YumYDP5rcQlf6EoYs=;
	b=PpmK4vGVe/r6yPiUgfF1JBXTm9WR+Xcni2F3KVI+dcWmw6/QDglfkY4JhVuypiXkUmGr
	 1HGP2FluFCP3Gu9/VCtgZIS7bfmseknPBpKxd6XHFFFO6B8FUTgtKleVbFOqZhlCLam6p
	 Em3VjXzS8c4ujIEeuzT4xwD14b+HsSFxqRDDZaoOYwTn3pHxSEKvVcnXag2hxArZYfDR7
	 nJdFxIUJwuhDQYpraJDgTQqYPDyDDA9veE0jsOeR9N6erLHPOYDIh7qC7N7hvPeIoHCiB
	 7x4iW0bn68M1vbOJG6hcmEoY3rKfiq12HRf0eAIZqxXG+XQ0pxdXZRaF+Wl9xJoHVsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fh0SvYZj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D7E606A31C;
	Fri, 27 Nov 2026 23:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fh0SvYZj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552F31F00893;
	Fri, 27 Nov 2026 23:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822956;
	bh=AySTfph9GgavAxh8AyirybB3B3YumYDP5rcQlf6EoYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Fh0SvYZjsEDEPTLYf+limY+Zx2gkoSKqS7eNVc1hxh2CjhfpymsfZgALXCfhLiTUW
	 xSryqi/5G1INLLbkEGZAzVGKfo0e4pRsN0Y0WVSWPG7K3+tvsjbuT5B0uAHvuXlHzD
	 xBYAFYW2LtGE0lmGsZl8qWC+Q28e4ln3xg4OdqFTLYnluHSQE2KT9g8mmbYfRCIgWR
	 Vjv8s17MzkgQruuhNjbmil9Z5xRP5UmA46RcWd6vCScvn1t5ZioldrQBD1XuHAAC9Y
	 O8vM4w7jR12Wr64Jbmdw/SbPd/6nSZO92VJCPuLABGEtVjXLFvjzeRA1zVtnWF8ZeT
	 MweSLDSH/g5ug==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Nov 2026 00:42:29 +0100
Subject: [PATCH 1/6] clk: ux500: Select ARMSS firmware operating points in
 the clock driver
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-ux500-prcmu-clock-move-v1-1-77c49daad1d2@kernel.org>
References: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
In-Reply-To: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
X-Mailer: b4 0.16.0

Move the ARMSS frequency-to-OPP mapping out of the PRCMU driver.
Use a single table for rounding and setting rates, preserving the
separate maximum frequency for U8520 firmware. Keep the actual ARM
OPP request and acknowledgement in the PRCMU mailbox driver.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/clk/ux500/clk-prcmu.c | 61 ++++++++++++++++++++++++++++++++--
 drivers/mfd/db8500-prcmu.c    | 76 -------------------------------------------
 2 files changed, 58 insertions(+), 79 deletions(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index d89f3b634f8b..842962be7f9e 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -53,11 +53,66 @@ static unsigned long clk_prcmu_recalc_rate(struct clk_hw *hw,
 	return prcmu_clock_rate(clk->cg_sel);
 }
 
+static const struct {
+	unsigned long db8500_rate;
+	unsigned long db8520_rate;
+	u8 opp;
+} armss_opps[] = {
+	{  199680000,  199680000, ARM_EXTCLK },
+	{  399360000,  399360000, ARM_50_OPP },
+	{  798720000,  798720000, ARM_100_OPP },
+	{  998400000, 1152000000, ARM_MAX_OPP },
+};
+
+static unsigned long clk_prcmu_armss_rate(unsigned int index)
+{
+	const struct prcmu_fw_version *fw = prcmu_get_fw_version();
+
+	if (fw && fw->project == PRCMU_FW_PROJECT_U8520)
+		return armss_opps[index].db8520_rate;
+
+	return armss_opps[index].db8500_rate;
+}
+
+static unsigned long clk_prcmu_round_armss_rate(unsigned long rate)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(armss_opps) - 1; i++)
+		if (rate <= clk_prcmu_armss_rate(i))
+			break;
+
+	return clk_prcmu_armss_rate(i);
+}
+
+static int clk_prcmu_set_armss_rate(unsigned long rate)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(armss_opps); i++)
+		if (rate == clk_prcmu_armss_rate(i))
+			return db8500_prcmu_set_arm_opp(armss_opps[i].opp);
+
+	return -EINVAL;
+}
+
+static int clk_prcmu_set_clock_rate(u8 clock, unsigned long rate)
+{
+	if (clock == PRCMU_ARMSS)
+		return clk_prcmu_set_armss_rate(rate);
+
+	return prcmu_set_clock_rate(clock, rate);
+}
+
 static int clk_prcmu_determine_rate(struct clk_hw *hw,
 				    struct clk_rate_request *req)
 {
 	struct clk_prcmu *clk = to_clk_prcmu(hw);
-	req->rate = prcmu_round_clock_rate(clk->cg_sel, req->rate);
+
+	if (clk->cg_sel == PRCMU_ARMSS)
+		req->rate = clk_prcmu_round_armss_rate(req->rate);
+	else
+		req->rate = prcmu_round_clock_rate(clk->cg_sel, req->rate);
 
 	return 0;
 }
@@ -66,7 +121,7 @@ static int clk_prcmu_set_rate(struct clk_hw *hw, unsigned long rate,
 			      unsigned long parent_rate)
 {
 	struct clk_prcmu *clk = to_clk_prcmu(hw);
-	return prcmu_set_clock_rate(clk->cg_sel, rate);
+	return clk_prcmu_set_clock_rate(clk->cg_sel, rate);
 }
 
 static int clk_prcmu_opp_prepare(struct clk_hw *hw)
@@ -217,7 +272,7 @@ static struct clk_hw *clk_reg_prcmu(const char *name,
 	clk->opp_requested = 0;
 	/* "rate" can be used for changing the initial frequency */
 	if (rate)
-		prcmu_set_clock_rate(cg_sel, rate);
+		clk_prcmu_set_clock_rate(cg_sel, rate);
 
 	clk_prcmu_init.name = name;
 	clk_prcmu_init.ops = clk_prcmu_ops;
diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index f85901f47a97..befc8d4ab922 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -1618,47 +1618,6 @@ static long round_clock_rate(u8 clock, unsigned long rate)
 	return rounded_rate;
 }
 
-static const unsigned long db8500_armss_freqs[] = {
-	199680000,
-	399360000,
-	798720000,
-	998400000
-};
-
-/* The DB8520 has slightly higher ARMSS max frequency */
-static const unsigned long db8520_armss_freqs[] = {
-	199680000,
-	399360000,
-	798720000,
-	1152000000
-};
-
-static long round_armss_rate(unsigned long rate)
-{
-	unsigned long freq = 0;
-	const unsigned long *freqs;
-	int nfreqs;
-	int i;
-
-	if (fw_info.version.project == PRCMU_FW_PROJECT_U8520) {
-		freqs = db8520_armss_freqs;
-		nfreqs = ARRAY_SIZE(db8520_armss_freqs);
-	} else {
-		freqs = db8500_armss_freqs;
-		nfreqs = ARRAY_SIZE(db8500_armss_freqs);
-	}
-
-	/* Find the corresponding arm opp from the cpufreq table. */
-	for (i = 0; i < nfreqs; i++) {
-		freq = freqs[i];
-		if (rate <= freq)
-			break;
-	}
-
-	/* Return the last valid value, even if a match was not found. */
-	return freq;
-}
-
 #define MIN_PLL_VCO_RATE 600000000ULL
 #define MAX_PLL_VCO_RATE 1680640000ULL
 
@@ -1730,8 +1689,6 @@ long prcmu_round_clock_rate(u8 clock, unsigned long rate)
 {
 	if (clock < PRCMU_NUM_REG_CLOCKS)
 		return round_clock_rate(clock, rate);
-	else if (clock == PRCMU_ARMSS)
-		return round_armss_rate(rate);
 	else if (clock == PRCMU_PLLDSI)
 		return round_plldsi_rate(rate);
 	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
@@ -1791,37 +1748,6 @@ static void set_clock_rate(u8 clock, unsigned long rate)
 	spin_unlock_irqrestore(&clk_mgt_lock, flags);
 }
 
-static int set_armss_rate(unsigned long rate)
-{
-	unsigned long freq;
-	u8 opps[] = { ARM_EXTCLK, ARM_50_OPP, ARM_100_OPP, ARM_MAX_OPP };
-	const unsigned long *freqs;
-	int nfreqs;
-	int i;
-
-	if (fw_info.version.project == PRCMU_FW_PROJECT_U8520) {
-		freqs = db8520_armss_freqs;
-		nfreqs = ARRAY_SIZE(db8520_armss_freqs);
-	} else {
-		freqs = db8500_armss_freqs;
-		nfreqs = ARRAY_SIZE(db8500_armss_freqs);
-	}
-
-	/* Find the corresponding arm opp from the cpufreq table. */
-	for (i = 0; i < nfreqs; i++) {
-		freq = freqs[i];
-		if (rate == freq)
-			break;
-	}
-
-	if (rate != freq)
-		return -EINVAL;
-
-	/* Set the new arm opp. */
-	pr_debug("SET ARM OPP 0x%02x\n", opps[i]);
-	return db8500_prcmu_set_arm_opp(opps[i]);
-}
-
 static int set_plldsi_rate(unsigned long rate)
 {
 	unsigned long src_rate;
@@ -1902,8 +1828,6 @@ int prcmu_set_clock_rate(u8 clock, unsigned long rate)
 {
 	if (clock < PRCMU_NUM_REG_CLOCKS)
 		set_clock_rate(clock, rate);
-	else if (clock == PRCMU_ARMSS)
-		return set_armss_rate(rate);
 	else if (clock == PRCMU_PLLDSI)
 		return set_plldsi_rate(rate);
 	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))

-- 
2.56.1

