Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461194;
	b=0WKnc8R92+HwK5PJ3Zk3EOnmK+qiKPXUwVCFR56OTL2EbgDVelM2I9M4GwhpxSmXGdFX
	 44WfjpxYLpBYar1ZI3B6DRUh+zOph55KvY7w2E4SniCIy8AM0cYCzrDlhNlqkgERsaOxv
	 NrkC9YENieeH2ph4mP+gDyDbaFqMXrEW8ipFaTCp4bbGqZdwm29ArABd/JqpyyU5FVNA1
	 CVI3xtJj+XQ0XdJKc+f3OxmWPId28dCZ/4WuzS+trt6aE+8kfhGmPqI4t3BtKzPrY1S++
	 X2/g7t6RX/4tjRIJxWaTxHzm0d/cU/e6ygRhX4f7jHl/FOOOB2fED0DyWTXjkb4KTjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461194;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=pj0rSYpUQTbEPKMnfqCizKcSx/5CubON/JSKQVLoENM=;
	b=SdhnOcD1ludPaTeAfUcFvrmsvEtmm6toxNCW5yVm3E1U9JjSyHQM+x2TI4TM9IelWKsg
	 p3RgSB1lQV5ar8d2KSVy9FliLKzCgnu0v04hAPlF8GfmKKqopworX8OG3+l9fOHTvExZb
	 6T/mArXfbPTKiFIB7ObcgWdq/p1UlDlVo6rTvNm9GrBRh0z4eClKZrZF8yt+oybo64/Q9
	 SiQgLg6FvvN/9jr2T+6SdNycrd5VrocbYU+VFbXcc5kf8bphDSCRLQxqNqNEqsX20SzP7
	 QnbOfNuwnMMNULwF2voalDkAfPynP4dfzIXIrVmm1QC15Wi5jlzYZFkSgnUVgmmXYKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=DTEF90BX;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B422D606A321;
	Thu, 12 Nov 2026 05:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B422D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=DTEF90BX
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5PkUlA3459344, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461146; bh=pj0rSYpUQTbEPKMnfqCizKcSx/5CubON/JSKQVLoENM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=DTEF90BXB9uzi3SKvFEDqaHyhczN4jmwCX4xtxnYBR385XGpe4GCdgQxCyjydhRu7
	 lh3Y7+wzdWRoXK2Eac/XoPHrHgr0hiu3hAFRWZaEaHNtMuLcRgCTPL70UTESWN0Ey5
	 rrL7Z3uqwxpJ5yFhMVTmcv7XmxRa2i8Cj/Z3Vx+K0Uw3oL/ww1igBnbaN2vyYYEHk+
	 Aht9Qe43I8pHx7Zt9iHB14inoUTn+hGtzoUsvVAuJYWj72j/L8SpVmnn/EvQ/MJXJN
	 +8BgBOiATimnHI7UdFohx2GAyfLGNTbUXfeXpYWbm7u4W0yDL+rn6/Up4o7Ay2JbcX
	 iWHoTmoQATckw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5PkUlA3459344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:25:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:46 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:25:46 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 5/9] clk: realtek: Add support for mux clock
Date: Thu, 12 Nov 2026 13:25:40 +0800
Message-ID: <20261112052544.555563-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112052544.555563-1-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
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
Changes in v16:
- Remove Brian's reviewed-by tag.
- Replace 'CLK_HW_INIT_PARENTS' with 'CLK_HW_INIT_PARENTS_HW' to use
'.parent_hws'
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

