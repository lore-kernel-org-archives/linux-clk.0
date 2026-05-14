Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9413DD870;
	Thu, 14 May 2026 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761531; cv=none; b=kNtbcjWeDeSuCzpb4WMebPiHljHu2cwo7HDeC7n5ENQ2L7quhKm2g4F1xzAPvAx23U9yKl6EO0IIIyj/z6Rn2h2iaN9+PIVUjyW0y7vtTGC/XsPrtnkPgkTOyyb0R8zZcmhTIRsIP+TlicZmRCeLVyMBSp/yzKCC5BHZqupOjDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761531; c=relaxed/simple;
	bh=xpwu7gw/Hyq9MFh4sV1+vxNpjFWFFVHAZQvp2tR0HCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGE4+67EOnEwpIr94oMwePhDs5c+N5HlbXuICx9wvBHd0bCvmz/1psfIsz9XvKA35nAtvj482Gis6h60ly8ZpxYqVR83qiAkPqhTvQ0R/OCyRTOauwOHrTzRDwf9AgbarymYxeiR6bKN8lgA+Fn21CJSYwP3J4rVakZQZEqPTOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kI/RLvCl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kI/RLvCl"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BEF4D7E;
	Thu, 14 May 2026 14:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778761516;
	bh=xpwu7gw/Hyq9MFh4sV1+vxNpjFWFFVHAZQvp2tR0HCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kI/RLvClr8pn1haNpA72wV097TuLpwvSjhFA7pP+jumMwrYAN5/5I+/F+TIRTVe71
	 L0HRV9Yf07pQpPUmuuy/G2yzOuXSOOssHZV3bP1SfYY+lq/32eCOqj6RttaNbHeKdf
	 WAkyJHlfvlWwxAKfXYvPVHkGZddBwIp9VoNwcwYA=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 14 May 2026 15:24:54 +0300
Subject: [PATCH 2/5] dt-bindings: display: bridge: Document Renesas R-Car
 V4H DSC bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-rcar-du-dsc-v1-2-d65f7a9e9841@ideasonboard.com>
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
In-Reply-To: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3104;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=VcZfIV0MZFalb62VGStBH3gpxTVoD8PjQZsgbR2cw3U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBb8vwKxP5yD8Glr45fYvo29RAT9lXLohAxD3b
 Xi5tFb4J96JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagW/LwAKCRD6PaqMvJYe
 9RomD/9qnOvf7iqgXSK3SYlb7W6n+O6tOKKpnuAU3g35i7ziCHTkAJpaIpog+oxC8Ybm2gNkXSt
 oygTapZHQS3w885jo9HEXnJlVUefhUmPFryBNVzB6LmZyyyly3n3zkCDjTYlxfw2xVjgKvmEHyu
 MK13G7n6GeSx5qvNoCqw3af2SrEb/K6EPYpVY62L/+wFUfZdLxDn7w0q1JOIg2fsVYyqpwfHEK6
 PoqS10MoBKD8SwunN7/eWR0SXn3+TCIXOK7XXhVgrxrmZmGMVlvMBwuS82jT0NYs4ed2HsvV0NN
 5eN6QC+kpatEDkPhFbRao2b7tCmbFrZo8ScGE95N93xBwpO+TLgPENj8see4HdhMzRjXhfWSUsc
 f6zBil3N5/9LnTpssh/jVQg/Cqhe/Z6fw9eO1v59A0CSTNKfCxBGuhZb318S0PEdO9qJsWNVcKh
 t8yV+L+McLcoS/rQOwBgr/gebk3LQVj38bsDKu8ODfdXgdmfu+M+wUskZMZbzH3CEUpAdxe33ki
 lb9Cb5DdgauUy4Mb5Xhe2Axuu2PjUcAUgsrMtP3JDilXSMAdiHAyzFW7t46diAA5btCGy+bMEnJ
 O4nKvIU1F8vrKf2cbfAgCeAJMBOXXAsWuVxUfLqj/WGCHK1CuiZNMpgCtHO8y3UiX5QWisaHNK7
 DpSo5plSoFGnQ1w==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

The Renesas DSC Display Stream Compression is a bridge embedded in the
Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
8k or 400 Mpixel/s .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
[tomi.valkeinen: fix the example]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../bindings/display/bridge/renesas,dsc.yaml       | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
new file mode 100644
index 000000000000..91245beb67d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,dsc.yaml#
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
+    dsc@feb8d000 {
+        compatible = "renesas,r8a779g0-dsc";
+        reg = <0 0xfeb8d000 0 0x400>;
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

