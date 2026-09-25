Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A65E501F4D;
	Fri, 25 Sep 2026 22:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376974; cv=none; b=jWSF275GcezOdxLMUGmF2iUw1hI3jraPZ9vIVuEOT8CB/DAVg/ZxsVHqocr48AeEWzsw1G57cw+Ly6pc2kfNBGPIifES2GTeVDlmFecNTIZHMY241Ck4oBldZBQSzYBclxpeNm91wTi8bvFCeGXb5Zwn+PRM+J0zhIXcj3HDrZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376974; c=relaxed/simple;
	bh=3blP0nDMtGN6vIpTbQx5TZFpZ7wvhmdDuk7aLl94D6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GC1BAfSwCFmdTJIrvNyi5R5TGbaCqkGARNKXt7/JXRb8+bJdwvzyXkdAKsNvjkUbdEjLTkuA12ueYf51rGXi/00nFTIHYdR0hzSqhZ4BUk2dCtCkbuuIXIOsFPvflIDKc2IZemZwtFsDZn/vnaG1nIjc4g8Mba9LfN86a9npS/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ch2MCgeR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ch2MCgeR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D055C169C;
	Fri, 25 Sep 2026 15:56:06 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 847D13F632;
	Fri, 25 Sep 2026 15:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790376970; bh=3blP0nDMtGN6vIpTbQx5TZFpZ7wvhmdDuk7aLl94D6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ch2MCgeRNQuiON+68rcbbb1+lleArxnuaZiRb/vxJl69WhNsvrBnGE+afWZP6d3kr
	 9qlTxF4HXyAlE1Xfi8rwBIGbAT4phq4kPTy/oj4mLFMjpF1aRl061uZus9VuNiObNr
	 B4LXW0zlGp+GmcFVxcBoJTW+nZCvvglCa2NTgctk=
From: Andre Przywara <andre.przywara@arm.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 2/4] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU CCU clock controller
Date: Sat, 26 Sep 2026 00:51:10 +0200
Message-ID: <20260925225112.14081-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260925225112.14081-1-andre.przywara@arm.com>
References: <20260925225112.14081-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are four clock controllers in the A523 SoC, but only three are
described in the DT binding so far.

Add a description for the CPU CCU, which provides separate clocks for
the two CPU clusters and the DSU interconnect.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../clock/allwinner,sun55i-a523-ccu.yaml      | 38 ++++++++++++++++++-
 .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 +++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
index 58be701a720ea..8d5481fb63ae8 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - allwinner,sun55i-a523-ccu
+      - allwinner,sun55i-a523-cpu-ccu
       - allwinner,sun55i-a523-mcu-ccu
       - allwinner,sun55i-a523-r-ccu
 
@@ -35,12 +36,23 @@ properties:
 
 required:
   - "#clock-cells"
-  - "#reset-cells"
   - compatible
   - reg
   - clocks
   - clock-names
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: allwinner,sun55i-a523-cpu-ccu
+then:
+  properties:
+    "#reset-cells": false
+else:
+  required:
+    - "#reset-cells"
+
 allOf:
   - if:
       properties:
@@ -64,6 +76,30 @@ allOf:
             - const: iosc
             - const: losc-fanout
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun55i-a523-cpu-ccu
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: High Frequency Oscillator (usually at 24MHz)
+            - description: Low Frequency Oscillator (usually at 32kHz)
+            - description: Internal Oscillator
+            - description: Peripherals PLL 0 (1200 MHz output)
+            - description: Peripherals PLL 0 (600 MHz output)
+
+        clock-names:
+          items:
+            - const: hosc
+            - const: losc
+            - const: iosc
+            - const: pll-periph0-2x
+            - const: pll-periph0-600m
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
new file mode 100644
index 0000000000000..042f2310f64de
--- /dev/null
+++ b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 Arm Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
+#define _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
+
+#define CLK_CPU_L		7
+#define CLK_CPU_DSU		8
+#define CLK_CPU_B		9
+
+#endif /* _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_ */
-- 
2.46.4

