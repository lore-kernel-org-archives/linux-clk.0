Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9416C499F2C;
	Thu, 17 Sep 2026 22:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684780; cv=none; b=o+HzzeUukk2el6BjqnNQmegV5wTziTcCRf3aFvRVB22XtkSc05RPTurQIC5LKVW5G2oLEQAK3CPDl7jZ+n+3VkflD5QrAnhbGv3xpioafjEJ+l8UKwZfxE19cyndWvF5/CH9Q/QO04DJU7Zg6zYH97jr08zX9J1VcntWeZKWOf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684780; c=relaxed/simple;
	bh=XhPxgdjfEdMHC4xLaVcPDWmXzJE+5sKEFFSnTlkds94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLfs7vUCFDaTniS7HHc/dRCoH+V0qdMv//1d81Ywkah3hG00ohx9Gl5i11n4/Ph06qIv2+Fc7LM4ekBcbeugB5rXh8qMIV7EQnA8qjxQIAq0dxW4UEV5ZT5/BCSUYXZReFwD/tmVXjo6srHE3JuI7saAiWOUJ1qy0MUNTTerJc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C8aEccB5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C8aEccB5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF7CB1FCD;
	Thu, 17 Sep 2026 15:39:33 -0700 (PDT)
Received: from e142021.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 294793F86F;
	Thu, 17 Sep 2026 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789684777; bh=XhPxgdjfEdMHC4xLaVcPDWmXzJE+5sKEFFSnTlkds94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8aEccB5pv2ol4YC3waxP1igpqz5tknY473X/PnN9eP979RMm3b8+XyAoxvan1tOV
	 mZ0JYTaj+cvCtO8S9QWBMLFQaBk6pkClF7GijSHotUtQwbtUHuduQ6kOw8Rvua1mPZ
	 xm3pPZQE277pkmV7Hzhih24GjNN+ZdTG5ixTHkK8=
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
Subject: [PATCH v2 3/5] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU CCU clock controller
Date: Fri, 18 Sep 2026 00:39:11 +0200
Message-ID: <20260917223913.1855301-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917223913.1855301-1-andre.przywara@arm.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
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
 .../clock/allwinner,sun55i-a523-ccu.yaml      | 25 +++++++++++++++++++
 .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 ++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
index 58be701a720ea..98d47d2aabc48 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - allwinner,sun55i-a523-ccu
+      - allwinner,sun55i-a523-cpu-ccu
       - allwinner,sun55i-a523-mcu-ccu
       - allwinner,sun55i-a523-r-ccu
 
@@ -64,6 +65,30 @@ allOf:
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
2.43.0

