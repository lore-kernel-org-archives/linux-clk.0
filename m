Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F62139A815;
	Fri, 23 Jan 2026 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769147707; cv=none; b=XmI3OkO7WSTe721vL9+hu6FrnY3WEp/3y1eaL6DNfCqg9ja3Ixjz4qZIFd3c1Gl+OpZPx5WnpqyxNprst2pPeuHfvHgfxnhjT0QU2r4t6whnQaXIS4bVoRcUx2R/ihP7HBb0F6aQWCih+XuN142F60w2qfpG1FdsF2Fzx4LkhWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769147707; c=relaxed/simple;
	bh=GDS2hOEC3ZDMsbfoCk7m1oWy+PAW91PnnU7hk34o6d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSbu/c5cDmAKhWzU5nMMBO/yE/eb6TR0E8xqhe4aQuy5tyuklJt9t8pH6VT9SNSuz0DPbOZsnceoNLVHaNY/va7KtY7tfKSUdgk24BnkVBGMe3+pG2KhRrzAKwKRAH7pjKRgKSM6TyPJjISnV6QhJXKph4VmIwdFgdTLry7Eu70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUPfANag; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUPfANag"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFF28C2BC86;
	Fri, 23 Jan 2026 05:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769147706;
	bh=GDS2hOEC3ZDMsbfoCk7m1oWy+PAW91PnnU7hk34o6d0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lUPfANag5v5XJz3BTzz7+i+TFyaMYz0jgg0LQHxL/7jjLEuX/YmVSOQemAAH6ppM2
	 Pb8m+ub7g5lyBAvc3OocTk/U8L+5nW3nAOdY2Wx7arkrnhJb4H01BOc0uM5T6PH/6B
	 xnekjRA4lCv3Oe/jAzt6c73UjYfC+6tKamgoFxKdjckkZN3YzLS27n98+qp7etQ0Qz
	 w+47H5IutHHXEnkOpYML5Ej9t4q6/b0lqWBhzBuS+PzIfmDpozmKb7iHO0tmS5guCr
	 HIRMMx/jhgKWb8SkEO/e3c5tONOC82GxBtosT9u+GfxIlOKiikZ32pbHiALPB/TL0G
	 BfkJCEyMMSeUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C39D6CFD8;
	Fri, 23 Jan 2026 05:55:05 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 23 Jan 2026 13:54:56 +0800
Subject: [PATCH v6 2/5] dt-bindings: clock: Add Amlogic A5 PLL clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-a5-clk-v6-2-6d3bbf0ec1ea@amlogic.com>
References: <20260123-a5-clk-v6-0-6d3bbf0ec1ea@amlogic.com>
In-Reply-To: <20260123-a5-clk-v6-0-6d3bbf0ec1ea@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769147703; l=3306;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=L2WtYBPXP83bh/la2DnEiOjTXuQi8+YFfWCWfb93CxI=;
 b=vuuPPxdyvw3/zMxfvz11tmF9q5N5+rflhGVlRniW+YnGvMOINyZN6wQr5joJJSjZqBj2EOHz5
 q1BGC4vd/v5ATT0aYIqeXQn9ZgyUX7bAHqgVBF9X7HVgdpg2YUP62Of
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the PLL clock controller dt-bindings for the Amlogic A5 SoC
family.

Co-developed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
2.42.0


