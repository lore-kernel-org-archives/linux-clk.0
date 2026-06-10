Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1722A3A380E;
	Wed, 10 Jun 2026 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078968; cv=none; b=ZA/LSYbYgB4qc1bMs27Ab+bY2YUvb5v8SCjD5iHwatn16bKrsYp2BKFbSr2/IABUyqr6DV8CXFTEvlWqP8sh/bsxvLEJo7BuKb2p21rHLegwDtQ+/B3ux2qHW9mwv3nZREC4z2afYJqhJrkH9K3iBuw3L10/Jw6Hr09UJrk5egc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078968; c=relaxed/simple;
	bh=IVujbMlA5K7FJGGTE4gMZgJ3ws1pOFLtsu1usJ/dur4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u/1EAOGmD7YqNaiXqrrboNsh6klZCfIJhYgILoBJ7kJoOnaCFSPB+q9GxAYAlZphgQOldho+FnuO6SQZTarbi39xuZ4vrrqK4ELHPPyxZUfPpRn/A1gEgPuUVU74V0HmPJrG5wCafbl288VNMqphcUhPB6dFqwDQXDLw/Tgq5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=C+BZLeoW; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="C+BZLeoW"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65A88RTK0983541, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781078907; bh=DlIcL4ixSaBhFjw0ts1K07N2MltFxU7MQOfp4RlMu2U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=C+BZLeoWT5fDw0wJs2Xtq/W75Plwm0BsBTqLtcPnN456dV8CcP4wzZwAJ63Me9wTV
	 WXFqYRPYFarz0d8FCYRmyglI6tPA67ks5irkkPpJDDc+6YtRuyjLzZM7qdqvXf09RN
	 M/3hB9v16lCzXJh1e1CIDvVtevqNXj4OCCg2TOzJMvyNby/3HUrqgbP5zDJlIO8AU5
	 cYBB1QXTemjeTjTYMQVqSeSkVMH7DuJuaDQNlaRTFWRPpj2sobaB2A8H/6Z3N2/qcG
	 NmippWBNsYt9//1KK0m34LOBAQMvPtMuxoFyQnSbz3vaS5AVRFhzCtxMnHG76O/5v2
	 h9G9NCqUXYqaQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65A88RTK0983541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jun 2026 16:08:27 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Jun 2026 16:08:27 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Jun 2026 16:08:27 +0800
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
Subject: [PATCH v8 05/10] clk: realtek: Add support for gate clock
Date: Wed, 10 Jun 2026 16:08:19 +0800
Message-ID: <20260610080824.255063-6-eleanor.lin@realtek.com>
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

Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
for standard regmap gate clocks.

Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v8:
- None
---
 drivers/clk/realtek/Makefile          |  2 +
 drivers/clk/realtek/clk-regmap-gate.c | 70 +++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index a89ad77993e9..74375f8127ac 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -2,5 +2,7 @@
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += common.o
+
 clk-rtk-y += clk-pll.o
+clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
new file mode 100644
index 000000000000..0db0057215e3
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
+static int clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	struct clk_regmap_gate *clkg = to_clk_regmap_gate(hw);
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
+static void clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	struct clk_regmap_gate *clkg = to_clk_regmap_gate(hw);
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
+static int clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap_gate *clkg = to_clk_regmap_gate(hw);
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
+	.enable     = clk_regmap_gate_enable,
+	.disable    = clk_regmap_gate_disable,
+	.is_enabled = clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ops, "REALTEK_CLK");
+
+const struct clk_ops rtk_clk_regmap_gate_ro_ops = {
+	.is_enabled = clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ro_ops, "REALTEK_CLK");
diff --git a/drivers/clk/realtek/clk-regmap-gate.h b/drivers/clk/realtek/clk-regmap-gate.h
new file mode 100644
index 000000000000..711e168071f6
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
+#include "common.h"
+
+struct clk_regmap_gate {
+	struct clk_regmap clkr;
+	int gate_ofs;
+	u8 bit_idx;
+	u32 write_en : 1;
+};
+
+#define __clk_regmap_gate_hw(_p) __clk_regmap_hw(&(_p)->clkr)
+
+#define __CLK_REGMAP_GATE(_name, _parent, _ops, _flags, _ofs, _bit_idx,     \
+			  _write_en)                                        \
+	struct clk_regmap_gate _name = {                                    \
+		.clkr.hw.init = CLK_HW_INIT(#_name, _parent, _ops, _flags), \
+		.gate_ofs = _ofs,                                           \
+		.bit_idx = _bit_idx,                                        \
+		.write_en = _write_en,                                      \
+	}
+
+#define CLK_REGMAP_GATE(_name, _parent, _flags, _ofs, _bit_idx, _write_en)    \
+	__CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
+			  _bit_idx, _write_en)
+
+#define CLK_REGMAP_GATE_RO(_name, _parent, _flags, _ofs, _bit_idx, _write_en) \
+	__CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ro_ops, _flags,    \
+			  _ofs, _bit_idx, _write_en)
+
+#define __CLK_REGMAP_GATE_NO_PARENT(_name, _ops, _flags, _ofs, _bit_idx,     \
+				    _write_en)                               \
+	struct clk_regmap_gate _name = {                                     \
+		.clkr.hw.init = CLK_HW_INIT_NO_PARENT(#_name, _ops, _flags), \
+		.gate_ofs = _ofs,                                            \
+		.bit_idx = _bit_idx,                                         \
+		.write_en = _write_en,                                       \
+	}
+
+#define CLK_REGMAP_GATE_NO_PARENT(_name, _flags, _ofs, _bit_idx, _write_en)    \
+	__CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
+				    _bit_idx, _write_en)
+
+#define CLK_REGMAP_GATE_NO_PARENT_RO(_name, _flags, _ofs, _bit_idx, _write_en) \
+	__CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ro_ops, _flags,    \
+				    _ofs, _bit_idx, _write_en)
+
+static inline struct clk_regmap_gate *to_clk_regmap_gate(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+
+	return container_of(clkr, struct clk_regmap_gate, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_gate_ops;
+extern const struct clk_ops rtk_clk_regmap_gate_ro_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_GATE_H */
-- 
2.43.0

