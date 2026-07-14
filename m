Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EF135F60E;
	Tue, 14 Jul 2026 01:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783992910; cv=none; b=ZqxoUq1+wfMp+kspDwJLCHQgM+Qlm0gKQA6w4s6qL3wnq4EPNW18k4IciTbxdKGhPNuEjSzXWPXlrC4LvAR68/gH1QqyCya39ng+7OUfALgHQHnjvAYdC9Cear8FOPOvjoCXr660V789fcR8H//svNYv0qjybQ21Xanpv+EfxtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783992910; c=relaxed/simple;
	bh=ndlFAPnsB0Fq6i2L0rhg60nuodlsSu9z7E3c34glIHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RB8KRpkSEMsOgpAWMcpdUQxfJEpIUlUqiVm7/+BH/yc5t/OymaaebZPazZtNaj/TW6c4ktXStchJwZ13ojKAZMyAXvo7oS5OqCYvNiJ1Tf59HP+xyCxazvE2WXXOhqIRkgsbbRGi/KGXsVc2YCGJFTPr9AAixeZipnMjPn1tMfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goXFN69t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goXFN69t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6FC7C2BCF5;
	Tue, 14 Jul 2026 01:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783992909;
	bh=ndlFAPnsB0Fq6i2L0rhg60nuodlsSu9z7E3c34glIHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=goXFN69tZfC1JeCcE6kHSIaSMoHn6FzOrZWEw+cr9IMMKBa8MsFvHaioimx2L6MQR
	 N6KYCLap11eocXBuhMBpNGQi0ZSvTZ8cKFE3NfBrOTi6my4UA27f7egsaiykDzenxm
	 qesfojp1JvpD7rEwCcen9/l55dXcryyIJYnNVblh0AtQd3y3JaumCvzc69j/HAMgrX
	 JSfunSauYbraMzdeI48tadqeavZSi7oIqXwfYs4rn6ucAVAFQ8KRO/qziau7Emj73Y
	 WagjnwpF8gzUOlnPv5g5pBXXWRRpGYfGMQUg9ptqqbLRHW2ncerrxSOagi+D8OBeym
	 TzMpL0Q7QXU2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97C6C44508;
	Tue, 14 Jul 2026 01:35:09 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Tue, 14 Jul 2026 09:35:08 +0800
Subject: [PATCH v3 2/3] dt-bindings: clock: ultrarisc: Add DP1000 Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-ultrarisc-clock-v3-2-4b1ccaa26b37@ultrarisc.com>
References: <20260714-ultrarisc-clock-v3-0-4b1ccaa26b37@ultrarisc.com>
In-Reply-To: <20260714-ultrarisc-clock-v3-0-4b1ccaa26b37@ultrarisc.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783992908; l=4082;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=hAYITNry4LyDjLKPqs+Vj2CAziH/un6ry4g7V+jxfJw=;
 b=M3WkSIcreWFF8Dnzm6cgfgu0rPe0JYKA5S+JOmNwQfaD5gsCBm0wMu0ycMSDfnflh5Bl+JKAt
 wvnSshtjZV0Dfy5dxd1CTWRNV7fDbyaYwAuevh4uW+rl+S8Ajzeo4cc
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Add doc for the clock controller on the UltraRISC DP1000 RISC-V SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/ultrarisc,dp1000-clk.yaml       | 60 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 include/dt-bindings/clock/ultrarisc,dp1000-clk.h   | 27 ++++++++++
 3 files changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml b/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
new file mode 100644
index 000000000000..ede565ec440c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ultrarisc,dp1000-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UltraRISC DP1000 Clock Controller
+
+maintainers:
+  - Jia Wang <wangjia@ultrarisc.com>
+
+description: |
+  The UltraRISC DP1000 clock controller is driven from a single external
+  oscillator input. It provides a system PLL with fractional multiplier
+  and post-divider stages, several fixed-ratio derived clocks for
+  the on-chip subsystem, Clock Configuration Register (CCR) divider
+  outputs for GMAC and the UART, I2C, and SPI root clocks, and
+  per-instance gate clocks for UART0-3, I2C0-3, and SPI0-1.
+
+  All available clocks are defined as preprocessor macros in
+  include/dt-bindings/clock/ultrarisc,dp1000-clk.h
+
+properties:
+  compatible:
+    const: ultrarisc,dp1000-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      External oscillator input clock used as the parent of the PLLs.
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ultrarisc,dp1000-clk.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@11080000 {
+        compatible = "ultrarisc,dp1000-clk";
+        reg = <0x0 0x11080000 0x0 0x1000>;
+        clocks = <&osc>;
+        #clock-cells = <1>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 806bd2d80d15..d646707bb17f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27671,6 +27671,13 @@ S:	Maintained
 F:	drivers/usb/common/ulpi.c
 F:	include/linux/ulpi/
 
+ULTRARISC DP1000 CLOCK DRIVER
+M:	Jia Wang <wangjia@ultrarisc.com>
+L:	linux-clk@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
+F:	include/dt-bindings/clock/ultrarisc,dp1000-clk.h
+
 ULTRARISC DP1000 PINCTRL DRIVER
 M:	Jia Wang <wangjia@ultrarisc.com>
 L:	linux-gpio@vger.kernel.org
diff --git a/include/dt-bindings/clock/ultrarisc,dp1000-clk.h b/include/dt-bindings/clock/ultrarisc,dp1000-clk.h
new file mode 100644
index 000000000000..751125f99965
--- /dev/null
+++ b/include/dt-bindings/clock/ultrarisc,dp1000-clk.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H
+#define _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H
+
+#define DP1000_CLK_SYSPLL		0
+#define DP1000_CLK_SYSPLL_DIV2		1
+#define DP1000_CLK_SUBSYS		2
+#define DP1000_CLK_GMAC			3
+#define DP1000_CLK_UART_ROOT		4
+#define DP1000_CLK_I2C_ROOT		5
+#define DP1000_CLK_SPI_ROOT		6
+#define DP1000_CLK_PCIE_DBI		7
+#define DP1000_CLK_PCIEX4_CORE		8
+#define DP1000_CLK_PCIEX16_CORE		9
+#define DP1000_CLK_PCIE_AUX		10
+#define DP1000_CLK_UART0		11
+#define DP1000_CLK_UART1		12
+#define DP1000_CLK_UART2		13
+#define DP1000_CLK_UART3		14
+#define DP1000_CLK_I2C0			15
+#define DP1000_CLK_I2C1			16
+#define DP1000_CLK_I2C2			17
+#define DP1000_CLK_I2C3			18
+#define DP1000_CLK_SPI0			19
+#define DP1000_CLK_SPI1			20
+
+#endif /* _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H */

-- 
2.34.1


