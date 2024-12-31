Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F3718871D;
	Tue, 31 Dec 2024 06:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735625773; cv=none; b=Zq4SVzY+qCqAaMSgP2sTbb9ncwKxC9CEkIHlNj1ToEStEtBzjsUs56IVrt5vjJZua6nXlQkf2nw7HWUNWesUgX7rFMGS4iRqHR9k3L8UQ7soQ/dmCk22cASEauekwuyz98R+I+Ktn+lrlZV1O8kZ8o7/Yv0jlGb1ZgfCL51AdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735625773; c=relaxed/simple;
	bh=mGcTX+mcFIbwnqnkk4FLFzrEIJLDW5PEtTGy3GCLVwA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFOtYQCFYlr2H2zSvEsW+U7sHhqpzzSDKgGD29iH1WaFNB+t72cgYav16VJGj2shAUGnxCt6YANYfmwHm6ZAx+JF6aIUUDJIXg5sDIddra5cGV++HtVWK/25QL7JJH75BliighU2E6sW8r64Jf0KgkKcVWoatyukCI5vXOvWZMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Tue, 31 Dec 2024
 14:00:51 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock controller
Date: Tue, 31 Dec 2024 14:00:44 +0800
Message-ID: <20241231060047.2298871-3-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231060047.2298871-1-jian.hu@amlogic.com>
References: <20241231060047.2298871-1-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 include/dt-bindings/clock/amlogic,t7-scmi.h | 48 +++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h

diff --git a/include/dt-bindings/clock/amlogic,t7-scmi.h b/include/dt-bindings/clock/amlogic,t7-scmi.h
new file mode 100644
index 000000000000..aa2431ea72ed
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,t7-scmi.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Jian Hu <jian.hu@amlogic.com>
+ */
+
+#ifndef __T7_SCMI_CLKC_H
+#define __T7_SCMI_CLKC_H
+
+#define CLKID_DDR_PLL_OSC			0
+#define CLKID_AUD_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_TCON_PLL_OSC			3
+#define CLKID_USB_PLL0_OSC			4
+#define CLKID_USB_PLL1_OSC			5
+#define CLKID_MCLK_PLL_OSC			6
+#define CLKID_PCIE_OSC				7
+#define CLKID_ETH_PLL_OSC			8
+#define CLKID_PCIE_REFCLK_PLL_OSC		9
+#define CLKID_EARC_OSC				10
+#define CLKID_SYS1_PLL_OSC			11
+#define CLKID_HDMI_PLL_OSC			12
+#define CLKID_SYS_CLK				13
+#define CLKID_AXI_CLK				14
+#define CLKID_FIXED_PLL_DCO			15
+#define CLKID_FIXED_PLL				16
+#define CLKID_FCLK_DIV2_DIV			17
+#define CLKID_FCLK_DIV2				18
+#define CLKID_FCLK_DIV2P5_DIV			19
+#define CLKID_FCLK_DIV2P5			20
+#define CLKID_FCLK_DIV3_DIV			21
+#define CLKID_FCLK_DIV3				22
+#define CLKID_FCLK_DIV4_DIV			23
+#define CLKID_FCLK_DIV4				24
+#define CLKID_FCLK_DIV5_DIV			25
+#define CLKID_FCLK_DIV5				26
+#define CLKID_FCLK_DIV7_DIV			27
+#define CLKID_FCLK_DIV7				28
+#define CLKID_FCLK_50M_DIV			29
+#define CLKID_FCLK_50M				30
+#define CLKID_CPU_CLK				31
+#define CLKID_A73_CLK				32
+#define CLKID_CPU_CLK_DIV16_DIV			33
+#define CLKID_CPU_CLK_DIV16			34
+#define CLKID_A73_CLK_DIV16_DIV			35
+#define CLKID_A73_CLK_DIV16			36
+
+#endif /* __T7_SCMI_CLKC_H */
-- 
2.47.1

