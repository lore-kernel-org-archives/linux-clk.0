Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBB726E711;
	Mon, 29 Dec 2025 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766994825; cv=none; b=qSRNb5hyD2UICJL0P7InrP7YlqFeOBeOMgQm2jKW3KWwzXN9TCNo3XTnnvznQYWoKp/tWZEQLVnEH4bKtPOfUiljQtMsdkjrMinDe4EJZlbDA0J/RnJBQ689MRQkkjG1nYGSU/w+0VEBHOEcM1L8i7CmRbqCqltQBN8/0OXPtCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766994825; c=relaxed/simple;
	bh=HDI6NJSrgqIgjesnBs6G6OJ4sY+uGzBXN1FEc4ANLT8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EHHkZ/5LvBHiJph8zP2nGdUAYQ5FmUDHT7afItxE1vR9pmGf4fNytdDcOYrqlmkpbJxIBdK5KYymZtEeeO4rqaLsSXvJvYRPiEKrijy2HIVZBfmRczJnNThKxzHrqjKAnjiHrgDISwvlYW67BOYW3fJrrOEUQdjFTxyp1oMdnBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=wCzBp9TK; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="wCzBp9TK"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BT7rFsH5703573, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1766994795; bh=y9vGYphf8GhXVlK3UPlRdLy7yAedTMMCf3w8gaEotNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=wCzBp9TK28GJLA8nzrzQkLTa4XM61V2gh+y6UXPEQDTsCe3FXvRraaSsyhhWDCW8l
	 wbOqZYW+VxmPjNcLIvYWT+Yf78AnJosiiL5YQJ5U7Kp6bz5CdyPaIsN3fhs+81ZHUO
	 AlGXkWKnyuBTEEv3T0Nh6tv9bc1tFHIXj1Kib38S1vzhvlJn+VDTSbUbufoV98xsYR
	 0eizOi7pSmwA6I6ID4GF+q7pWxp0DasHBeiFi/EBKmbypNKuRrIJIh5BhAI0pMueRB
	 0Ywp2OMtbsxaTf5Of0vIrZDXRPzqfzww6OjlpjP2uReUTpLNqYFi6dzYtHYB4gXAgV
	 o7cqeTUiAzmzA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BT7rFsH5703573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 15:53:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 29 Dec 2025 15:53:15 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 29 Dec 2025 15:53:15 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 29 Dec 2025 15:53:14 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH 4/9] clk: realtek: Add support for phase locked loops (PLLs)
Date: Mon, 29 Dec 2025 15:53:08 +0800
Message-ID: <20251229075313.27254-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251229075313.27254-1-eleanor.lin@realtek.com>
References: <20251229075313.27254-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Provide a full set of PLL operations for programmable PLLs and a read-only
variant for fixed or hardware-managed PLLs.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/clk/realtek/Makefile     |   2 +
 drivers/clk/realtek/clk-pll.c    | 191 +++++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-pll.h    |  47 ++++++++
 drivers/clk/realtek/freq_table.c |  35 ++++++
 drivers/clk/realtek/freq_table.h |  23 ++++
 5 files changed, 298 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-pll.c
 create mode 100644 drivers/clk/realtek/clk-pll.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 4041951b7c62..c173ea3b10e3 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -2,4 +2,6 @@
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += common.o
+clk-rtk-y += clk-pll.o
+clk-rtk-y += freq_table.o
 clk-rtk-y += reset.o
diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
new file mode 100644
index 000000000000..6eba30c5f2fa
--- /dev/null
+++ b/drivers/clk/realtek/clk-pll.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include "clk-pll.h"
+
+#define TIMEOUT 2000
+
+static int wait_freq_ready(struct clk_pll *clkp)
+{
+	u32 pollval;
+
+	if (!clkp->freq_ready_valid)
+		return 0;
+
+	return regmap_read_poll_timeout_atomic(clkp->clkr.regmap, clkp->freq_ready_reg, pollval,
+					(pollval & clkp->freq_ready_mask) == clkp->freq_ready_val,
+					0, TIMEOUT);
+}
+
+static bool is_power_on(struct clk_pll *clkp)
+{
+	u32 val;
+	int ret;
+
+	if (!clkp->power_reg)
+		return true;
+
+	ret = regmap_read(clkp->clkr.regmap, clkp->power_reg, &val);
+	if (ret)
+		return true;
+
+	return (val & clkp->power_mask) == clkp->power_val_on;
+}
+
+static int get_freq_val_raw(struct clk_pll *clkp, u32 *val)
+{
+	int ret;
+
+	ret = regmap_read(clkp->clkr.regmap, clkp->freq_reg, val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int get_freq_val(struct clk_pll *clkp, u32 *val)
+{
+	int ret;
+	u32 raw_val;
+
+	ret = get_freq_val_raw(clkp, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = raw_val & clkp->freq_mask;
+	return 0;
+}
+
+static void clk_pll_disable(struct clk_hw *hw)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
+
+	if (!clkp->seq_power_off)
+		return;
+
+	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
+			       clkp->num_seq_power_off);
+}
+
+static void clk_pll_disable_unused(struct clk_hw *hw)
+{
+	clk_pll_disable(hw);
+}
+
+static int clk_pll_is_enabled(struct clk_hw *hw)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
+
+	return is_power_on(clkp);
+}
+
+static int clk_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
+	const struct freq_table *ftblv = NULL;
+
+	ftblv = ftbl_find_by_rate(clkp->freq_tbl, req->rate);
+	return ftblv ? ftblv->rate : 0;
+}
+
+static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
+	const struct freq_table *fv;
+	u32 freq_val;
+	int ret;
+
+	ret = get_freq_val(clkp, &freq_val);
+	if (ret)
+		return 0;
+
+	fv = ftbl_find_by_val_with_mask(clkp->freq_tbl, clkp->freq_mask,
+					freq_val);
+	return fv ? fv->rate : 0;
+}
+
+static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
+	const struct freq_table *fv;
+	u32 freq_val;
+	int ret;
+
+	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
+	if (!fv || fv->rate != rate)
+		return -EINVAL;
+
+	ret = get_freq_val_raw(clkp, &freq_val);
+	if (ret)
+		return ret;
+
+	freq_val &= ~clkp->freq_mask;
+	freq_val |= (fv->val & clkp->freq_mask);
+
+	if (clkp->seq_pre_set_freq) {
+		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
+					     clkp->num_seq_pre_set_freq);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_write(clkp->clkr.regmap, clkp->freq_reg, freq_val);
+	if (ret)
+		return ret;
+
+	if (clkp->seq_post_set_freq) {
+		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
+					     clkp->num_seq_post_set_freq);
+		if (ret)
+			return ret;
+	}
+
+	if (is_power_on(clkp)) {
+		ret = wait_freq_ready(clkp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int clk_pll_enable(struct clk_hw *hw)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
+	int ret;
+
+	if (!clkp->seq_power_on)
+		return 0;
+
+	if (is_power_on(clkp))
+		return 0;
+
+	ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
+				     clkp->num_seq_power_on);
+	if (ret)
+		return ret;
+
+	return wait_freq_ready(clkp);
+}
+
+const struct clk_ops clk_pll_ops = {
+	.enable         = clk_pll_enable,
+	.disable        = clk_pll_disable,
+	.is_enabled     = clk_pll_is_enabled,
+	.disable_unused = clk_pll_disable_unused,
+	.recalc_rate    = clk_pll_recalc_rate,
+	.determine_rate = clk_pll_determine_rate,
+	.set_rate       = clk_pll_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_pll_ops);
+
+const struct clk_ops clk_pll_ro_ops = {
+	.recalc_rate = clk_pll_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_pll_ro_ops);
diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
new file mode 100644
index 000000000000..c3e2e5ca641f
--- /dev/null
+++ b/drivers/clk/realtek/clk-pll.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2019 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_PLL_H
+#define __CLK_REALTEK_CLK_PLL_H
+
+#include "common.h"
+#include "freq_table.h"
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
+	u32 freq_ready_valid;
+	u32 freq_ready_mask;
+	u32 freq_ready_reg;
+	u32 freq_ready_val;
+	u32 power_reg;
+	u32 power_mask;
+	u32 power_val_on;
+};
+
+#define __clk_pll_hw(_ptr)  __clk_regmap_hw(&(_ptr)->clkr)
+
+static inline struct clk_pll *to_clk_pll(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+
+	return container_of(clkr, struct clk_pll, clkr);
+}
+
+extern const struct clk_ops clk_pll_ops;
+extern const struct clk_ops clk_pll_ro_ops;
+
+#endif /* __CLK_REALTEK_CLK_PLL_H */
diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_table.c
new file mode 100644
index 000000000000..26a0d2d3e851
--- /dev/null
+++ b/drivers/clk/realtek/freq_table.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "freq_table.h"
+
+const struct freq_table *ftbl_find_by_rate(const struct freq_table *ftbl,
+					   unsigned long rate)
+{
+	unsigned long best_rate = 0;
+	const struct freq_table *best = NULL;
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
index 000000000000..66a0b0610e38
--- /dev/null
+++ b/drivers/clk/realtek/freq_table.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/bitops.h>
+
+struct freq_table {
+	u32 val;
+	unsigned long rate;
+};
+
+/* ofs check */
+#define CLK_OFS_INVALID (-1)
+#define CLK_OFS_IS_VALID(_ofs) ((_ofs) != CLK_OFS_INVALID)
+
+#define FREQ_TABLE_END    \
+	{                 \
+		.rate = 0 \
+	}
+#define IS_FREQ_TABLE_END(_f) ((_f)->rate == 0)
+
+const struct freq_table *ftbl_find_by_rate(const struct freq_table *ftbl,
+					   unsigned long rate);
+const struct freq_table *
+ftbl_find_by_val_with_mask(const struct freq_table *ftbl, u32 mask, u32 value);
-- 
2.34.1

