Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77899377A87;
	Wed, 12 Aug 2026 02:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500048; cv=none; b=RMQhlJzd0UpAgnDrU+22cmvJ/2d7EbdhN1fgjL+K7clBFSnsH6mBRLQ6gMZzkaG1p90hRd3Q5bNTP3jn0eF6ht+PySf9K9wP0I46YNbEIBS9QVhTcDJGmJkylTKJ9BUbV5XdxsVHEMrglwIBpX+3zf+DmsHMfebSeVdgx6NRsc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500048; c=relaxed/simple;
	bh=Qd6zUM+ARtZXXEYRm80LVzertq+5ojFZBCXltksDwww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIb5o8Y8H6qxTZGLrInyo3YHFiP7ffrj0Pb27y7JWxfk/LcQDAmxeEvSvaHhPJSmNFkZxqRqu1426saMneTWpl40enqg/KW4LFQ3Ck+/DLsiHviJlWtgrOYJOxx+5hlJUiaWHtU2GHPAZNzwjf5WmSXiGCBCmtuoIwQGIazXDyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=AxCumXuh; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="AxCumXuh"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C20FD803195368, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786500015; bh=ntgBXHzG2Lfm7hiciifS89/TqvKplxDrQF/8Lw6NVww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=AxCumXuhcRQ6Nn/ucpExzDJMXfFtZhNpGH7hqCPtK6uWBUQiWwiIqOJZFZfGpFLvG
	 YuHntCaCohw5RyKPNCI1hLDRvJDzthDtqEoBdwK6Bv7jc90NqJMg3Y5OIHxzQ96piv
	 5pPMbJSFxXcto0wtPDUKWqGZbg/OzwSaDP2J2uoFX/KRmaq+bwC27Mh9OavzlC7T1f
	 mvh9TuOHgLaf180xU4WKYGJfQ+PZsq33FZwBRcMICZRkf+ExXR2FjS+95CyX2jjS2C
	 8j7K/trr1q6Wno2hl7AQFixmi8z+zDlfFoP0EioNlbMtu8eRCwx1jJApkJEwvOKn6B
	 AGFHB1UrN0ZdQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C20FD803195368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 10:00:15 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 10:00:15 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 10:00:14 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Wed, 12 Aug 2026 10:00:14 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v13 05/11] clk: realtek: Add support for phase locked loops (PLLs)
Date: Wed, 12 Aug 2026 10:00:03 +0800
Message-ID: <20260812020009.3480538-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812020009.3480538-1-eleanor.lin@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Provide a full set of PLL operations for programmable PLLs and a read-only
variant for fixed or hardware-managed PLLs.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v13:
- None.
---
 drivers/clk/realtek/Makefile     |   2 +
 drivers/clk/realtek/clk-pll.c    | 217 +++++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-pll.h    |  47 +++++++
 drivers/clk/realtek/freq_table.c |  57 ++++++++
 drivers/clk/realtek/freq_table.h |  22 ++++
 5 files changed, 345 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-pll.c
 create mode 100644 drivers/clk/realtek/clk-pll.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 13000ed4ba11..71edc18121c6 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -2,3 +2,5 @@
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += clk-rtk-common.o
+clk-rtk-y += clk-pll.o
+clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
new file mode 100644
index 000000000000..31670b8316cd
--- /dev/null
+++ b/drivers/clk/realtek/clk-pll.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/export.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include "clk-pll.h"
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
+	/* reg == 0 means not configured.
+	 * Register offset 0 is never a valid address on Realtek SoCs.
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
+	/* reg == 0 means not configured (assume always on).
+	 * Register offset 0 is never a valid address on Realtek SoCs.
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
+	ftblv = ftbl_find_by_rate(clkp->freq_tbl, req->rate);
+
+	if (ftblv && ftblv->rate >= req->min_rate) {
+		req->rate = ftblv->rate;
+		return 0;
+	}
+
+	/* floor result is below min_rate; find the smallest rate >= min_rate */
+	ftblv = ftbl_find_ceil_by_rate(clkp->freq_tbl, req->min_rate);
+	if (!ftblv || ftblv->rate > req->max_rate)
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
+	.recalc_rate = rtk_clk_regmap_pll_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ro_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
new file mode 100644
index 000000000000..023b49bbcbee
--- /dev/null
+++ b/drivers/clk/realtek/clk-pll.h
@@ -0,0 +1,47 @@
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
+	/* This lock prevents race conditions when multiple CPUs or contexts
+	 * simultaneously access this PLL's registers during multi-step operations
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
index 000000000000..21cd2a8026c2
--- /dev/null
+++ b/drivers/clk/realtek/freq_table.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitops.h>
+#include "freq_table.h"
+
+#define IS_FREQ_TABLE_END(_f) ((_f)->rate == 0)
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
+const struct rtk_freq_table *ftbl_find_ceil_by_rate(const struct rtk_freq_table *ftbl,
+						    unsigned long rate)
+{
+	const struct rtk_freq_table *best = NULL;
+	unsigned long best_rate = ULONG_MAX;
+
+	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
+		if (ftbl->rate < rate)
+			continue;
+
+		if (ftbl->rate < best_rate) {
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
index 000000000000..2db234b15ca8
--- /dev/null
+++ b/drivers/clk/realtek/freq_table.h
@@ -0,0 +1,22 @@
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
+const struct rtk_freq_table *ftbl_find_by_rate(const struct rtk_freq_table *ftbl,
+					       unsigned long rate);
+const struct rtk_freq_table *ftbl_find_ceil_by_rate(const struct rtk_freq_table *ftbl,
+						    unsigned long rate);
+const struct rtk_freq_table *
+ftbl_find_by_val_with_mask(const struct rtk_freq_table *ftbl, u32 mask, u32 value);
+
+#endif /* __CLK_REALTEK_FREQ_TABLE_H */
-- 
2.43.0

