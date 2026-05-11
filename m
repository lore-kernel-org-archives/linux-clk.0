Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A21B2E62AC;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503657; cv=none; b=dT2bQOl6Fzr2Y+4ms00CFQ3Cpw899j2Dy+o9/sDkW222oyM0lvQHfc/1D2jYU2ZEcvDgzKCDtjuAj0MPpU12kTWLXaywrFbaLtETeuHFcud3oT2FVNU54fnzkg4NPnbuOwrvP6jsi0qnftpWPBEQhC7lNzOWwATlGXes0oXx/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503657; c=relaxed/simple;
	bh=SQlj6jkwDCbT3jRiT47QIwFmoJqrzaaVVRfy35hEhdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUMg0WzeBAOQ6KIoNZFc7bAYKsHNzag+chcD6eCC48Cr2rt8X9w2M4QN5OmF9H8rZcqBGHj+dTtBtskbMRPL8wetTBBVzlKcHFAIQ5QwTP6gddw+oKF1IfSDRsFCWX62pWRDjCMjPK4DThZ7Tdd12hahSFKMwIq+rX5wg5lD26Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmNim4Tf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmNim4Tf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B052C2BCC9;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778503657;
	bh=SQlj6jkwDCbT3jRiT47QIwFmoJqrzaaVVRfy35hEhdA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VmNim4TfIyilMKSqPJwvRlVIZ4JGwR9/13L4Mut3K4JCFFvK/fBxkR2zjlRSDXBmy
	 3Bp+AOTWc2t5BI6ydvNxq+mOxRBJdbr4ice/X22KnAm4yTI11pnNZKqtajJwAxj58G
	 odBzSijo6Oh+uqyP9+5HWU75qIziCzunqX86+U7JJebfMpcSBUhcODh10wx2lCZvbg
	 /ozU5pSRA96c6b5s8KmvKqPwF/nyMy0oKoAtrvMqm+G+0pEBN0p8OnvRUBlJ/7lzr5
	 J4co1KUZ3nkwbfEYWNZcZrVTp2ArOiSzOMXHdcKt3+r7m+n0tCb56OS+g+RD1XjazI
	 6H+VYkBN+moSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B057CD37AC;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Mon, 11 May 2026 20:47:24 +0800
Subject: [PATCH 02/10] dt-bindings: clock: Add Amlogic A9 PLL clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-b4-a9_clk-v1-2-41cb4071b7c9@amlogic.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
In-Reply-To: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503655; l=4908;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=Dw8+4rmGWhvklI0IY1bbxEsDvxGe4eMGmJlQnz5m84Y=;
 b=ogxseIgSy3HtgVEp/52GBBk8CaS6blwg0OHeB60EnMhfT8H4FyIVBPtYGOCeE9i5zc3QM/Ial
 GukT4dDtT98C7/VQHgf+rAJoxoEiCh5jXrc+cR6SC3fMfn69d6baAVM
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

From: Jian Hu <jian.hu@amlogic.com>

Add the PLL clock controller dt-bindings for the Amlogic A9 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../bindings/clock/amlogic,a9-pll-clkc.yaml        | 110 +++++++++++++++++++++
 include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |  55 +++++++++++
 2 files changed, 165 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
new file mode 100644
index 000000000000..4ee6013ba1a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a9-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A9 Series PLL Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jian Hu <jian.hu@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,a9-gp0-pll
+      - amlogic,a9-hifi0-pll
+      - amlogic,a9-hifi1-pll
+      - amlogic,a9-mclk0-pll
+      - amlogic,a9-mclk1-pll
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: pll input oscillator gate
+      - description: fixed input clock source for mclk_sel_0
+      - description: u3p2pll input clock source for mclk_sel_0 (optional)
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: in0
+      - const: in1
+      - const: in2
+    minItems: 1
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,a9-mclk0-pll
+              - amlogic,a9-mclk1-pll
+
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+
+        clock-names:
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,a9-gp0-pll
+              - amlogic,a9-hifi0-pll
+              - amlogic,a9-hifi1-pll
+
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    apb4 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@8200 {
+            compatible = "amlogic,a9-gp0-pll";
+            reg = <0x0 0x8200 0x0 0x20>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk 0>;
+            clock-names = "in0";
+        };
+
+        clock-controller@8330 {
+            compatible = "amlogic,a9-mclk0-pll";
+            reg = <0x0 0x8330 0x0 0x14>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk 4>,
+                     <&scmi_clk 8>;
+            clock-names = "in0", "in1";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,a9-pll-clkc.h b/include/dt-bindings/clock/amlogic,a9-pll-clkc.h
new file mode 100644
index 000000000000..31edb0bc95e7
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a9-pll-clkc.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __AMLOGIC_A9_PLL_CLKC_H
+#define __AMLOGIC_A9_PLL_CLKC_H
+
+/* GP0 */
+#define CLKID_GP0_IN_DIV2_DIV		0
+#define CLKID_GP0_IN_DIV2		1
+#define CLKID_GP0_PLL_DCO		2
+#define CLKID_GP0_PLL			3
+
+/* HIFI0 */
+#define CLKID_HIFI0_IN_DIV2_DIV		0
+#define CLKID_HIFI0_IN_DIV2		1
+#define CLKID_HIFI0_PLL_DCO		2
+#define CLKID_HIFI0_PLL			3
+
+/* HIFI1 */
+#define CLKID_HIFI1_IN_DIV2_DIV		0
+#define CLKID_HIFI1_IN_DIV2		1
+#define CLKID_HIFI1_PLL_DCO		2
+#define CLKID_HIFI1_PLL			3
+
+/* MCLK0 */
+#define CLKID_MCLK0_IN_DIV2		0
+#define CLKID_MCLK0_PLL_DCO		1
+#define CLKID_MCLK0_0_PLL		2
+#define CLKID_MCLK0_0_PRE		3
+#define CLKID_MCLK0_0_SEL		4
+#define CLKID_MCLK0_0_DIV		5
+#define CLKID_MCLK0_0			6
+#define CLKID_MCLK0_1_PLL		7
+#define CLKID_MCLK0_1_PRE		8
+#define CLKID_MCLK0_1_SEL		9
+#define CLKID_MCLK0_1_DIV		10
+#define CLKID_MCLK0_1			11
+
+/* MCLK1 */
+#define CLKID_MCLK1_IN_DIV2		0
+#define CLKID_MCLK1_PLL_DCO		1
+#define CLKID_MCLK1_0_PLL		2
+#define CLKID_MCLK1_0_PRE		3
+#define CLKID_MCLK1_0_SEL		4
+#define CLKID_MCLK1_0_DIV		5
+#define CLKID_MCLK1_0			6
+#define CLKID_MCLK1_1_PLL		7
+#define CLKID_MCLK1_1_PRE		8
+#define CLKID_MCLK1_1_SEL		9
+#define CLKID_MCLK1_1_DIV		10
+#define CLKID_MCLK1_1			11
+
+#endif  /* __AMLOGIC_A9_PLL_CLKC_H */

-- 
2.47.1


