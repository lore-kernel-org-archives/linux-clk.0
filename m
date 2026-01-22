Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E087357708;
	Thu, 22 Jan 2026 11:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080159; cv=none; b=gcYuYMQ6OJ4RSskLLPWKda3HB06AV6sW+CeHkOHxWYD+jKwujb8igO0U6Okw5wUk8Jz8v0Kqg/j26uCHy3PTvxK3glYteXHTaUycm4upwSdRnSWC3voQX32NVZ3YbK4dRfIZU0hlfaV7BntOgLwXLanqEO+Di5oWb7ij1MgekcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080159; c=relaxed/simple;
	bh=aAbgNN9SALEn2fChz6CqjV7dqN0AhIzrgqG1Pnp13Uk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YEjwC85MTfCD1pJt3WEYm+b+U0pHlhSDgByskKn2jCnQKQxKF6voVgXZ8bFQcWaFl5z3s1bYeS7UMOLpa2C5invxtzJBuAiCTRZfLidQM3cdFheORNZGneyO9LAQ3tV02Q8DUS5S+xMw1IkiLuqd1pPBpnKg807CUO1tO3zwMQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=eJ4IgP3f; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="eJ4IgP3f"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60MB8wqaE913374, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1769080138; bh=KTKcIZIOss9PaQowWpp2+g7OLWhLwICORzy4CB8Grqk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=eJ4IgP3frV/NdiWhbhYlYYVRWti9e8WcMWhOlbWZ8XgQA2i4oaUtWeo8UPduVNZ5N
	 N+RIGrOObAmPf1IScclC5u8CDYWL/nVnM0Fhvr1jZTIeaZ/xFC2IpgrQnf5+ZVRajj
	 3fMSpr5nobQpjtlOKJ+qIXCWNDkBUnRwM4shStK9O8CVxHf5foSl/AodXWSer4/RCD
	 ZvmxvWYRgW/iAdHbrixCCt9TeoaCghcLywiH2zPMMqTNIPBYLcl6VRhXbXf9XtY/tY
	 pUL83o3Dl/gCkZ4STixjRYFa/XHc2by+gEYFFvdppkm2HAfqJdrf4AmCnuqtNS8QHv
	 AJGCEu8K2Rxdg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60MB8wqaE913374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 19:08:58 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 22 Jan 2026 19:08:58 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 Jan 2026 19:08:58 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v3 4/9] clk: realtek: Add support for phase locked loops (PLLs)
Date: Thu, 22 Jan 2026 19:08:52 +0800
Message-ID: <20260122110857.12995-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260122110857.12995-1-eleanor.lin@realtek.com>
References: <20260122110857.12995-1-eleanor.lin@realtek.com>
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
Changes in v3:
- Removed redundant functions.
- Replaced Read-Modify-Write operations in clk_pll_set_rate with
regmap_update_bits()
- Added prefix "rtk_" in operation names to avoid duplicate symbol problem.
---
 drivers/clk/realtek/Makefile     |   2 +
 drivers/clk/realtek/clk-pll.c    | 156 +++++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-pll.h    |  47 ++++++++++
 drivers/clk/realtek/freq_table.c |  35 +++++++
 drivers/clk/realtek/freq_table.h |  23 +++++
 5 files changed, 263 insertions(+)
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
index 000000000000..6bb9084956b8
--- /dev/null
+++ b/drivers/clk/realtek/clk-pll.c
@@ -0,0 +1,156 @@
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
+						(pollval & clkp->freq_ready_mask)
+						== clkp->freq_ready_val, 0, TIMEOUT);
+}
+
+static bool is_power_on(struct clk_pll *clkp)
+{
+	u32 val;
+
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
+
+	if (!clkp->seq_power_off)
+		return;
+
+	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
+			       clkp->num_seq_power_off);
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
+	if (!ftblv)
+		return -EINVAL;
+
+	req->rate = ftblv->rate;
+	return 0;
+}
+
+static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct clk_pll *clkp = to_clk_pll(hw);
+	const struct freq_table *fv;
+	u32 freq_val;
+
+	if (regmap_read(clkp->clkr.regmap, clkp->freq_reg, &freq_val))
+		return 0;
+
+	freq_val &= clkp->freq_mask;
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
+	int ret;
+
+	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
+	if (!fv || fv->rate != rate)
+		return -EINVAL;
+
+	if (clkp->seq_pre_set_freq) {
+		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
+					     clkp->num_seq_pre_set_freq);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
+				 clkp->freq_mask, fv->val);
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
+const struct clk_ops rtk_clk_pll_ops = {
+	.enable         = clk_pll_enable,
+	.disable        = clk_pll_disable,
+	.is_enabled     = clk_pll_is_enabled,
+	.recalc_rate    = clk_pll_recalc_rate,
+	.determine_rate = clk_pll_determine_rate,
+	.set_rate       = clk_pll_set_rate,
+};
+EXPORT_SYMBOL_GPL(rtk_clk_pll_ops);
+
+const struct clk_ops rtk_clk_pll_ro_ops = {
+	.recalc_rate = clk_pll_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(rtk_clk_pll_ro_ops);
diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
new file mode 100644
index 000000000000..2d27a44a270c
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
+extern const struct clk_ops rtk_clk_pll_ops;
+extern const struct clk_ops rtk_clk_pll_ro_ops;
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
index 000000000000..383ae939fd1e
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
+#define CLK_OFS_INVALID        -1
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

