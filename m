Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487831;
	b=IDr7FOpiaOSJAAnWQLfgrVhHYXpteovQmFS796Qltcpt3bTyObE0yimWbKRB3rmyASDA
	 qpga6Nj4saU48x34xOAE3fiKJtt+A7nNfgSicFwFSjlZN2bn/x+ETVl0+EXpnNa4vXr5v
	 nzIABIs+vvUdVF+Po6B0WnB8spc3pgvGPZKLX2D9yDf/0tjXG75xBf++nMg8eDQfG6yh8
	 bADbMvX0IVrsu1mySd6r13CFwMU57l1UmadQp1WWksYggBR6bQ2kXyhKvFl3a65iWBA4f
	 kDnsseZd8/1bXzn9//Y+zKKJshkn0kWsAgedsrY7ABq8D3WuiojRDmgzYA4REQcieKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487831;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=LdIr81XQUw7VpYnpXqxz41gzN6tB2DzbyylB1vVqhYc=;
	b=Am3xMuKDSZ4xvN4lAsHdatDLuJRj1a4fRpjJvPGtYclUxEUJtsuiWOGFqx4rV/q0cWYz
	 yUuCXys43vyFyksUgoro7O1thrVn1/xuaXTskxglDzoQTy+3KtrIzIbU7hVPScISsXcBS
	 FV3FDAMe4T4RGWmVlElXvujtZzaehJpbpQxLG2o/I0kJi/DxM6plQ5eyVgkxOK8q/IVvw
	 0oUnIbD8qWcM1Ns+KptObON59OPc3aGTnRXpY46RFSu57AXEg2gQtCrIapcw3O4Vg13Eq
	 g6WzaYQy0a14x5DOhsbkvdncXgAD0rPfztdN4iQBNwIcwihfWF7HsmjpyswgJBFkF5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lbD+qonp;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C30A606A6A5;
	Tue, 24 Nov 2026 02:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C30A606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lbD+qonp
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2Zxh162160552, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487759; bh=LdIr81XQUw7VpYnpXqxz41gzN6tB2DzbyylB1vVqhYc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=lbD+qonpKwf4hNFEzBDp7YnUzczQl2uWMc8DYVPRDfuwHm7AvmJq9lgzCFqhH32OH
	 FPqLm8TGuBbs4TodGJ3arHFJnCLJjcFHhc3XT3FnSOZwzew6y9V2mL/nMWXWSizcFH
	 rmPx+I7r4KDk6rcaRncMhSMmqm5fIrkkviIrEvfpigKsQOImBUMOxzTLlMNq15BgVT
	 mNJv1OGwbxjpzXvyUhS1zoyzNg8FzVcwCXSudMMhEiFHekbuaM+OF0vBbPIWqbbvMm
	 AH8MgSPEZttH21qM3DsGndO242Vpqzji5yMCGYdSNgwAIcIUbSWlBz3EgRHyya/6F8
	 pd85+sdJJ0KjQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2Zxh162160552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 10:35:59 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:59 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 10:35:59 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v17 5/9] clk: realtek: Add support for mux clock
Date: Tue, 24 Nov 2026 10:35:53 +0800
Message-ID: <20261124023558.4088635-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124023558.4088635-1-eleanor.lin@realtek.com>
References: <20261124023558.4088635-1-eleanor.lin@realtek.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
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
Changes in v17:
- None.
---
 drivers/clk/realtek/Makefile         |  1 +
 drivers/clk/realtek/clk-regmap-mux.c | 40 ++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-mux.h | 42 ++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 9397d677f52d..4be39e2dd5b4 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -3,5 +3,6 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += clk-rtk-common.o
 clk-rtk-y += clk-regmap-gate.o
+clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += clk-regmap-pll.o
 clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
new file mode 100644
index 000000000000..ba86f314bb5e
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/export.h>
+#include <linux/regmap.h>
+#include "clk-regmap-mux.h"
+
+static u8 rtk_clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
+	if (ret)
+		return 0xff;
+
+	val = (val >> clkm->shift) & clkm->mask;
+
+	return val;
+}
+
+static int rtk_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
+
+	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
+				  clkm->mask << clkm->shift, (u32)index << clkm->shift);
+}
+
+const struct clk_ops rtk_clk_regmap_mux_ops = {
+	.set_parent = rtk_clk_regmap_mux_set_parent,
+	.get_parent = rtk_clk_regmap_mux_get_parent,
+	.determine_rate = __clk_mux_determine_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-regmap-mux.h b/drivers/clk/realtek/clk-regmap-mux.h
new file mode 100644
index 000000000000..1d86a7f42efd
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_REGMAP_MUX_H
+#define __CLK_REALTEK_CLK_REGMAP_MUX_H
+
+#include "clk-rtk-common.h"
+
+struct rtk_clk_regmap_mux {
+	struct rtk_clk_regmap clkr;
+	unsigned int mux_ofs;
+	unsigned int mask;
+	unsigned int shift;
+};
+
+#define __rtk_clk_regmap_mux_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
+
+#define __RTK_CLK_REGMAP_MUX_HW(_name, _parents, _ops, _flags, _ofs, _sft, _mask) \
+struct rtk_clk_regmap_mux _name = { \
+	.clkr.hw.init = CLK_HW_INIT_PARENTS_HW(#_name, _parents, _ops, _flags), \
+	.mux_ofs = _ofs, \
+	.shift = _sft, \
+	.mask = _mask, \
+}
+
+#define RTK_CLK_REGMAP_MUX_HW(_name, _parents, _flags, _ofs, _sft, _mask) \
+	__RTK_CLK_REGMAP_MUX_HW(_name, _parents, &rtk_clk_regmap_mux_ops, _flags, _ofs, \
+				_sft, _mask)
+
+static inline struct rtk_clk_regmap_mux *to_rtk_clk_regmap_mux(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_regmap_mux, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_mux_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_MUX_H */
-- 
2.43.0

