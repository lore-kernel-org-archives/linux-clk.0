Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9939036CDF2;
	Tue, 13 Jan 2026 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303439; cv=none; b=tnvN123iqVkhguFX2pOfdiRFbSoHegixOO9FBNh2ciDKP5u4pKDktDMVLmiUzwQaWhvidUOVabPLwYLwCnHQALp4g99wTRTUHEVNkSE574q7XadopMnj4PMVxhLBV/0/IMEXE7x+DfEPhClwl95l8Sfb4AlKHHcN7HqK1W8mwVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303439; c=relaxed/simple;
	bh=VYG1uzHoSgBBvCppi4rZOjWVs1vujH+1l4yM9eYsvJQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btX/4lSRhMgTi9zASQeKGNDiDPoLizaiuDJW2acxq//M3Zn0NXEKzC73FunKOA0fHWHjJSd7VqPEv41wQERtpWILvkKIwpDI9/w3pcfwjpReuSplYIEEjp9zR1NfVncEtg84cn962k368sxfA3jJy2VINQDwyOwVHsfG4JP6uBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=R7qTqIlp; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="R7qTqIlp"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60DBNYa242915413, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1768303414; bh=SslI1S6bDaUiTRWp0Ax1onFIOPUAuKSuIugn6dV2uCo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=R7qTqIlpR4XXSHH1iu8geAgQvJPFRmryEtpK62crNvCuyaycoFaz5AcLz6N9vrsOt
	 VL6t4XEz8foO+U0l0KhyZmFLUtky/3e9id5Z0vmvLv/plOcCPiHol7N52lOWvK5eP7
	 xq9gvvJ5jbQ9f2aEPrdFAI7r5junxStfmNQfVvCkm/Pf5jHHUu2Xke1hlfbGNWkT8B
	 eq7nk8yAMXdGv3n5VqXcjUa2AoCvNDk3yI8PQ1HJ3K11d4s7z7OFe0JThVkhZCiOQo
	 OeEPJLLQ74SnHQfOoi5va4Wyoh1lo4kyr/lXROpsknmrNHdgrLzmkOjnMGOqEhkB6S
	 ZdwuyXjJNl6uQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60DBNYa242915413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jan 2026 19:23:34 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 13 Jan 2026 19:23:34 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 13 Jan 2026 19:23:34 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 Jan 2026 19:23:34 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v2 5/9] clk: realtek: Add support for gate clock
Date: Tue, 13 Jan 2026 19:23:28 +0800
Message-ID: <20260113112333.821-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113112333.821-1-eleanor.lin@realtek.com>
References: <20260113112333.821-1-eleanor.lin@realtek.com>
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
disable_unused for standard regmap gate clocks.

Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Added missing Co-developed-by tag.
- Added error handling for regmap_update_bits.
- Removed .disable_unused callback in gate ops. The CCF handles the fallback to
  .disable automatically if .disable_unused is not present.
---
 drivers/clk/realtek/Makefile          |  2 +
 drivers/clk/realtek/clk-regmap-gate.c | 66 +++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-gate.h | 65 ++++++++++++++++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index c173ea3b10e3..97058d48a176 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -2,6 +2,8 @@
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += common.o
+
 clk-rtk-y += clk-pll.o
+clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += freq_table.o
 clk-rtk-y += reset.o
diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
new file mode 100644
index 000000000000..5d0c402993d9
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
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
+const struct clk_ops clk_regmap_gate_ops = {
+	.enable     = clk_regmap_gate_enable,
+	.disable    = clk_regmap_gate_disable,
+	.is_enabled = clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_gate_ops);
+
+const struct clk_ops clk_regmap_gate_ro_ops = {
+	.is_enabled = clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_gate_ro_ops);
diff --git a/drivers/clk/realtek/clk-regmap-gate.h b/drivers/clk/realtek/clk-regmap-gate.h
new file mode 100644
index 000000000000..41cbe27865a7
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017 Realtek Semiconductor Corporation
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
+	__CLK_REGMAP_GATE(_name, _parent, &clk_regmap_gate_ops, _flags, _ofs, \
+			  _bit_idx, _write_en)
+
+#define CLK_REGMAP_GATE_RO(_name, _parent, _flags, _ofs, _bit_idx, _write_en) \
+	__CLK_REGMAP_GATE(_name, _parent, &clk_regmap_gate_ro_ops, _flags,    \
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
+	__CLK_REGMAP_GATE_NO_PARENT(_name, &clk_regmap_gate_ops, _flags, _ofs, \
+				    _bit_idx, _write_en)
+
+#define CLK_REGMAP_GATE_NO_PARENT_RO(_name, _flags, _ofs, _bit_idx, _write_en) \
+	__CLK_REGMAP_GATE_NO_PARENT(_name, &clk_regmap_gate_ro_ops, _flags,    \
+				    _ofs, _bit_idx, _write_en)
+
+static inline struct clk_regmap_gate *to_clk_regmap_gate(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+
+	return container_of(clkr, struct clk_regmap_gate, clkr);
+}
+
+extern const struct clk_ops clk_regmap_gate_ops;
+extern const struct clk_ops clk_regmap_gate_ro_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_GATE_H */
-- 
2.34.1

