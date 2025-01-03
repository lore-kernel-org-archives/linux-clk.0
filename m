Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD98D1B0F1B;
	Fri,  3 Jan 2025 05:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735882605; cv=none; b=kC8dqsFNq/8USl8YR2wGaMJPYLDNxzRSbg5QbisobSII0sAnYxrFxIZVMpCiNwgxVTk6hQtPATKYtSyvidNFBWt7eOMJ20MXNfTwDnbrrCyvVCao4fWX+NsgrWIe7jacl2eT9q9FToqYiK0/OSd7bVAhbcK8M+9alXNxzfjsgMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735882605; c=relaxed/simple;
	bh=x8urYIK5sFLtIVXbbo4Wrpu2tgHxWoqjUUn0IGrGxU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AzMpT6rAxW3sgT0iwEM6v0hMCwDkdtUQwL3rIhoLS6H7FpLqGyR7qtccTh2JoMDPfapW/uo8GYZVP6Whq/B/cQSxGtQUh5KG5DclHzMEXTXBSNR0eoUpAq6xi3lNejzkFSFBgevUi3sc2KEE7WMOdRHY6q8EzSoXIS5Kewqi0kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIPqVh+j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIPqVh+j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68E25C4CEDF;
	Fri,  3 Jan 2025 05:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735882605;
	bh=x8urYIK5sFLtIVXbbo4Wrpu2tgHxWoqjUUn0IGrGxU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lIPqVh+jRnmYzd9jw7U3fEAgDjpZzqtraGjuPJFD6YrShnkU1g+B4I2AYR0Mm7Q77
	 nu9AsF5P2u6P2Ouw608PR5TWm2p79Jo2/4hdz8i1sO/ILSgXgykq+Z+6uzKXu395aS
	 vM8RLLIe/+MfocIQ8gCkDdKCfK81C4BYcNRcxzpILcwIWat1Pg8JvlJB5CHnNX5rs7
	 HsQX5pS8Jt9dtWESlEMR484LcWOhpCJqSR6UH+vM8m5icY5nm5Nr7HZ6xF/25bNpHh
	 ETpP2DAkA2UJx3UXSTSD90hYPdcRhlUxW/xyJwDidFVxLtIUliqclPH/vUthvu7wKe
	 EjE73GFOXaT0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C50BE77198;
	Fri,  3 Jan 2025 05:36:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 03 Jan 2025 13:36:42 +0800
Subject: [PATCH v3 2/5] dt-bindings: clock: add Amlogic A5 PLL clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-a5-clk-v3-2-a207ce83b9e9@amlogic.com>
References: <20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com>
In-Reply-To: <20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735882602; l=3243;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=EeZwVyI94nE/gmyVkiXMdtJ16ZeHVSh6rsbwZ6HyNSk=;
 b=oDjFXDpZmgpLrzjsI/z6+ZIYYP9bVXufb/f7FE+5dYlWiWwRkkeLQdjSVJ22uSIFruPnE+Vff
 3ugO16uBk0bCO7/ea36XNCoyF037NzBj/mDdgXDJdK8ruNzboCpUa2S
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the PLL clock controller dt-bindings for Amlogic A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/clock/amlogic,a5-pll-clkc.yaml        | 63 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,a5-pll-clkc.h    | 24 +++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a5-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a5-pll-clkc.yaml
new file mode 100644
index 000000000000..d74570a90926
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a5-pll-clkc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a5-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A5 series PLL Clock Controller
+
+maintainers:
+  - Chuan Liu <chuan.liu@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+properties:
+  compatible:
+    const: amlogic,a5-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input oscillator
+      - description: input fix pll dco
+      - description: input fix pll
+
+  clock-names:
+    items:
+      - const: xtal
+      - const: fix_dco
+      - const: fix
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,a5-scmi-clkc.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@8000 {
+            compatible = "amlogic,a5-pll-clkc";
+            reg = <0x0 0x8000 0x0 0x1a4>;
+            clocks = <&xtal>,
+                     <&scmi_clk CLKID_FIXED_PLL_DCO>,
+                     <&scmi_clk CLKID_FIXED_PLL>;
+            clock-names = "xtal",
+                          "fix_dco",
+                          "fix";
+            #clock-cells = <1>;
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,a5-pll-clkc.h b/include/dt-bindings/clock/amlogic,a5-pll-clkc.h
new file mode 100644
index 000000000000..a74c448a8d8a
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a5-pll-clkc.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Chuan Liu <chuan.liu@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_A5_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_A5_PLL_CLKC_H
+
+#define CLKID_MPLL_PREDIV			0
+#define CLKID_MPLL0_DIV				1
+#define CLKID_MPLL0				2
+#define CLKID_MPLL1_DIV				3
+#define CLKID_MPLL1				4
+#define CLKID_MPLL2_DIV				5
+#define CLKID_MPLL2				6
+#define CLKID_MPLL3_DIV				7
+#define CLKID_MPLL3				8
+#define CLKID_GP0_PLL_DCO			9
+#define CLKID_GP0_PLL				10
+#define CLKID_HIFI_PLL_DCO			11
+#define CLKID_HIFI_PLL				12
+
+#endif  /* _DT_BINDINGS_CLOCK_AMLOGIC_A5_PLL_CLKC_H */

-- 
2.37.1


