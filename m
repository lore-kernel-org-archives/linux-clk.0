Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DBC365A07;
	Fri, 13 Mar 2026 07:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385670; cv=none; b=GixPNrtVWPFcM4JxGTYMaNWgCI+7uZEqhcAgDPUA7zZ32wrN2ZiVQ9FdatbuP9WASfl7rRehYowy19OFqG3ABxu9bNP8P0xGfSR91kxFgSctqW6pyNYMZK3stDHg+tQArg3m8ZyjPq3vL8J+uWBNcUs61MAPnkCAx+xRX5E7cZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385670; c=relaxed/simple;
	bh=FBp2U0+HCUDE1YBt1GRaeVO3oF0tQkBzYjJK89718AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qu4oio1W5w4F2/TmchbIMydtQx+1YdkFGfLK0Af9lQ5GJO9O2Sc0eI/hAbPk977NrNrrzw1mOV9T6Q00RvH4tOnXnOI6VytEr07QIT+4qX/Jbbnorm1hOYiy/dpFqubtqv+gr7SqjL7TKlqSV5Fp5a5rpSlXW4XduD+OF4YbWGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Uv9AjC8S; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Uv9AjC8S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6du/L/MJ4bguBUwZ+xORG09S4c1F+LA/m1LwoB1H6xA=; b=Uv9AjC8SoTBsH9Rfc4sNMue0FM
	WVTvdMWsyN7ez8nvykX8/QikRJTz9k+Ia9O6YgRDqDC2+RAXqrWjF/hbRiMOpnUUZ7Co4Y00N1qkT
	hz/0OkPa0430zjYsNodxMvPdAkj1NYF3j0ZXcNNgcCMw5K753KS39CXCVa/Sd3Z9hgfx1tQwpLN+I
	jCMwKLyD4KH+iG7k7IBZG9l0iZeeF6+6xn8SRuzl0mXnTdzM8uFFUFeSkJsePwA1XpPho0VzB7hzC
	YLciQyms5PTOxfFqF5x+Nx2dbGsh+RXrGEW1VR0hbYqEvkNCgWIr1HF23QZ22StkqD2ws5CWvOzTy
	FdasFWYw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcd-000CWM-30;
	Fri, 13 Mar 2026 08:07:47 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcd-000IYT-0v;
	Fri, 13 Mar 2026 08:07:47 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display overlay
Date: Fri, 13 Mar 2026 08:07:34 +0100
Message-ID: <20260313070740.585043-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)

This adds support for Tianma TM070JVHG33 LVDS display on interface X11/X12
on MBa91xxCA.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Sort nodes

 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 ...3-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso | 56 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3547f1dd84467..24d5b0c2ddafb 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -456,7 +456,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 
+imx93-tqma9352-mba91xxca-lvds-tm070jvhg33-dtbs := imx93-tqma9352-mba91xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
 imx93-tqma9352-mba91xxca-rgb-cdtech-dc44-dtbs := imx93-tqma9352-mba91xxca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..40a519e9c91e9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2023-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include <dt-bindings/clock/imx93-clock.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight {
+	status = "okay";
+};
+
+&display {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
+
+&dpi_bridge {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgbdisp>;
+	status = "okay";
+};
+
+&dpi_to_panel {
+	remote-endpoint = <&lvds_encoder_input>;
+};
+
+&lcdif {
+	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>;
+	assigned-clock-rates = <477400000>;
+	status = "okay";
+};
+
+&lvds_encoder {
+	status = "okay";
+};
+
+&lvds_encoder_input {
+	remote-endpoint = <&dpi_to_panel>;
+};
+
+&lvds_encoder_output {
+	remote-endpoint = <&panel_in>;
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&panel_in {
+	remote-endpoint = <&lvds_encoder_output>;
+};
-- 
2.43.0

