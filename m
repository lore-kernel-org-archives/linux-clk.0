Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411CB3A4505;
	Wed, 10 Jun 2026 08:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078970; cv=none; b=R7CokZ9nUA2k+ka6kp90+xXZa+momj5YF1B2ygjb83xK8WIP6NOSnuc5HqLp1bri5F5btT/yJfeeBZSyngx5s9FftoZR3yxmkFl308/HpMIdde1Gtm5wUtL3dUNfICufbqoUyb7e6MtjBIN9em3/YbhAxAqCSCRQqT3nnn9iAOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078970; c=relaxed/simple;
	bh=sbUyhQr+P1YJVAY7MErAnwiFe94APxOChN2hs9R6GFw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mpn4T9hkXLR7uAl4cecAxfY3GkTC61S3spQfXGScXZKXYdYyh1Z6cFjD8j6XzhPZ5AtEeiCho9gWUp4zRalwqaSUOEDRunxpigA81zf/xJSIsJVlzrvx+oxe1foWZDou/lVSNbT7xIKojMc84UMx7L4HH26922E5WdoLRZr2TcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=szgloR3l; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="szgloR3l"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65A88RTI0983541, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781078907; bh=2Bx3Io2lY4+fdxUskJKZXQsOjm1iLqprbw2Nee2q4nw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=szgloR3lwlGX/BbhmgnFnqghJWGav1ga6bOhiYrJQ7jTGhxI1fdo5km1tGqcDpGnR
	 c0oGNEdRcigRo/jNSKnsmAd2LTdhr+DEcvt+nQeccMYjp8GAfJg12BgJiPljYxj1uH
	 cNMrlr04iK4qLcciP/hUsZSGSTt93civEFyQ3XgPmgSvXVT6fdjP0FI1K8vpe6lvrE
	 pzz/vwH6vZkohI4Lzjq9baydXCe7TzQ2Z6F20bg1jxnBc+gzyZTk2sO4tutoTA2ES4
	 DyuAWOhTV2iBParJq36NSCq4wASpd/jofnlraA1n40VAzmPfHLp7WIWwi9eOLgpwRQ
	 mvW73ez4csR3g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65A88RTI0983541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jun 2026 16:08:27 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Jun 2026 16:08:26 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Jun 2026 16:08:26 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <bmasney@redhat.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v8 04/10] clk: realtek: Add support for phase locked loops (PLLs)
Date: Wed, 10 Jun 2026 16:08:18 +0800
Message-ID: <20260610080824.255063-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610080824.255063-1-eleanor.lin@realtek.com>
References: <20260610080824.255063-1-eleanor.lin@realtek.com>
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

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v8:
- Reduce the timeout value in regmap_read_poll_timeout_atomic() from 2000ms to
500ms to avoid prolonged busy-waiting and prevent triggering the NMI Watchdog.
- Remove 'freq_ready_valid' and add comments to clarify that register offset 0
is never a valid address on Realtek SoCs, meaning it is not configured.
- Add the missing spin_unlock_irqrestore() when regmap_read() fails.
---
 drivers/clk/realtek/Makefile     |   2 +
 drivers/clk/realtek/clk-pll.c    | 209 +++++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-pll.h    |  47 +++++++
 drivers/clk/realtek/freq_table.c |  38 ++++++
 drivers/clk/realtek/freq_table.h |  16 +++
 5 files changed, 312 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-pll.c
 create mode 100644 drivers/clk/realtek/clk-pll.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 377ec776ee47..a89ad77993e9 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -2,3 +2,5 @@
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += common.o
+clk-rtk-y += clk-pll.o
+clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
new file mode 100644
index 000000000000..6c4343d71dbe
--- /dev/null
+++ b/drivers/clk/realtek/clk-pll.c
@@ -0,0 +1,209 @@
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
+static inline struct clk_pll *to_clk_pll(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+
+	return container_of(clkr, struct clk_pll, clkr);
+}
+
+static int wait_freq_ready(struct clk_pll *clkp)
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
+static bool is_power_on(struct clk_pll *clkp)
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
+		return true;
+
+	return (val & clkp->power_mask) == clkp->power_val_on;
+}
+
+static void clk_pll_disable(struct clk_hw *hw)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
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
+static int clk_pll_is_enabled(struct clk_hw *hw)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
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
+static int clk_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
+	const struct freq_table *ftblv = NULL;
+
+	ftblv = ftbl_find_by_rate(clkp->freq_tbl, req->rate);
+	if (!ftblv)
+		return -EINVAL;
+
+	req->rate = ftblv->rate;
+
+	return 0;
+}
+
+static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
+	const struct freq_table *fv;
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
+static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
+	const struct freq_table *fv;
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
+static int clk_pll_enable(struct clk_hw *hw)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
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
+	.enable         = clk_pll_enable,
+	.disable        = clk_pll_disable,
+	.is_enabled     = clk_pll_is_enabled,
+	.recalc_rate    = clk_pll_recalc_rate,
+	.determine_rate = clk_pll_determine_rate,
+	.set_rate       = clk_pll_set_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ops, "REALTEK_CLK");
+
+const struct clk_ops rtk_clk_pll_ro_ops = {
+	.recalc_rate = clk_pll_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ro_ops, "REALTEK_CLK");
diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
new file mode 100644
index 000000000000..59abfa9a6122
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
+#include "common.h"
+#include "freq_table.h"
+
+struct reg_sequence;
+
+struct clk_pll {
+	struct clk_regmap clkr;
+	const struct reg_sequence *seq_power_on;
+	u32 num_seq_power_on;
+	const struct reg_sequence *seq_power_off;
+	u32 num_seq_power_off;
+	const struct reg_sequence *seq_pre_set_freq;
+	u32 num_seq_pre_set_freq;
+	const struct reg_sequence *seq_post_set_freq;
+	u32 num_seq_post_set_freq;
+	const struct freq_table *freq_tbl;
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
+#define __clk_pll_hw(_ptr)  __clk_regmap_hw(&(_ptr)->clkr)
+
+extern const struct clk_ops rtk_clk_pll_ops;
+extern const struct clk_ops rtk_clk_pll_ro_ops;
+
+#endif /* __CLK_REALTEK_CLK_PLL_H */
diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_table.c
new file mode 100644
index 000000000000..0ff1e5e79102
--- /dev/null
+++ b/drivers/clk/realtek/freq_table.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitops.h>
+#include "freq_table.h"
+
+#define IS_FREQ_TABLE_END(_f) ((_f)->rate == 0)
+
+const struct freq_table *ftbl_find_by_rate(const struct freq_table *ftbl,
+					   unsigned long rate)
+{
+	const struct freq_table *best = NULL;
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
+const struct freq_table *
+ftbl_find_by_val_with_mask(const struct freq_table *ftbl, u32 mask, u32 value)
+{
+	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
+		if ((ftbl->val & mask) == (value & mask))
+			return ftbl;
+	}
+	return NULL;
+};
diff --git a/drivers/clk/realtek/freq_table.h b/drivers/clk/realtek/freq_table.h
new file mode 100644
index 000000000000..16bf7e3fd489
--- /dev/null
+++ b/drivers/clk/realtek/freq_table.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+struct freq_table {
+	u32 val;
+	unsigned long rate;
+};
+
+#define FREQ_TABLE_END    \
+	{                 \
+		.rate = 0 \
+	}
+
+const struct freq_table *ftbl_find_by_rate(const struct freq_table *ftbl,
+					   unsigned long rate);
+const struct freq_table *
+ftbl_find_by_val_with_mask(const struct freq_table *ftbl, u32 mask, u32 value);
-- 
2.43.0

