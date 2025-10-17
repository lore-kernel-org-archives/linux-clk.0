Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87393451A6
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700112; cv=none; b=IxR6a11+up6tDkps1SuU1nl6hM1Yt5kEfYCitMADraNBf8BG3Q1NyiUOt8nOQ+md1hAJe/lfmqUmBlF/uGsWc1Uuu2Me36i3DBR8o4/E98oyB9iG1fEgFd06eg4K4Ug5iiaB1XdDr85iWtwClz99VManQmurvdwYdYFfOtsxl5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700112; c=relaxed/simple;
	bh=a/aoSr6OJ+vXil4ATAG/Gem8UWTO+xyhbN9HKM1V+QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tq2SWRldiwFMlL0DjWwE1BnUNRe4Bu5Nbl5OwsNAS+gwt39PorximCH3jwlgLf3wR61Jap+NlwIPTh6Ldcl7Bu+CkobOZmkCerL+mMVTqjl9xyy8B3FqNSdlaNctlBR6RvSfLUsGOstciopzz0svXM4QzTL/1zDlqgRk2JGSlYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2BB4u1Q; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2BB4u1Q"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3da3b34950so287828666b.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700109; x=1761304909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxZng1eP3nkpNL2x3zSCyGZ+U+wKEAYbZhmRCawRv6g=;
        b=c2BB4u1QrUfOCA5RQ0A2HEG7QYSQ5Ia4W0lhZRsbYmLeX4EisBgJT2ogzxd1mE/R2u
         N9AJLrFXYQ83ZWNOPBZ/WwuFmNoY+uVM0/mtVujy/WHqURtYuBFbODvpC/HKtuPQZJsq
         Gj0xezYGiWGDbAUR4resUyAdUOZFLn0/TmMv4jg9YDKR4rLFnD7AkJWMVB6um7Iq01XE
         p8AAe6m0svzSP4L6rgT8PsFNimErcmxEKCg1gpo7ifgGb0MULbadqojD2nlNSSjby2ca
         iNHVmmeeVJMXR/mRaMNovlG03p6FFutkz4tFsSZX0FxUsl+bKWOJfgZLF7TFydfr1xtM
         6ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700109; x=1761304909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxZng1eP3nkpNL2x3zSCyGZ+U+wKEAYbZhmRCawRv6g=;
        b=MmqXeU/By7sGh4hdj6dB1nVLuAm56cAyiEbvqlPdXKDsgwXEFA2J8NQWVMB2zBbzR6
         eXSLWR1STOqT5PHCzOcFFk6zHkVNGd2IMXIJjBo1Xfl3bD4dmHhoInDZTSAVlRltoMxT
         Ar1cyv4t1kxhTjXILys9ytpGaUcgKpsFWvQtXW65EvnwkL3ynYUwCmBDKuWUQgTF8lvx
         qIKHM7St9labQ112g+hqwZSnpT6r0ZbbVzxzRBX8QYZsWN+tmKtJoU3uoef/YFY6xWKg
         wMoaUFG4YWaqAaQi3y4yzYODAutbimCNHV1bkaV1RPNMc3uPJwtBF4dP4hqSarrnfKTz
         h2Nw==
X-Gm-Message-State: AOJu0YyT0y4W07dBtyr8K9JSP61n5mOcdZSvNdAHWzq+1zMMI+wG1UXY
	uzLI6l7M4rX07ARq22yvBMKF8fB/ZY12g3qQv8wFiuaKrbKZXG4v5Fsk
X-Gm-Gg: ASbGncumYTznpjn8Tb8N7pgX44WctKqvIUYgjElY1J2tjYdu4XKGU92rs/7UGt7S6HG
	x/9jEvNyDug2RgLw2gQAeI+/23khBOsIsd/S03j+voCw7xg+/bbIf2cV9hjMBcB675OLzG/k7ll
	djB31arNN0x4sPaOVVjDirhr+aO5cjDssW292QaDxXWkqdSvd3BSnm5f/y4/vFo4GoDzWwLbteV
	ICXhZ/+1Zwm2WbY3TP3UgVAJgK+FrlXF5cjRiV2ckjL8nf5dY793jpr94N6aJAqZDWoGU8MbT4M
	0Xxqri67xHqvIBtLO9WYIxz/yhh+QEOJdL/6qeZd8sy00vwfiVq19hyFjFHdbKWastt0VzM/wB2
	ja+BBF8nG2O0bBstD7xrfG1boOmy1qKIFt8muU7agHzfU+kK5O7XWi2bM1IzwRfJvoIyeSGnBx1
	o7LXw+W9refq5eMo6pN1+MjjtZZ3O56YXWgO6SyA==
X-Google-Smtp-Source: AGHT+IHZNMQeXplbUH41+dThExjmzBGzSWreEUPNrbP0M9e+9ctpnllogrXxNq4uh1jLTdNf2mZ0sw==
X-Received: by 2002:a17:906:dc90:b0:b3d:98fa:b3fe with SMTP id a640c23a62f3a-b6475510fe2mr380187166b.63.1760700108569;
        Fri, 17 Oct 2025 04:21:48 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:48 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
Date: Fri, 17 Oct 2025 04:20:19 -0700
Message-ID: <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for i.MX8ULP's SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 72 +++++++++++++++++++
 include/dt-bindings/clock/imx8ulp-clock.h     |  5 ++
 .../dt-bindings/reset/fsl,imx8ulp-sim-lpav.h  | 16 +++++
 3 files changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
new file mode 100644
index 000000000000..fb3b9028a4c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP LPAV System Integration Module (SIM)
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+description:
+  The i.MX8ULP LPAV subsystem contains a block control module known as
+  SIM LPAV, which offers functionalities such as clock gating or reset
+  line assertion/de-assertion.
+
+properties:
+  compatible:
+    const: fsl,imx8ulp-sim-lpav
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: lpav_bus
+      - const: hifi_core
+      - const: hifi_plat
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - mux-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8ulp-clock.h>
+
+    clock-controller@2da50000 {
+        compatible = "fsl,imx8ulp-sim-lpav";
+        reg = <0x2da50000 0x10000>;
+        clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+                 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+                 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+        clock-names = "lpav_bus", "hifi_core", "hifi_plat";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        mux-controller {
+            compatible = "reg-mux";
+            #mux-control-cells = <1>;
+            mux-reg-masks = <0x8 0x00000200>;
+        };
+    };
diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
index 827404fadf5c..c62d84d093a9 100644
--- a/include/dt-bindings/clock/imx8ulp-clock.h
+++ b/include/dt-bindings/clock/imx8ulp-clock.h
@@ -255,4 +255,9 @@
 
 #define IMX8ULP_CLK_PCC5_END		56
 
+/* LPAV SIM */
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_CORE		0
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK		1
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT		2
+
 #endif
diff --git a/include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h b/include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
new file mode 100644
index 000000000000..adf95bb26d21
--- /dev/null
+++ b/include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H
+#define DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H
+
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST	0
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_RST		1
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL	2
+#define IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N		3
+#define IMX8ULP_SIM_LPAV_DSI_RST_ESC_N		4
+#define IMX8ULP_SIM_LPAV_DSI_RST_DPI_N		5
+
+#endif /* DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H */
-- 
2.43.0

