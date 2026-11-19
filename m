Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083213;
	b=fHAejCeO2oHIBMUd0hT37Gkwjl28DBAky+4eDraYZ4UcHZLsMyTPxajORuwKMXd54cPp
	 rUXWANTXff1JX59oniZRh/2+etGaYobynabsbPWREQA7ehfscrRv1rf1ckw8ZitWFQMI3
	 1mc8Cmaq4kHrhrO9qt245SueooPWTd6fIvRXF/vTo2AAjjLxhj0ZdRanN++w7xJi9eZ4a
	 UHvNPOV+Ax8KfXZJgHlN1Jbmk3wnDJ/IOe2S85cXObBGeaRZoYNAaC1aiD+l15SUQ/c6p
	 eLPtSxhLmPu2SREzAn3SQ+zySEvSDp3iWF7lY/r+f63FmDAdyKccNVS8fbUL6qnjoNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083213;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0yDZOAIm8/Q3QD8+C6s41Grxf2KSvFAj+qQW3BIcQGs=;
	b=mrSd4WubYUlKoFgDTocDCZOn60jVxgaliQz2MNHpC0ZNTVrL3PSMnChgVSWzmNM6h1tf
	 3LWS9CwsE8LWyp/5xzePWvATrL/Yl62LupdK1BVS5X1TxqoJNTyTglyoGIZB2eHjqOGN0
	 ZNa52gj4JFKEmpYWo9NdZZsYyU1GdVQtWKNSWCjvm9fOW+9kFqCFwS/CBOLQl8KWrlPhP
	 UyXMKkNHThrthSb+H8Qm77n91oOydunl/ygKt9/3uY6w4Ue+YVonUbPV77z7yshhYB1rl
	 i1i+OiLma5yoHXFMaEf2UV/taJfU7/UD4w4n5ilPWkh5GJTqnQCf26JMYHOQhHWJWDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Omd55L/W";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2008606A335;
	Thu, 19 Nov 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Omd55L/W
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795083212;
	b=CQVcfEUlluf6m7QkbleFbHG3mVnQ9p6SNeU4q3TaRV9D9LrOWoQyIHTXgFJ3ENkRI56n
	 /M7KpLqZ2NBq8wwkB1/Vb9ZCF7Gr/TVXwS6F0FR0nzleyJX3YEgIlG8jHl45NEBAo72rM
	 thohQEJwoTcjEHKuVh3PR8LQpMM8+RjI9Lg1yLxjJ3e2HQyUNN9wbefZLS0x7TcZ/PijB
	 lqmQzMAgx3Wm8oCjNEOTxhcCjLvPThQu9pFFM+7TDxQe0eJxnpg/BIaC3WfrdbWLEW19p
	 6vzQ/r/fM29oQowSvcyURcG6dk3a1XTRswKijAWKyRIPeCS1CT+qkGsBN1mh/65BoZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083212;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0yDZOAIm8/Q3QD8+C6s41Grxf2KSvFAj+qQW3BIcQGs=;
	b=PnRJik2H5cRb6RGERTyvT4LmvLyV+tyvBvPBw457xT5GZ90F/Xc7GQE4tzl/XsCcIEy0
	 n0CbfwG1AgmEtfE/m5+nKaqlr2TwSKCLHPaUXP6mtmwFZvNXL+70t0nW+fyQrbZR3pjzq
	 8Y8y7a/q6Eu0fIOhYi4kGFU4NWKFfRXuvrYrew5dxp+Szs55wVL4g10C2tJ8kO+FF2Ogb
	 vohaNiO4i3/SzxOW06GD8TsOllBUPd1VZXl+dahOHeEb0tyJqRwtl2w04hxXWsq6+dctF
	 5PUWQNKK/dItMOQYQXflE+iR+FNIZQJA9becCLv/Tn1T7J44A6LRGNSNXNQgGu6yaYA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 778D81F000C7;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083212;
	bh=0yDZOAIm8/Q3QD8+C6s41Grxf2KSvFAj+qQW3BIcQGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Omd55L/WcsAFHm9t8HcW+l9StqzGto+/+soS66zl4fR0XHE76UNv+AWBrEwoKt+ML
	 CIIySWvtOrg24dt3fkgIoXX9Gk+pVZvMuQUmM7bY4vwG9X6p+WtKQ6Okv6bFt5YSEx
	 vQZAGtqLjYgFutqpn6F8SfkmjVEFfQsBRaOU7jqd6MqncEBXT8ZqrIhm0vBqkVmBwM
	 8Wh/s4MwwQ8ooCmL0xzOR0lbqqIByFUGL2d2Ja5FPlucV7Abr+Yhjp6dyT2fl97+qb
	 BIK0GjJj48xJXFgjSB6xiVHLB4fgERUoVNI3b5yJzM9ap4bycaO8GbopEhKa/Vbmt/
	 iiFcfktbS+MBA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 034F44B230;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 19 Nov 2026 18:13:20 +0800
Subject: [PATCH v12 2/6] dt-bindings: clock: add Ambarella CV75 RCT
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-cv75-soc-v12-2-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795083209; l=2969;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=gEKr05f9YAOrNVHJfKB47io9QNiMkJyDyO/ZJBUGYg0=;
 b=58uMAGWcQmK7e+q9qH51Q2wkf2o1yGI2IKPDLtuuTKZSKItyEvIuyKH/lmwpzVj9WtyaiX2fN
 qZRLAExgDOMBwUTRDLcF8ULmrpekQEragLfmCjSbfinK9XTYQ1EwttB
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

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


