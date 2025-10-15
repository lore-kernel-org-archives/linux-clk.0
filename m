Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF8630FC20
	for <linux-clk@vger.kernel.org>; Wed, 15 Oct 2025 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556437; cv=none; b=PCl6AZ9lfymEy8zeV6CGCYDab1StNqRVQxNE9MdIm1uFLLfJIrP9mbxlHCkgpQ7MMrHXWXwUtgnWAoAMxLjjmOxI2qJKn70hHMxjtg2azVvDSmbBjGyTyyWF2tP/hsZnGurpYN5SDgqnua6slNaDF3n/Dwo8VbvKctA+WsADcG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556437; c=relaxed/simple;
	bh=RTqcRA9Wm9Ehn4pJC+oPp3/yQh3Us97qd4vkt5bR6ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2NtBwGkR7xK1+X9dm0kVRboSiVwI4AlX0LIGKMMvEVr7wOhGcvGGIIZdmsgdVPWbL//N3RrQ5ty6OysQcz9XvnTGadLXsl3lkrHJWMRb0dAxYEmE+ErgZf6ln0xVVsSWFlSFmzMQGbkN1Z2/9TjYRZjiHKVO+r8nver7UB+LTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKlkRS8q; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKlkRS8q"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27ee41e0798so108539975ad.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Oct 2025 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556434; x=1761161234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCB83fna0UrFuRZ7ssCh3d7w5oMcQfF2kPoFGBoLlaM=;
        b=kKlkRS8qm8M6VIxxWIS4OBE1/MwVDvAPtFO7Qv/nf60rV2yf2Bhm2/vNfX/vizSWJN
         Z0cDq+GVPz6Lb+ABj6iLMUTYDLdEjSvixldBHiZQNK99+cfpRCspFua0HQWhffg60EyZ
         Mz8euKfYzv5cTlWrjT9kQR6jQSPVcTiqfyLVPq9b+OxTTsDgURmbJEzN+wzBwQaIK0W7
         Y3O0Cl9o5DonjaeJZnCPMhQqm2HRgbBdOylNGihDJ7FtEj8W6rQvPNQu72YtALeukfW8
         IyMDos02v1NVY8StqafRznQVQKLOjLPEw4K+AMuKVhoh1+x1dgICWsXvEmPcccNehsUr
         pnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556434; x=1761161234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCB83fna0UrFuRZ7ssCh3d7w5oMcQfF2kPoFGBoLlaM=;
        b=SxL/pNZncCL83tFIaFYmZve46K2lOYPMcecx/YZk7J4W2JoDzElBeHewaQCfBU0CMe
         Ax289CrooT7XvyWhosN1+LEDMgJof7ijEuvxZ/8Z66d+SJf51Is05hE1ZwpziI/YES0S
         uERPjWjz+GxkEbgAmhXO2gg5VTNRMzk+TVoBsb7zQ2Np04V8SMMgKHiaj8UZULAtP3nE
         Ua/FmnfBH0MbGp/H3H1KqbV9Me63/jjHTMl3HhQu3oaEjrQIrWOaqeVFQ8pV2uq1m3xh
         SLSRDoxKJ71Wv9oVsTBSvlDfqp34SS4juN/I5QW7wyAhfS+cpbybj0qVeC7wsRIoEUwF
         uSiA==
X-Forwarded-Encrypted: i=1; AJvYcCUXXhZzBnyuhihLOY7vcsfyxA779ekZA5QPXuWdXOilDgvyEgY3X+iN1uzyD08UjqMEe37CK5WY1e4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+mWbEmDOJi4XoewUaTN42n/8WNGGAC4ZmrZJKdWjyjda+4zwv
	MWVLok5o0IT2a8KH2+dxuT0MXZW0pq/KWlpW8lBlLdWv3lLl6ukH1Z7N
X-Gm-Gg: ASbGncvIgaNHDa8flBJujHjGC+DH/vqKkxfQKBb3Ob2RzFrHfFLVvZ4wzZzNjgNBjKD
	/n/hSgRzlwEJmd6rTwfosO6Z4QS6fWHm9nOtn0ZLZqytNGMczfg0TO5+1OOooPlE+xQ58w1+8uH
	xsWPGnmT9BQt2nu2jZ84kYIrhZG7xO4obz4fKgf1b21MVtPILr9vQAxJlQoLO0/tqjOIY4HQwVZ
	YZ8KIzzAzxtei7WdCzk3bxj47xVC3sdK/X+f82TXvTjOMD1GPdOSaf2gfB3aFFPVb8g6KH4+xlV
	HurbZXB1L8/kcmT4zWpehGbpz5ytXC6FfODabwa3hRRYAJU3XOwi56B3XVs+QEstJ7nzS/bJJuA
	4uH8nXUjHI8frAuxfwYAyQwx4qwIEZNAibMfOYMF+tBxI+qWCmAEFM7wggZP2hwwT7zRA2Bxix5
	KGBDAIwHDGlPPEaXT3YNvTTZ+8mzcULQGi
