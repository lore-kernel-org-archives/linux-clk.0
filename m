Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02B12D7DEB
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746168; cv=none; b=BOTCULXnwUSRBOAFyZ9y6TRFP7tRkpjAVqsDqDahLxxEksv8PJ9RSc3FgkSVgCEjVsnboBozb3YsdL1F5VN4e1DPWFTEgTJLUUxW009mIUe4VN4KLPaYgZoQ0oWONQTyX7kpmn1EVxcgaqR50lswMKPckWGkbyNPwSE5HSO9I6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746168; c=relaxed/simple;
	bh=NlDVT84FRw/2mXN8rUhepff7GU8/kbx+go4sEcGg10w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMGDyfd+G3/CKT5lqjZGb8I2MuucjLOiAZzgkuGeGWIc/eev0J10lxDdt6VbGJq/x09I3RGa6ca3deEKwZHWFEBZyEitwxm9v4FJAb3ue3aAq3cGBItG3IOSBeumhhKTfkmnlWZZQnyMrk/4klvi24AoU+BPDTLPIpLBReca49M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUvmwQig; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUvmwQig"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3b27b50090so1290561466b.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 06:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746164; x=1762350964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=;
        b=JUvmwQig0QMMPmB9vK03RxTn3ZE2+uVje0SQ8kLE0k+3CnuQ30FcHY0hA2CEAp7MJv
         Zmp5cVtp+PCzIbI4bG+ticjWg2wfJrs3AbDsYcEbJ39F4wdoEpq3uF20u1x/8CcSqC7l
         6ersAjZh+uXXg23LYCU9xA9cLtYECINXMB8738A6Oc2yIqxPH/Xlyq3WeadeBR+coT7l
         MpUDVGndh7FDT7k7ZxoanBO0GvDbrEgmXLMsu3ghPptWTBkRvKKt3T4SyVKjEsXkCNrx
         IiWGAaDN2hjpWGQAQqFcrv7y9BlKqLLmU3yP972FAGNsfr3Xe58sF3quSCHvFutgiuv/
         v49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746164; x=1762350964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=;
        b=MskK1HIQcQEfmfWCHI+svjAHpF/uJYdcG2RYegugZKZhIg7N6Vy0FYFl3nW6O4IOiZ
         /zZXblSu/RBzz0J4jfMYQoAhhJU1r9QP3rBUbVh64UCc0t6gwYWRRIy4oqreFZp7vX/H
         /hsOElUXBFWHUmRfnnfzP+U9HuxGN1lp2dABu86BO/29eNrErXRHUOAtoGIkFVz56nQ3
         0aT3dLQcAQpk5iCcYT2/NC6sVOiZBUMOz4wRkrPzy+jbCQG0RC5HExbxnOoaDelMxuY2
         VyZvKDCWL3c1IKNHdOE7iKNIh9vNifrJ569yshKxIfIaDYWd2QjZQy7ttndvwqvLKcXo
         O02w==
X-Gm-Message-State: AOJu0YwNxNiT/AobJPnSKfsZrWL6lHy5Cp8lOTv8/auxdA6jehb8Ndb5
	7Xu/HyPOOhaSOYYXAyecAzkcYZDQ0Pr/XgfOQpi1+ll1hd80qgpm8N5n
X-Gm-Gg: ASbGncsMa0GzZB7fWVpuDCmzHM7NapP1NdJrBknRYYAmE/GsLCzvVOAj2IvkQWFtppr
	wcqur6hPZ91jEcZPL5sDoEKFPwI+BW8LnmcLvclim+5C+3vZthZZMHAb5Tbxypt1vUOcQ/Tn7tz
	rDBy7eoo/EVS1nUsLUXDh2HN9rUx+2INIRKtJLXbiYf72BH+6zphtpavufDrVpRywzxxrNs4X53
	KX6YN1KZS6KUJCt82N1BpkRmvf4pRkJD+H8mZ8dSf/zBEIyGeGycofgeQuN2wSTl5EKBkYa2pjo
	rOHmiBLc6JVEa3tHdcV8Ms8cA1LzDdgxydB5Bnf9YYyQ10r5PlPDiZtpn7bfoEJ84gbTk5HKslU
	PPvErtFan1bxnR2Xjkv5oCGUIXcyGMrl/opwuYwz/DJos7BUi1VmHpYyQrScNp2jhNAM4INKusO
	wEngY86uFrsMenL3lcmxY4AQTaWg==
X-Google-Smtp-Source: AGHT+IHH54LZbYTOXZg7mV9ntZU3iJVYCB8V/9k7x05K1JXFlb07Aw0IydcZp3Dr0TOMorMdCHGUFg==
X-Received: by 2002:a17:906:f58f:b0:b3d:b8c3:768d with SMTP id a640c23a62f3a-b703d2cc2c0mr267175966b.7.1761746163828;
        Wed, 29 Oct 2025 06:56:03 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:03 -0700 (PDT)
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
Subject: [PATCH v3 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
Date: Wed, 29 Oct 2025 06:52:23 -0700
Message-ID: <20251029135229.890-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for i.MX8ULP's SIM LPAV module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
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
index 000000000000..662e07528d76
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
+      - const: bus
+      - const: core
+      - const: plat
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
+        clock-names = "bus", "core", "plat";
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

