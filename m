Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461197;
	b=5L//iKG8SJ3noEWmDKgWEfw9ZoDw1SFaidfiN837qPRU4NuLgDSdVEr8as525cK/MdO8
	 I0nCk6rE1f9yb6TutVy0bIzhNshuH50ok8IkMVSPL8Gr9UcgwRk0Om++UhYCxoLib+nsz
	 UUzoYncd2kp4qLtn4MJyY6lCqdlu9JCKbwZZIvaK1MVMk9h4ksXvY+kTRNZqZyBWEOID/
	 sPcDkz6CMb+3Ijtz7FP257TWIwu4RkpCTwJFlRZRqOiDSpwcNeGODWTY5dpm2ahBf3fDw
	 bsUOrBR0eIde3jMSkH9IGWoASj6xkqHUhm8zUKUHVTlIHVsYUm99KBDLpMro415TIwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461197;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=8kwBotODzMSYfdscIp2QveyNCjYFwzaukreF66iIfeE=;
	b=mhn8H2KBaRM7q9g7WbRE+cg0560hMl+N5HG5luedjSz3JA8nnK08M8rzJ4dZJMTHX0o2
	 vgFftGEofS/UIVN+T0uUJl9GhYCDkHOM/wTbUJtmW/N3ld159xuFscrf1J2YWUZgYq/+7
	 /xMmuBoegsw9sYBHWGsZ2cTi8MrIyF2E+5vvlyQb8Ez56NkidoUgvK6OMwjaEPxHEkF0c
	 jVxidK/OVJTEHmLWyqelD/DXrREcKQGRirbi+nSv47vSBdYnFWaxQWx+wydJwhR8NeQID
	 pVHTOuPnS3cmQe002i04nBTA3btFVhqyZlRS7Lw4ljkiEd4kkYocEm83WHqFz/4ypBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=kaesRnjC;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AD9606A89F;
	Thu, 12 Nov 2026 05:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21AD9606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=kaesRnjC
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5Pkz863459336, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461146; bh=8kwBotODzMSYfdscIp2QveyNCjYFwzaukreF66iIfeE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=kaesRnjCtVfeysVuReBW2FiWBQwltCT7yxnk1dQUPFdQbdfztgoT8Fdwv9Im0AWtl
	 0qK5aaEaoUiYgum/vg6Dy616o+hFblgQi9OUzDqWeEDgWgvsb7kcuYz/v1yyhQYRNq
	 vAIyIobs20Cr1bxreE8JM9RerwFv8b5GDXoz/CgqwtTpQhpzv6BKjTKoPPncfWIZUt
	 YV+P/iFy/C3knGIwFBX157iA5GZorW8LloMMXVgaf0zVu1vUkE58/hSkMiRzkhCY+I
	 X147BGsB2fVG7XQdEjNLoYf8c4nJO4rS0xVlLCDSAYwPuwLZS5+L55nNMkAMs+3z7J
	 mkYN8OdW9EMBA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5Pkz863459336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:25:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:25:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 3/9] clk: realtek: Add support for phase locked loops (PLLs)
Date: Thu, 12 Nov 2026 13:25:38 +0800
Message-ID: <20261112052544.555563-4-eleanor.lin@realtek.com>
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

