Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90154D90B7;
	Fri,  9 Oct 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543617; cv=none; b=FAGpfw6kBX+bNudyZPfQ4/YfrzMSO3GJ/EkCw5cnXJi7k7+u1lotrP4ooQWYkbf/rA6x6dDgY9S0e2j6S25SihUdYooGDloLx7ZRITCFybdNKd1XEf4S91r/ggqyhrHMRrRLnmvvNLFoomBJ5yuvBBmKUYUNGNkG2DIhcY/zfVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543617; c=relaxed/simple;
	bh=TA4UvtPaI6N/mD+iZIrCt55LdDwZ1OZdGI9FuRlVZFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBFirf8xWgkOGCe4A7egyLOQRil9l5lFuceKKr0hRMWBq8GWELuReudeKn2SCKy+0Q2ZzqVUu1zq7SS3MePJ1TPu7HBeKAZBp0FevLQt41Gtk/WdMH37uwOnpIo6J8weSu2vLqKBNMZaVSoJWoXadsUVRyd6sF4RNhUjjZIUcU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDE/ba7y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDE/ba7y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AAD2C2BCFA;
	Fri,  9 Oct 2026 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791543616;
	bh=TA4UvtPaI6N/mD+iZIrCt55LdDwZ1OZdGI9FuRlVZFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tDE/ba7y2l2wg5NNUNPOdRC7L+TRGEWxvjfv/BJqX2Ak+PjQ56V2eMyWhSncbqOp+
	 5GvaiRswAq8kSXbV7fQCGL9KoPv41kGHbDruu80tqiaprfIOsDpraiuMZncbP89X+f
	 +usPJ8P3Wf3TUvOSpWXdPMBTLnco1hHaT2Ocnhv1A9Xg8LCOveJtfjNQNKq3hPa1pG
	 IvnVS+wLhcOLKbzDTc2b8QKmNb6y5oF5HJwfEzBuEmiMpewUE0EPDigXVXSV8aG0xK
	 M7KxJsdFSyOAHD6i+oCobzz3zNGWtUfF7q7BKyerx2IVozFCm4AGcsPprbyNNMM2mi
	 wl5m0muyPh1DQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A06ECA601E;
	Fri,  9 Oct 2026 11:00:16 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 09 Oct 2026 19:00:12 +0800
Subject: [PATCH 1/2] dt-bindings: clock: add Ambarella CV75 RCT
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-cv75-clk-v1-1-6959b4da83c5@ambarella.com>
References: <20261009-cv75-clk-v1-0-6959b4da83c5@ambarella.com>
In-Reply-To: <20261009-cv75-clk-v1-0-6959b4da83c5@ambarella.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543615; l=2969;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=gEKr05f9YAOrNVHJfKB47io9QNiMkJyDyO/ZJBUGYg0=;
 b=9ifyNGSYZw1hELuTMZVEWpRcl6+nTXyVXuwhzllQpzK0yY0F3xMXR2AkfnNgz597p8+PYMMXV
 suigFi4KPhZCtOZXg51dnHbmUKX9b8efsRBRodmbh29WkGOwlIKVSiM
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Document the CV75 RCT clock controller and the clock ID header used by
DT consumers.

Document #reset-cells for the RCT reset-provider role. Soft-reset line
IDs and the reset provider driver are deferred; this series has no
resets= consumers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../bindings/clock/ambarella,cv75-rct.yaml         | 64 ++++++++++++++++++++++
 include/dt-bindings/clock/ambarella,cv75-rct.h     | 14 +++++
 2 files changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
new file mode 100644
index 000000000000..be89bd75f9e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ambarella,cv75-rct.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella CV75 RCT Clock Controller
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+description: |
+  The RCT (Reset and Clock Tree) block on the Ambarella CV75 SoC provides
+  PLLs, clock muxes, dividers and soft-reset controls for on-chip
+  peripherals.
+
+  The same register region is also exposed as a syscon for other SoC
+  blocks (e.g. pin drive-strength), hence the "syscon" compatible.
+
+  Clock indices are defined in include/dt-bindings/clock/ambarella,cv75-rct.h.
+
+properties:
+
+  compatible:
+    items:
+      - const: ambarella,cv75-rct
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Reference crystal oscillator (typically 24 MHz)
+    maxItems: 1
+
+  clock-names:
+    const: osc
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@ed080000 {
+        compatible = "ambarella,cv75-rct", "syscon";
+        reg = <0xed080000 0x1000>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/ambarella,cv75-rct.h b/include/dt-bindings/clock/ambarella,cv75-rct.h
new file mode 100644
index 000000000000..b3e965b4ff2e
--- /dev/null
+++ b/include/dt-bindings/clock/ambarella,cv75-rct.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2026 Ambarella, Inc.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMBARELLA_CV75_RCT_H
+#define _DT_BINDINGS_CLOCK_AMBARELLA_CV75_RCT_H
+
+#define CV75_GCLK_UART0		0
+#define CV75_GCLK_CORE		1
+#define CV75_GCLK_AHB		2
+#define CV75_GCLK_APB		3
+
+#endif

-- 
2.34.1