X-Google-Smtp-Source: AGHT+IFBgcljKCUXYZa2r8bWo1W2hIkTIBOP8HAHsSx3FOmKt9OEFyrfwCEZRDkEtZrlv6h4/llC3A==
X-Received: by 2002:a17:903:1b2e:b0:27b:472e:3a22 with SMTP id d9443c01a7336-2902741cd22mr376111055ad.56.1760556433713;
        Wed, 15 Oct 2025 12:27:13 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290993102c9sm4427005ad.24.2025.10.15.12.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:27:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v11 5/7] dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and RZ/V2N
Date: Wed, 15 Oct 2025 20:26:09 +0100
Message-ID: <20251015192611.241920-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the compatible string "renesas,r9a09g057-mipi-dsi" for the Renesas
RZ/V2H(P) (R9A09G057) SoC. While the MIPI DSI LINK registers are shared
with the RZ/G2L SoC, the D-PHY register layout differs. Additionally, the
RZ/V2H(P) uses only two resets compared to three on RZ/G2L, and requires
five clocks instead of six.

To reflect these hardware differences, update the binding schema to
support the reduced clock and reset requirements for RZ/V2H(P).

Since the RZ/V2N (R9A09G056) SoC integrates an identical DSI IP to
RZ/V2H(P), the same "renesas,r9a09g057-mipi-dsi" compatible string is
reused for RZ/V2N.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
v10->v11:
- No changes.

v9->v10:
- No changes.

v8->v9:
- No changes

v7->v8:
- Added reviewed-by tags from Geert and Tomi

v6->v7:
- Renamed pllclk to pllrefclk
- Preserved the reviewed by tag from Geert and Krzysztof

v5->v6:
- Preserved the sort order (by part number).
- Added reviewed tag from Geert.

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- Collected reviewed tag from Krzysztof

v1->v2:
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++-----
 1 file changed, 91 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index 5a99d9b9635e..c20625b8425e 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -14,16 +14,21 @@ description: |
   RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
   up to four data lanes.
 
-allOf:
-  - $ref: /schemas/display/dsi-controller.yaml#
-
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
+              - renesas,r9a07g054-mipi-dsi # RZ/V2L
+          - const: renesas,rzg2l-mipi-dsi
+
+      - items:
+          - const: renesas,r9a09g056-mipi-dsi # RZ/V2N
+          - const: renesas,r9a09g057-mipi-dsi
+
       - enum:
-          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
-          - renesas,r9a07g054-mipi-dsi # RZ/V2L
-      - const: renesas,rzg2l-mipi-dsi
+          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -49,34 +54,56 @@ properties:
       - const: debug
 
   clocks:
-    items:
-      - description: DSI D-PHY PLL multiplied clock
-      - description: DSI D-PHY system clock
-      - description: DSI AXI bus clock
-      - description: DSI Register access clock
-      - description: DSI Video clock
-      - description: DSI D-PHY Escape mode transmit clock
+    oneOf:
+      - items:
+          - description: DSI D-PHY PLL multiplied clock
+          - description: DSI D-PHY system clock
+          - description: DSI AXI bus clock
+          - description: DSI Register access clock
+          - description: DSI Video clock
+          - description: DSI D-PHY Escape mode transmit clock
+      - items:
+          - description: DSI D-PHY PLL reference clock
+          - description: DSI AXI bus clock
+          - description: DSI Register access clock
+          - description: DSI Video clock
+          - description: DSI D-PHY Escape mode transmit clock
 
   clock-names:
-    items:
-      - const: pllclk
-      - const: sysclk
-      - const: aclk
-      - const: pclk
-      - const: vclk
-      - const: lpclk
+    oneOf:
+      - items:
+          - const: pllclk
+          - const: sysclk
+          - const: aclk
+          - const: pclk
+          - const: vclk
+          - const: lpclk
+      - items:
+          - const: pllrefclk
+          - const: aclk
+          - const: pclk
+          - const: vclk
+          - const: lpclk
 
   resets:
-    items:
-      - description: MIPI_DSI_CMN_RSTB
-      - description: MIPI_DSI_ARESET_N
-      - description: MIPI_DSI_PRESET_N
+    oneOf:
+      - items:
+          - description: MIPI_DSI_CMN_RSTB
+          - description: MIPI_DSI_ARESET_N
+          - description: MIPI_DSI_PRESET_N
+      - items:
+          - description: MIPI_DSI_ARESET_N
+          - description: MIPI_DSI_PRESET_N
 
   reset-names:
-    items:
-      - const: rst
-      - const: arst
-      - const: prst
+    oneOf:
+      - items:
+          - const: rst
+          - const: arst
+          - const: prst
+      - items:
+          - const: arst
+          - const: prst
 
   power-domains:
     maxItems: 1
@@ -130,6 +157,41 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: ../dsi-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-mipi-dsi
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+
+        clock-names:
+          maxItems: 5
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 6
+
+        clock-names:
+          minItems: 6
+
+        resets:
+          minItems: 3
+
+        reset-names:
+          minItems: 3
+
 examples:
   - |
     #include <dt-bindings/clock/r9a07g044-cpg.h>
-- 
2.43.0