Provide a full set of PLL operations for programmable PLLs and a read-only
variant for fixed or hardware-managed PLLs.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v16:
- Remove Brian's reviewed-by tag.
-  Introduce 'expected_parent_rate' validation in '.determine_rate()' and
'.set_rate()' to safely enforce the fixed input rate requirement.
- In determined_rate, replacing the floor/ceil algorithm with a closest-match
search within [min_rate, max_rate] boundaries.
- Improve comments for spinlock. 
- Add '.is_enabled' callback to 'rtk_clk_pll_ro_ops'
---
 drivers/clk/realtek/Makefile         |   2 +
 drivers/clk/realtek/clk-regmap-pll.c | 219 +++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-pll.h |  53 +++++++
 drivers/clk/realtek/freq_table.c     |  62 ++++++++
 drivers/clk/realtek/freq_table.h     |  24 +++
 5 files changed, 360 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-pll.c
 create mode 100644 drivers/clk/realtek/clk-regmap-pll.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 13000ed4ba11..6fbe6e07b760 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -2,3 +2,5 @@
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += clk-rtk-common.o
+clk-rtk-y += clk-regmap-pll.o
+clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-pll.c b/drivers/clk/realtek/clk-regmap-pll.c
new file mode 100644
index 000000000000..e43e78a36647
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-pll.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/export.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include "clk-regmap-pll.h"
+
+#define TIMEOUT 500
+
+static inline struct rtk_clk_regmap_pll *to_rtk_clk_regmap_pll(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_regmap_pll, clkr);
+}
+
+static int wait_freq_ready(struct rtk_clk_regmap_pll *clkp)
+{
+	u32 pollval;
+
+	/*
+	 * Optional register: return success if not provided.
+	 */
+	if (!clkp->freq_ready_reg)
+		return 0;
+
+	return regmap_read_poll_timeout_atomic(clkp->clkr.regmap, clkp->freq_ready_reg, pollval,
+		(pollval & clkp->freq_ready_mask) == clkp->freq_ready_val, 1, TIMEOUT);
+}
+
+static bool is_power_on(struct rtk_clk_regmap_pll *clkp)
+{
+	u32 val;
+
+	/*
+	 * If the PLL does not provide a power register, it is considered
+	 * to be always powered.
+	 */
+	if (!clkp->power_reg)
+		return true;
+
+	if (regmap_read(clkp->clkr.regmap, clkp->power_reg, &val))
+		return false;
+
+	return (val & clkp->power_mask) == clkp->power_val_on;
+}
+
+static void rtk_clk_regmap_pll_disable(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+	unsigned long flags;
+
+	if (!clkp->seq_power_off)
+		return;
+
+	spin_lock_irqsave(&clkp->lock, flags);
+
+	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
+			       clkp->num_seq_power_off);
+
+	spin_unlock_irqrestore(&clkp->lock, flags);
+}
+
+static int rtk_clk_regmap_pll_is_enabled(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&clkp->lock, flags);
+
+	ret = is_power_on(clkp);
+
+	spin_unlock_irqrestore(&clkp->lock, flags);
+
+	return ret;
+}
+
+static int rtk_clk_regmap_pll_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+	const struct rtk_freq_table *ftblv = NULL;
+
+	if (clkp->expected_parent_rate &&
+	    req->best_parent_rate != clkp->expected_parent_rate)
+		return -EINVAL;
+
+	ftblv = ftbl_find_closest_by_rate(clkp->freq_tbl, req->rate,
+					  req->min_rate, req->max_rate);
+	if (!ftblv)
+		return -EINVAL;
+
+	req->rate = ftblv->rate;
+
+	return 0;
+}
+
+static unsigned long rtk_clk_regmap_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+	const struct rtk_freq_table *fv;
+	unsigned long flags;
+	u32 freq_val;
+
+	spin_lock_irqsave(&clkp->lock, flags);
+
+	if (regmap_read(clkp->clkr.regmap, clkp->freq_reg, &freq_val)) {
+		spin_unlock_irqrestore(&clkp->lock, flags);
+		return 0;
+	}
+
+	freq_val &= clkp->freq_mask;
+
+	fv = ftbl_find_by_val_with_mask(clkp->freq_tbl, clkp->freq_mask,
+					freq_val);
+
+	spin_unlock_irqrestore(&clkp->lock, flags);
+
+	return fv ? fv->rate : 0;
+}
+
+static int rtk_clk_regmap_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+	const struct rtk_freq_table *fv;
+	unsigned long flags;
+	int ret;
+
+	if (clkp->expected_parent_rate && parent_rate != clkp->expected_parent_rate)
+		return -EINVAL;
+
+	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
+	if (!fv || fv->rate != rate)
+		return -EINVAL;
+
+	spin_lock_irqsave(&clkp->lock, flags);
+
+	if (clkp->seq_pre_set_freq) {
+		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
+					     clkp->num_seq_pre_set_freq);
+		if (ret)
+			goto unlock;
+	}
+
+	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
+				 clkp->freq_mask, fv->val);
+	if (ret)
+		goto unlock;
+
+	if (clkp->seq_post_set_freq) {
+		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
+					     clkp->num_seq_post_set_freq);
+		if (ret)
+			goto unlock;
+	}
+
+	if (is_power_on(clkp)) {
+		ret = wait_freq_ready(clkp);
+		if (ret)
+			goto unlock;
+	}
+
+unlock:
+	spin_unlock_irqrestore(&clkp->lock, flags);
+
+	return ret;
+}
+
+static int rtk_clk_regmap_pll_enable(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+	unsigned long flags;
+	int ret = 0;
+
+	if (!clkp->seq_power_on)
+		return ret;
+
+	spin_lock_irqsave(&clkp->lock, flags);
+
+	if (is_power_on(clkp))
+		goto unlock;
+
+	ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
+				     clkp->num_seq_power_on);
+	if (ret)
+		goto unlock;
+
+	ret = wait_freq_ready(clkp);
+	if (ret)
+		goto unlock;
+
+unlock:
+	spin_unlock_irqrestore(&clkp->lock, flags);
+
+	return ret;
+}
+
+const struct clk_ops rtk_clk_pll_ops = {
+	.enable         = rtk_clk_regmap_pll_enable,
+	.disable        = rtk_clk_regmap_pll_disable,
+	.is_enabled     = rtk_clk_regmap_pll_is_enabled,
+	.recalc_rate    = rtk_clk_regmap_pll_recalc_rate,
+	.determine_rate = rtk_clk_regmap_pll_determine_rate,
+	.set_rate       = rtk_clk_regmap_pll_set_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ops, "CLK_REALTEK");
+
+const struct clk_ops rtk_clk_pll_ro_ops = {
+	.is_enabled     = rtk_clk_regmap_pll_is_enabled,
+	.recalc_rate = rtk_clk_regmap_pll_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ro_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-regmap-pll.h b/drivers/clk/realtek/clk-regmap-pll.h
new file mode 100644
index 000000000000..f6fac6b4ac90
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-pll.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_PLL_H
+#define __CLK_REALTEK_CLK_PLL_H
+
+#include <linux/spinlock.h>
+#include "clk-rtk-common.h"
+#include "freq_table.h"
+
+struct reg_sequence;
+
+struct rtk_clk_regmap_pll {
+	struct rtk_clk_regmap clkr;
+	const struct reg_sequence *seq_power_on;
+	u32 num_seq_power_on;
+	const struct reg_sequence *seq_power_off;
+	u32 num_seq_power_off;
+	const struct reg_sequence *seq_pre_set_freq;
+	u32 num_seq_pre_set_freq;
+	const struct reg_sequence *seq_post_set_freq;
+	u32 num_seq_post_set_freq;
+	const struct rtk_freq_table *freq_tbl;
+	u32 freq_reg;
+	u32 freq_mask;
+	u32 freq_ready_mask;
+	u32 freq_ready_reg;
+	u32 freq_ready_val;
+	u32 power_reg;
+	u32 power_mask;
+	u32 power_val_on;
+
+	/* Expected input rate for the preset frequency table; zero disables check. */
+	unsigned long expected_parent_rate;
+
+	/*
+	 * Serialize the multi-step register sequences in .set_rate() against
+	 * .enable()/.disable(). CCF protects them with different locks
+	 * (prepare_lock vs. enable_lock), and regmap only guarantees atomicity of
+	 * individual register accesses.
+	 */
+	spinlock_t lock;
+};
+
+#define __rtk_clk_regmap_pll_hw(_ptr)  __rtk_clk_regmap_hw(&(_ptr)->clkr)
+
+extern const struct clk_ops rtk_clk_pll_ops;
+extern const struct clk_ops rtk_clk_pll_ro_ops;
+
+#endif /* __CLK_REALTEK_CLK_PLL_H */
diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_table.c
new file mode 100644
index 000000000000..0f977a3fc902
--- /dev/null
+++ b/drivers/clk/realtek/freq_table.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/types.h>
+#include "freq_table.h"
+
+#define IS_FREQ_TABLE_END(_f) ((_f)->rate == 0)
+
+const struct rtk_freq_table *ftbl_find_closest_by_rate(const struct rtk_freq_table *ftbl,
+						       unsigned long rate,
+						       unsigned long min_rate,
+						       unsigned long max_rate)
+{
+	const struct rtk_freq_table *best = NULL;
+	unsigned long best_delta = ULONG_MAX;
+
+	for ( ; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
+		unsigned long delta;
+
+		if (ftbl->rate < min_rate || ftbl->rate > max_rate)
+			continue;
+
+		delta = ftbl->rate >= rate ? ftbl->rate - rate : rate - ftbl->rate;
+		if (delta < best_delta) {
+			best_delta = delta;
+			best = ftbl;
+		}
+	}
+
+	return best;
+}
+
+const struct rtk_freq_table *ftbl_find_by_rate(const struct rtk_freq_table *ftbl,
+					       unsigned long rate)
+{
+	const struct rtk_freq_table *best = NULL;
+	unsigned long best_rate = 0;
+
+	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
+		if (ftbl->rate == rate)
+			return ftbl;
+
+		if (ftbl->rate > rate)
+			continue;
+
+		if (ftbl->rate > best_rate) {
+			best_rate = ftbl->rate;
+			best = ftbl;
+		}
+	}
+
+	return best;
+}
+
+const struct rtk_freq_table *ftbl_find_by_val_with_mask(const struct rtk_freq_table *ftbl,
+							u32 mask, u32 value)
+{
+	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
+		if ((ftbl->val & mask) == (value & mask))
+			return ftbl;
+	}
+	return NULL;
+}
diff --git a/drivers/clk/realtek/freq_table.h b/drivers/clk/realtek/freq_table.h
new file mode 100644
index 000000000000..801f4882a891
--- /dev/null
+++ b/drivers/clk/realtek/freq_table.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __CLK_REALTEK_FREQ_TABLE_H
+#define __CLK_REALTEK_FREQ_TABLE_H
+
+struct rtk_freq_table {
+	u32 val;
+	unsigned long rate;
+};
+
+#define FREQ_TABLE_END    \
+	{                 \
+		.rate = 0 \
+	}
+
+const struct rtk_freq_table *ftbl_find_closest_by_rate(const struct rtk_freq_table *ftbl,
+						       unsigned long rate,
+						       unsigned long min_rate,
+						       unsigned long max_rate);
+const struct rtk_freq_table *ftbl_find_by_rate(const struct rtk_freq_table *ftbl,
+					       unsigned long rate);
+const struct rtk_freq_table *
+ftbl_find_by_val_with_mask(const struct rtk_freq_table *ftbl, u32 mask, u32 value);
+
+#endif /* __CLK_REALTEK_FREQ_TABLE_H */
-- 
2.43.0

