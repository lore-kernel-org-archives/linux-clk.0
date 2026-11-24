Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487827;
	b=XKpCTiW9lT99Y7i6Zi8WuadrQnfZQ7AbPzyQfKKtJeG41++73ykq67+5v8UhXTKoDZYI
	 FGDq9K/K3eFSwKEmtm0Z5ywKjmj3g8AH7MhpxTepAzynrjODfYL0EDdQZwbIXqu8cpPQu
	 2DG6Grj6b0Kw8D1p1zVjpU+hLjIfxrnNNIEEvlrUrDyimoutJvS0vrgyAyiXF4332TCSk
	 CuCFKqD9C6RotNt5D0/3nYeXSD2fxYiNFMj6zQS0VXWC7nLFmPqYHItxBcP1sn7YIJJrD
	 SwTr3bigFlloN8X7qMgjouk0oVoJnLKOAPd2mL0HydqYY4fT+VwKrKh3SKEX/iZB6Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487827;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=QC6CLzWd/YK7FzJemA/kc1XWRISB9OLj7BLpGSxA8eA=;
	b=lJhIom/u6HFcIj71qTufnCL8DokxkqAtAq4BRr/M+04Wy98I3VtJ6xKVyb/7ZiEfRL/v
	 0SrQPObk1QGQHnso8Kq/OsG0sYhN1vbzBE5n1hz9Bi7MKWk4rur9CqlGJ4U29pUP90nha
	 BCH+auNllc3RngKUrC3UDZqYvjzylXdFI0iNYKvJqLas9QR2IoNrI2VNugj/ODiV0IcLv
	 VHZab6N/Xm9XEWYh/TW9qnOAqJ4WVgWiAtWhCOCnSJJWPFVAdDn7TsgGqg3DLkLdhfD5X
	 IbL7OhA2tAZ5VgvXf/YPCsxjqk9HCWu3EQA1bxifDHHnrTNPED0vyWNkisgKL3BfaSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="kyH/2jW8";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34218606A321;
	Tue, 24 Nov 2026 02:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34218606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=kyH/2jW8
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2Zxw462160551, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487759; bh=QC6CLzWd/YK7FzJemA/kc1XWRISB9OLj7BLpGSxA8eA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=kyH/2jW8UQWbj+0jUyNKzPzkQxnZzrQPHzsFJZXaLnwMuD8PmeXcZtYisJdMLl7wL
	 dTXVeDlmrC6nkaK4vOjOt7K9dXUIqnh1tj2dsGWACew7eUo3VjRxaxH4CTYbhumAht
	 BS+dhswaX5UVmQqDpUXl9zO/AHKaMtiXdthPEmgwvT01bhHiyy2PssV+CMQpbpjdre
	 uW9tPfGEXblFehix6O6cQH7V1Fbza1NfCRmc9MK4mnIl5ywKTT1+8TKrBWPIxN2LuJ
	 QamviiV231UBSlTFUdykMGebd/NqB9Xzsk8+HXgV4zyu0hKrxoHxv1QkHLaOmOkWFG
	 ekQHweWgtqXug==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2Zxw462160551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 10:35:59 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
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
Subject: [PATCH v17 4/9] clk: realtek: Add support for gate clock
Date: Tue, 24 Nov 2026 10:35:52 +0800
Message-ID: <20261124023558.4088635-5-eleanor.lin@realtek.com>
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

Introduce clk_regmap_gate_ops supporting enable, disable, and is_enabled
for standard regmap gate clocks. To accommodate hardware designs, the
enable and disable operations handle a 'write_en' flag, which asserts an
adjacent write-enable bit (bit_idx + 1) simultaneously when modifying the
gate bit.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v17:
- Return 0 instead of the error code from '.is_enabled()'.
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
index 000000000000..094cd18660c5
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
+		return 0;
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

