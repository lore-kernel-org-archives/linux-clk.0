Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182EB37BE72;
	Thu,  2 Apr 2026 07:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115778; cv=none; b=u06SPqpg4AdrtlWRhN7izNt+DNnshX3BtGErUe1lUDhP6gPHFOquAZiWvN7khFLb7Bw3i/MDv0qM3wrBWRIXpuDhs13gHzDX8xWJGmxVZMY8gcfBU00Euse+a7cZUJIYU2KjaUxM8TaOmeM3VEY7a8I5bVxFSY6DKDdW5pdg3Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115778; c=relaxed/simple;
	bh=3xHWy2sHeLIqYT0xDInFKJBowm4f125FkSuUS9r1JM8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oveEZpK7P/0aeNnpGk8EjHI8FCJs0VUo7CeAreljcw75lHRTe0NxpsUh1o5gdcT/6PSZ8RxnI4ib1CrCK4MW8ysN9vdq6xOywch4he7cZOLpkY/3PRdjUdAjTy55E2+deJgg00I0oMT0yFBNH2xMAltJvO44XiwVZFjkgbG299o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=uxmD/0Dv; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="uxmD/0Dv"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6327e2Nb92695617, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775115602; bh=zcJYZfAR89qJjPuT4ofIZoL442JttxgIsDPHqTelBek=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=uxmD/0DveUZ0o0LF64QIBRagmRhSI9jZ6f1PfQ3l6pgz6+vEukTMmbf5hBi2ZkFzI
	 KBRaWEVN6nsEsL+JemNlZKMsIay/8m4LOExy4Bmo4YL8QNGan1nwvFo6AUZ6zW+lev
	 DrWeGQ1MFA17S+gMyc1qnu7FGDpI0MaKWqcjGjFxYsN5gm3WsQcIStoSKoZViHxBjs
	 KqYwa/3lo4Y0UGaAroXwYuE9KqK2ZWLgtxAP/cEsFGhpkIMtu1kQkAKufTwEbBM+x0
	 gVKSg23vGEDiCQ6UJkJ0KATFLr9dOWIyoaIcfewswafxrjS27VftcEcWseFsRGcj6Z
	 zNrwePkUtYNVQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6327e2Nb92695617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 15:40:02 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 2 Apr 2026 15:40:02 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 2 Apr 2026 15:40:01 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 2 Apr 2026 15:40:01 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v6 06/10] clk: realtek: Add support for mux clock
Date: Thu, 2 Apr 2026 15:39:53 +0800
Message-ID: <20260402073957.2742459-7-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260402073957.2742459-1-eleanor.lin@realtek.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
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
Changes in v6:
- Add the headers used in c file to follow the "Include What You Use" principle.
---
 drivers/clk/realtek/Makefile         |  1 +
 drivers/clk/realtek/clk-regmap-mux.c | 48 ++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-mux.h | 43 +++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 74375f8127ac..f90dc57fcfdb 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -5,4 +5,5 @@ clk-rtk-y += common.o
 
 clk-rtk-y += clk-pll.o
 clk-rtk-y += clk-regmap-gate.o
+clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
new file mode 100644
index 000000000000..068b056d61f0
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/regmap.h>
+#include <linux/clk-provider.h>
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
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "REALTEK_CLK");
+
+const struct clk_ops rtk_clk_regmap_mux_ro_ops = {
+	.get_parent = clk_regmap_mux_get_parent,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ro_ops, "REALTEK_CLK");
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

