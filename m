Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4342634FF7D;
	Thu, 22 Jan 2026 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080158; cv=none; b=WE2AAlxL6Ma2yCjPvpVvloo+RGukejxAXo7Mluz8UXlVC+4BVCxxzforvtKX5ynjEn+n6+SC33A+LD6sc+O91Sjo2beNugfR744IAQKzkthCYoLhBXgITMAbY4360LfVaLQlBVEnLtAWelaCTyCSVpyrp4umyUpRcpd/NBNxnGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080158; c=relaxed/simple;
	bh=/JYwT+m4z0xzlhaHr6MbOU8ks66lEYSBa6ahDncfZUQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DzW9r37sWslUfaMnZjU4cQ+DnJZc/84RXp2rrszmxTr7F+BBHjNTepSAFLp2U/IokFYAKtsR976RemtBJAWwvrym5cyYjESd2NvudxC43cXi8bIBNyGUdEW8ucLs9aPYsaAnR41zRnKd6FG/d23/A2d173NWj7awOA0RrUfUQKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=NLqGfp+p; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="NLqGfp+p"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60MB8xvmE913378, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1769080139; bh=qebyPywROpho6QC+bM/2rjzPYcqbnnu7SqXdd+Jqmq0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=NLqGfp+pbIyGPhG3B9yR5UXB5g/74WQn7HZ3qSwAQDZhQfHjqakF5gOjDFXzraQnb
	 KGdgu/iL3KO39f8LZfQ50xF1iuIzq4rek15qFmMp+duvydrrpWG5gY+/CuXC03hvTJ
	 oA5kLxOX84Z3DvJyj8kkHwbWuG829pNHr0b+g5/VAwSbfvKOra8/6+/WHvOBZb8ARM
	 KTH0qgCJk4qsH4RwCd+5owQ4n6Sb3wKerOdgQzcPNOIAUiRW+xws2/dNwlHcpWV198
	 8xsYJRgRGX0rsv/s7dk/QClDVcI5R3dKqa4f+EqIF2Zu67QdSwMKm6ofrNDBYQqfps
	 U+qXvO26/hotA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60MB8xvmE913378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 19:08:59 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 22 Jan 2026 19:08:59 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 22 Jan 2026 19:08:59 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 Jan 2026 19:08:59 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v3 6/9] clk: realtek: Add support for mux clock
Date: Thu, 22 Jan 2026 19:08:54 +0800
Message-ID: <20260122110857.12995-7-eleanor.lin@realtek.com>
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

Add a simple regmap-based clk_ops implementation for Realtek mux clocks.

The implementation supports parent selection and rate determination through
regmap-backed register access.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- Added prefix "rtk_" in operation names to avoid duplicate symbol problem.
---
 drivers/clk/realtek/Makefile         |  1 +
 drivers/clk/realtek/clk-regmap-mux.c | 46 ++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-mux.h | 43 ++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 97058d48a176..b40dd5a26653 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -5,5 +5,6 @@ clk-rtk-y += common.o
 
 clk-rtk-y += clk-pll.o
 clk-rtk-y += clk-regmap-gate.o
+clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += freq_table.o
 clk-rtk-y += reset.o
diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
new file mode 100644
index 000000000000..d1612de2e2bc
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include "clk-regmap-mux.h"
+
+static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
+	int num_parents = clk_hw_get_num_parents(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
+	if (ret)
+		return 0;
+
+	val = val >> clkm->shift & clkm->mask;
+
+	if (val >= num_parents)
+		return 0;
+
+	return val;
+}
+
+static int clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
+
+	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
+				  clkm->mask << clkm->shift, index << clkm->shift);
+}
+
+const struct clk_ops rtk_clk_regmap_mux_ops = {
+	.set_parent = clk_regmap_mux_set_parent,
+	.get_parent = clk_regmap_mux_get_parent,
+	.determine_rate = __clk_mux_determine_rate,
+};
+EXPORT_SYMBOL_GPL(rtk_clk_regmap_mux_ops);
+
+const struct clk_ops rtk_clk_regmap_mux_ro_ops = {
+	.get_parent = clk_regmap_mux_get_parent,
+};
+EXPORT_SYMBOL_GPL(rtk_clk_regmap_mux_ro_ops);
diff --git a/drivers/clk/realtek/clk-regmap-mux.h b/drivers/clk/realtek/clk-regmap-mux.h
new file mode 100644
index 000000000000..cf7ab6a0604c
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_REGMAP_MUX_H
+#define __CLK_REALTEK_CLK_REGMAP_MUX_H
+
+#include "common.h"
+
+struct clk_regmap_mux {
+	struct clk_regmap clkr;
+	int mux_ofs;
+	unsigned int mask;
+	unsigned int shift;
+};
+
+#define __clk_regmap_mux_hw(_p) __clk_regmap_hw(&(_p)->clkr)
+
+#define __CLK_REGMAP_MUX(_name, _parents, _ops, _flags, _ofs, _sft, _mask)   \
+	struct clk_regmap_mux _name = {                                      \
+		.clkr.hw.init =                                              \
+			CLK_HW_INIT_PARENTS(#_name, _parents, _ops, _flags), \
+		.mux_ofs = _ofs,                                             \
+		.shift = _sft,                                               \
+		.mask = _mask,                                               \
+	}
+
+#define CLK_REGMAP_MUX(_name, _parents, _flags, _ofs, _sft, _mask)           \
+	__CLK_REGMAP_MUX(_name, _parents, &rtk_clk_regmap_mux_ops, _flags, _ofs, \
+			 _sft, _mask)
+
+static inline struct clk_regmap_mux *to_clk_regmap_mux(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+
+	return container_of(clkr, struct clk_regmap_mux, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_mux_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_MUX_H */
-- 
2.34.1

