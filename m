Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB42C373C1C;
	Fri, 13 Mar 2026 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389631; cv=none; b=oqw+dPVQfk6u7AwLJm011CWC3QB6ujN9sDOKIOBvWzgz1r8mIaDgrixaP9F/iE/siRKE7Kt6P3Tl5sh9/wNbjP8D579uSzMJwi2mwvBCqukmoEsXwoCd8RPnY3dvoGBiIoeIQG9Uay3FsdplzdmEFtdtwk6Tm42I250Eu5zCuVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389631; c=relaxed/simple;
	bh=MZbnSepZ3lGab2jIWs8i3XKNjMcR4usMIg+1aO2L7Bk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=itg2WAB3QeRq0VyD9MiDONLSIVWE8BFCrUZA6JyD3Epm+EbSqec+esjNL6HcQ3+xZyu0BvOf0Tn7+x3CsZzlzecSdQdwi9XjBKxPA8Z8JZeIdUjMcqtcj7sMvtY2rAohJzt+SXU7Qy4yQuxMyMAPcT0u5Qrl4PgrKgjmh/JQ5QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=VW0xBAVA; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="VW0xBAVA"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62D8B2x94053108, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773389462; bh=hn8QS5pfXTx8IPhDQA63ICdHI2J7X13J1pbt/ePSIYg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=VW0xBAVAJk0MlJr9HFd9eC9GCL3XGRX9e7lxgYohTSnRikxgWYZ1wa8MVvX4P8xcZ
	 /ZJQajWxz2/FhH57HYVotpe2s5lu6zHr5GD8W3VZEp8aiFeoNfeJDdZjtw6Z5liEvG
	 c700Tvq6M7MdkWCUjYpR10AgHV27GitOEl7yUaESFo5YzEO7CHPpWVCdGHP3J16FpF
	 hm9BecEaxPL3A8m4oirdrvV8UEJmR6c7X3CiH1VvwTshduN1qzyH7CAyS5Fjs7u7RQ
	 T25gILdJr/PCcvF9CSVMhD6Jcd4sRGYEhbTLgnGdmylyiwpc13/NehXVVHHx5Sk26+
	 0KAI2KXuN+pWw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62D8B2x94053108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 16:11:02 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 13 Mar 2026 16:11:02 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 13 Mar 2026 16:11:01 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 16:11:01 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v4 05/10] clk: realtek: Add support for phase locked loops (PLLs)
Date: Fri, 13 Mar 2026 16:10:55 +0800
Message-ID: <20260313081100.596224-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260313081100.596224-1-eleanor.lin@realtek.com>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
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
Changes in v4:
- None.
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

