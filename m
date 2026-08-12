Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E61D366045;
	Wed, 12 Aug 2026 02:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500045; cv=none; b=blYZCx+82OpRWQcc6w6lRKxlPMQx5jA60qF6PS4VmWnlv4xkhV3a4MDwAYWoRCSQ76gBz/4HkEKDw9LstJ/T6vRPEXoqQnvHy/mMznvImRPQSmVHH4VfmCzz/ddHdDMABwj+auh1IaW22RnJnlgv8qza2/DPUUkYC5XVGF2m2xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500045; c=relaxed/simple;
	bh=50D6ikBHuuiOV2qQTsaL7PGVD/kp4c/XNp44k7SKDAg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FsFsUyt+4XzKy3mpQ/1h+PUvrwClE2UNkeMtQieoH0YXQh4yOr/47fZFipO32/IV7RVZwVWCiSR715cjkok4UoKpX5cY8rfYkxpbWDZV3nav0hxDics5LU3AJqzfMUY9SHZnNcYc5m1VJFN1mZPE8tgw8LjbR+/ySSnUU1hlAso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Hk30uXDO; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Hk30uXDO"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C20FipC3195367, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786500015; bh=cqncpIyPAnsbk8T7PP973/pp1++2GxJhAQeStDEaJuM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Hk30uXDO1ZqGjEoZ7XR7larbZ7fj806IZPRO1/okTyVn7+4LCbgZMFElIwkD13nRP
	 ie4rMpw4WOSbLKVwZO9QRn+0PJlfI2UatokTXyIceU60sdAiHnlzulJ4ph3vhzSJm5
	 r1NNGowFrLrLXgsrRGWRMBkQwHh2VaPP+USSxHRPsulgwQsN8KOsRsXI5wOVNKLCI7
	 +rHchUiejrAZbJhs/4mSNRv42WGjhDJ407sSsOpU8Ac3lznSKk1+HbV9orrJovZzY7
	 7ginpABghhb8IO5MnTNvqEgUkO+6Cv/qc6ZaHg2LoQJsSlyP0/6w0Q92L31KUkCzn7
	 A6hecd56WShSw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C20FipC3195367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 10:00:15 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 10:00:15 +0800
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
Subject: [PATCH v13 06/11] clk: realtek: Add support for gate clock
Date: Wed, 12 Aug 2026 10:00:04 +0800
Message-ID: <20260812020009.3480538-7-eleanor.lin@realtek.com>
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

Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
for standard regmap gate clocks.

Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v13:
- None.
---
 drivers/clk/realtek/Makefile          |  1 +
 drivers/clk/realtek/clk-regmap-gate.c | 70 +++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 71edc18121c6..840aff067b61 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -3,4 +3,5 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += clk-rtk-common.o
 clk-rtk-y += clk-pll.o
+clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
new file mode 100644
index 000000000000..1c32a87d97df
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/export.h>
+#include <linux/regmap.h>
+#include "clk-regmap-gate.h"
+
+static int rtk_clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
+	unsigned int mask;
+	unsigned int val;
+
+	mask = BIT(clkg->bit_idx);
+	val = BIT(clkg->bit_idx);
+
+	if (clkg->write_en) {
+		mask |= BIT(clkg->bit_idx + 1);
+		val |= BIT(clkg->bit_idx + 1);
+	}
+
+	return regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
+}
+
+static void rtk_clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
+	unsigned int mask;
+	unsigned int val;
+
+	mask = BIT(clkg->bit_idx);
+	val = 0;
+
+	if (clkg->write_en) {
+		mask |= BIT(clkg->bit_idx + 1);
+		val |= BIT(clkg->bit_idx + 1);
+	}
+
+	regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
+}
+
+static int rtk_clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
+	int ret;
+	u32 val;
+
+	ret = regmap_read(clkg->clkr.regmap, clkg->gate_ofs, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & BIT(clkg->bit_idx));
+}
+
+const struct clk_ops rtk_clk_regmap_gate_ops = {
+	.enable     = rtk_clk_regmap_gate_enable,
+	.disable    = rtk_clk_regmap_gate_disable,
+	.is_enabled = rtk_clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ops, "CLK_REALTEK");
+
+const struct clk_ops rtk_clk_regmap_gate_ro_ops = {
+	.is_enabled = rtk_clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ro_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-regmap-gate.h b/drivers/clk/realtek/clk-regmap-gate.h
new file mode 100644
index 000000000000..9303adda3166
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_REGMAP_GATE_H
+#define __CLK_REALTEK_CLK_REGMAP_GATE_H
+
+#include "clk-rtk-common.h"
+
+struct rtk_clk_regmap_gate {
+	struct rtk_clk_regmap clkr;
+	unsigned int gate_ofs;
+	u8 bit_idx;
+	u32 write_en : 1;
+};
+
+#define __rtk_clk_regmap_gate_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
+
+#define __RTK_CLK_REGMAP_GATE(_name, _parent, _ops, _flags, _ofs, _bit_idx, \
+			      _write_en)                                    \
+	struct rtk_clk_regmap_gate _name = {                                \
+		.clkr.hw.init = CLK_HW_INIT(#_name, _parent, _ops, _flags), \
+		.gate_ofs = _ofs,                                           \
+		.bit_idx = _bit_idx,                                        \
+		.write_en = _write_en,                                      \
+	}
+
+#define RTK_CLK_REGMAP_GATE(_name, _parent, _flags, _ofs, _bit_idx, _write_en)        \
+	__RTK_CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
+			      _bit_idx, _write_en)
+
+#define RTK_CLK_REGMAP_GATE_RO(_name, _parent, _flags, _ofs, _bit_idx, _write_en)  \
+	__RTK_CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ro_ops, _flags, \
+			  _ofs, _bit_idx, _write_en)
+
+#define __RTK_CLK_REGMAP_GATE_NO_PARENT(_name, _ops, _flags, _ofs, _bit_idx,  \
+				    _write_en)                                \
+	struct rtk_clk_regmap_gate _name = {                                  \
+		.clkr.hw.init = CLK_HW_INIT_NO_PARENT(#_name, _ops, _flags),  \
+		.gate_ofs = _ofs,                                             \
+		.bit_idx = _bit_idx,                                          \
+		.write_en = _write_en,                                        \
+	}
+
+#define RTK_CLK_REGMAP_GATE_NO_PARENT(_name, _flags, _ofs, _bit_idx, _write_en)        \
+	__RTK_CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
+				    _bit_idx, _write_en)
+
+#define RTK_CLK_REGMAP_GATE_NO_PARENT_RO(_name, _flags, _ofs, _bit_idx, _write_en)  \
+	__RTK_CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ro_ops, _flags, \
+				    _ofs, _bit_idx, _write_en)
+
+static inline struct rtk_clk_regmap_gate *to_rtk_clk_regmap_gate(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_regmap_gate, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_gate_ops;
+extern const struct clk_ops rtk_clk_regmap_gate_ro_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_GATE_H */
-- 
2.43.0

