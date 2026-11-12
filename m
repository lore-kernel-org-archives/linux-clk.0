Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461197;
	b=MQkCfa24F7zDRglPTY3Zdm7mMh3YSwPPzB0lSP54tEcdpaPzHPrFk9Uoew2hRmYlrbeU
	 iBwRd+4TXHn5bdZsHURbK+wyZstjTGtcgxt8dorbXovSHMrA84/uIehipDHFVAg+AjLc6
	 jzM/zAhnpGzefuP04BVmaYTW2xIEjQ19KMl5hlwVWKMwvFvHkToh1Qnz1KZT9XAKikRQP
	 mIx9hm3mNrTrnmzhOSzsiI0zVKyGN8y92BqNFcc+nPhvf6XNHVL85fg7l25eVW6mLOE0F
	 BaBh33Kx6czvmUCj/Ft87MNyJ/SIM9U6gt2QU+igeqBfpIsGyac62zI51wJBnVLhqgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461197;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=DdSkIHQhAppkS2Hhaj02LdC/RhI8GVMz9XKFgubFT/4=;
	b=fqXxxBHf8MUR1WU0wFMneIPd8h2HuQDvyvJWF2lkVoQHw29Mv5BMFZ/a4kjjIDLelT4I
	 2JwAuKy8VWC2Rm/VJS0abJxwQJuKJCurG+R4lCtOHrKweZKpxskuA0zuyLKe/ZeWxkb2I
	 tDjfeeU/zHMoLoMk4VSVoh9yyAkJpT+4qhVJniSL/SNH+mMclWDG6qQN2GvVtE5E1L+Dz
	 PE4QcDarRJtywVQpCpQx78/2bqPPRKlHaP9b2FfEMgmryYoBNTABkLLukBTmOJCtehpAs
	 Qr7dYBfsvM9rzjykYtPjoNjUXVllssXfYi//0WSKA68WJ9Iy4nZ08lCc5ypwlqEtcig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=YO1TuYJs;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5265A606A88D;
	Thu, 12 Nov 2026 05:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5265A606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=YO1TuYJs
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5PkmrE3459342, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461146; bh=DdSkIHQhAppkS2Hhaj02LdC/RhI8GVMz9XKFgubFT/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=YO1TuYJsAIqb3/hxnAUf2dhxlqnygkm8EzRKcgiSBlvus9kp3pjO/SsDm0DfxYFHQ
	 RzgsPRa4uFAW69VkGlUgyXqZmKNGspasW8eH4QdavgsBDD+NFYrpKk+BTzSFVpADl3
	 GF3ogWUdbPRCC28Tkp3wi4/EJa0ah8DOk4E2xYipNWMsW0EzqnXeu4KbauC9Fhe5Hl
	 J5LsXzVRiwLpQ/lgAHCMe051vmrPeynhFWRSVl42RqbrybcU7e+9jcw7nQIrLnP8Ei
	 hZ6ZXFrPCI+w19drii1ESgj3N7osbFvsiPPwAIdHRsrqb0/rBjDJ6vYgznFywqmtP6
	 Ts1G2KOhUAv9w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5PkmrE3459342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:25:46 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:46 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:25:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 4/9] clk: realtek: Add support for gate clock
Date: Thu, 12 Nov 2026 13:25:39 +0800
Message-ID: <20261112052544.555563-5-eleanor.lin@realtek.com>
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

Introduce clk_regmap_gate_ops supporting enable, disable, and is_enabled
for standard regmap gate clocks. To accommodate hardware designs, the
enable and disable operations handle a 'write_en' flag, which asserts an
adjacent write-enable bit (bit_idx + 1) simultaneously when modifying the
gate bit.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v16:
- Remove Brian's reviewed-by tag.
- Replace 'CLK_HW_INIT' with 'CLK_HW_INIT_HW' and 'CLK_HW_INIT_FW_NAME' macros
to avoid relying on unstable internal CCF global names.
- Drop all unused NO_PARENT macro and 'rtk_clk_regmap_gate_ro_ops'.
---
 drivers/clk/realtek/Makefile          |  1 +
 drivers/clk/realtek/clk-regmap-gate.c | 59 +++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-gate.h | 54 ++++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 6fbe6e07b760..9397d677f52d 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -2,5 +2,6 @@
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += clk-rtk-common.o
+clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += clk-regmap-pll.o
 clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
new file mode 100644
index 000000000000..12539e11647c
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.c
@@ -0,0 +1,59 @@
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
+static int rtk_clk_regmap_gate_update(struct clk_hw *hw, bool enable)
+{
+	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
+	unsigned int mask = BIT(clkg->bit_idx);
+	unsigned int val = enable ? mask : 0;
+
+	/*
+	 * Hardware specific design: to modify the gate bit, the adjacent
+	 * write-enable bit (bit_idx + 1) must be asserted simultaneously.
+	 */
+	if (clkg->write_en) {
+		mask |= BIT(clkg->bit_idx + 1);
+		val |= BIT(clkg->bit_idx + 1);
+	}
+
+	return regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
+}
+
+static int rtk_clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	return rtk_clk_regmap_gate_update(hw, true);
+}
+
+static void rtk_clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	rtk_clk_regmap_gate_update(hw, false);
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
diff --git a/drivers/clk/realtek/clk-regmap-gate.h b/drivers/clk/realtek/clk-regmap-gate.h
new file mode 100644
index 000000000000..4540e73ca72b
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.h
@@ -0,0 +1,54 @@
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
+#define __RTK_CLK_REGMAP_GATE_HW(_name, _parent, _ops, _flags, _ofs, _bit_idx, _write_en) \
+struct rtk_clk_regmap_gate _name = { \
+	.clkr.hw.init = CLK_HW_INIT_HW(#_name, _parent, _ops, _flags), \
+	.gate_ofs = _ofs, \
+	.bit_idx = _bit_idx, \
+	.write_en = _write_en, \
+}
+
+#define RTK_CLK_REGMAP_GATE_HW(_name, _parent, _flags, _ofs, _bit_idx, _write_en) \
+	__RTK_CLK_REGMAP_GATE_HW(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, \
+				 _ofs, _bit_idx, _write_en)
+
+#define __RTK_CLK_REGMAP_GATE_FW_NAME(_name, _parent, _ops, _flags, _ofs, _bit_idx, _write_en) \
+struct rtk_clk_regmap_gate _name = { \
+	.clkr.hw.init = CLK_HW_INIT_FW_NAME(#_name, _parent, _ops, _flags), \
+	.gate_ofs = _ofs, \
+	.bit_idx = _bit_idx, \
+	.write_en = _write_en, \
+}
+
+#define RTK_CLK_REGMAP_GATE_FW_NAME(_name, _parent, _flags, _ofs, _bit_idx, _write_en) \
+	__RTK_CLK_REGMAP_GATE_FW_NAME(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, \
+				      _ofs, _bit_idx, _write_en)
+
+static inline struct rtk_clk_regmap_gate *to_rtk_clk_regmap_gate(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_regmap_gate, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_gate_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_GATE_H */
-- 
2.43.0

