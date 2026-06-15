Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F5F3F1669;
	Mon, 15 Jun 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529157; cv=none; b=uB/e1QjyYio3tW7XRtCE0+3dsIaKDPN5xEsyG+B/RfS6RniZs4jB7MiKgsr8A6BF4v/VgjBasXj8cX/rls91bm3wGVSYntadhwHNCuhQTwYq5YbqDeWSnKK2HK+k+iUASMEIFaNAxNApW9QdMlEHsYP65GwTJ6aYZTCmq+rcbWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529157; c=relaxed/simple;
	bh=xnWpBL8Cp48voKFGoVtDrob0jpOcr2vP9FQTwqODaVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BjcArQoyZBmMek1LJxD+RnFJKwj7GN5Y6lPsO/HBH2QEzjy2lEdnBKD3kjmer7RJkyRlFa6arWsHACow3n2Ca3we56lrfDJchEeN4wiJ7x0lWnOuqFzmghDXG4UD92dU320i9ccQrMARU1rEcZ/wp8GB1zVLL6BAcKxviwa6+xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LQEt5qOY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LQEt5qOY"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2330FC59;
	Mon, 15 Jun 2026 15:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781529117;
	bh=xnWpBL8Cp48voKFGoVtDrob0jpOcr2vP9FQTwqODaVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LQEt5qOYrE5cLsvMAiVT7g8ApTnB23Udkj9+1850528mXUuJAXeZb7ZAUwvl4Ic8g
	 EFw+8xis9UfRVH/zvoOBOIrX8puOhXtGJExwAhWkP+46bNz4DwAGyfLlyQyGevhpXs
	 a6b1NMzoQMY6BsmDYf1S53xKb8uhPMEQmz2VPIA8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 16:11:55 +0300
Subject: [PATCH v5 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v5-2-aed1a28610e4@ideasonboard.com>
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3267;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=EpKspNKtJb3gFZzbjWWAv/mM0hnbOAZJyvJSXrMiNu8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL/o3t9v/6Eq+qL7OwX03IFbFh1scdZ7c1BMyh
 uB27xUt7WeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai/6NwAKCRD6PaqMvJYe
 9Y8cD/4+oIByQo16DeEsWsiEJQ++DqdFUYK/7QJtAB1cru5rshODh2+mxVaiZGPc4AFfC2mMUbz
 bggI/Z19OCaoi2Xfg1Cf453pLEDLC/jM2f9HXX8Axp1K/HxONqKRerGSPjflFT2WQR3qKpv9uhn
 RyOHdAWCUWQeaF3TquTml6ESXisICI4aeKyQmmJEE/qkcLJV87K2cx74c9jDkKLndjLj5NuF08V
 1z1xSYpHRCVLCatGJDVkilfjTXvlcfenHXujV47Nn2etUq8Wqo5AFCs1/OEjG7j2t1P2optSax0
 9yx4E2M8hqKO10UuxPmfcLe+3B0JeoTrL86fMaog87ZoeRbA+klNVQrJc6TLD+U5xsOj2G0drvb
 5XEEFUcH1Bqfjnwah59AJU3zTQhtOJsLec/hd+Y/twOZh28h/s7M/jD9Y1YUVS/GQHJ5ZU6xbFE
 RZkbX9U5qHFfhV7l3U27eV+m70eaiSjhgacS/QTdLiroG3bNxHGnqX5an6g+6BODXNp0eXiLAoN
 THNnd56QqizFVHtC7uyAl/eRi9OtDqEr4yJsiAaB8UyDT92p3dlsvSvsI8cbQAKOUeNyGvvyvhT
 rRbzo5IhjtuezOpeu7WEdSCb3aAIfbmgfgddHKYX2WODzMSHgf6lPvi62sgW2Vx3oMddGLoeuz9
 xCkJShZTlpP5j/Q==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

The Renesas DSC Display Stream Compression is a bridge embedded in the
Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
8k or 400 Mpixel/s .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
[tomi.valkeinen: fix the example]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../display/bridge/renesas,r8a779g0-dsc.yaml       | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r8a779g0-dsc.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,r8a779g0-dsc.yaml
new file mode 100644
index 000000000000..6ce2444409a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,r8a779g0-dsc.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,r8a779g0-dsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car DSC Display Stream Compression
+
+maintainers:
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+description: |
+  This binding describes the VESA DSC Display Stream Compression encoder
+  embedded in the Renesas R-Car V4H SoC. The encoder supports all DSC1.1
+  encoding mechanisms, configurable bits-per-pixel, resolution up to 8k.
+
+properties:
+  compatible:
+    const: renesas,r8a779g0-dsc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: R-Car DU input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: R-Car DSI output port
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - power-domains
+  - resets
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a779g0-sysc.h>
+
+    bridge@feb8d000 {
+        compatible = "renesas,r8a779g0-dsc";
+        reg = <0xfeb8d000 0x400>;
+        interrupts = <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 2819>;
+        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+        resets = <&cpg 2819>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dsc_in_dsi1: endpoint {
+                    remote-endpoint = <&du_out_dsi1>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dsc_out_dsi1: endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+    };
+...

-- 
2.43.0

