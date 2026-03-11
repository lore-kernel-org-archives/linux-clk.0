Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A636C9FC;
	Wed, 11 Mar 2026 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239571; cv=none; b=guqxTDHPIki84mD2ESGOAXyk80PwCvcdPvhx8Xr68ap3xFvsHL3iqVAFpkFR0RItQu7tbHudCkw63sHG5eDue+sMZRIugFeDdzDcUM7pJn9a3busrvat0HiTx0NRQE0hL8dOk4AEWaAGC79opaXj2IAW4JUJbEemOsEpe3IPQz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239571; c=relaxed/simple;
	bh=VCZVp08QKu1CH7Ywbc7ClG0sZyA8DWEa4teZCiebNPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9uO64id9Oq3mI8DhUsA8d8uA4KAgUgjSKfiFr9oymdSoXT2zLSNd4Fc0Ey4he6T9laMDid31jodVll37lXZD/PJMDvCfQlwpYYtZR8YRRWEaZQxKwbFxxirwmWj1nmJhijW8fOyRv8Jejxmcicp/LSW07DncJxNlegtfYvSSQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=IH92FAr9; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="IH92FAr9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4gKXZt44Ma4GCBaMG/hFnAdxzDG8bWPvFE9vNwevguM=; b=IH92FAr98PmZwaoaBpUpFq08eX
	vVXwRfz7oN3MkPZA9F8x8BqeIWRtkjy2IZlbOMuf1ogiDPfzL55d8+QCsChSqKQVzU/rhxGmiDOXC
	lPhSU/41zIgoeBBEhGpxxtQPdDWb3NiBS9mNm/Zzcc1C2S5IxrxbxLh4O3DH0KPAMj2djDrKEDh+b
	pd3eE8dYMCYOAm8yEa17FHfLTsZVTOU8hVnOHFvA0hgHgeGzqQYOyHUB4F/plE9kSIiqpXFD/7TBD
	ktvmHwbhFkACoIzrKNjfDiu9GWpe40bcXwIYHAm7xa+xj3Zdl5goN68DYUSb+ePvFKYNgbdO5m9gr
	PbWIpGNw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KcC-000OuR-2p;
	Wed, 11 Mar 2026 15:32:48 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KcC-000GoI-0i;
	Wed, 11 Mar 2026 15:32:48 +0100
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
Subject: [PATCH 4/6] arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display overlay
Date: Wed, 11 Mar 2026 15:32:07 +0100
Message-ID: <20260311143217.1700704-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
References: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)

This adds support for Tianma TM070JVHG33 LVDS display on interface X11/X12
on MBa91xxCA.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
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
index 0000000000000..02b9afae44c39
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
+
+&dpi_bridge {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgbdisp>;
+	status = "okay";
+};
-- 
2.43.0

