Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6639E27FB37;
	Sat, 11 Oct 2025 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202248; cv=none; b=phWWyG16r2oQ9j57cBfO74CR3Ar7+mYNslnDazy2jjG6qvcgOvPb04uRdLephqXzU58neI4ANPK2fIecDkN4U3MmfRC0Z0JcUZzgennOlHHijad4//ngHZTN9Mqf9LBz8z9i7Ti87xvR9EJyFX73QcEk2w61D6BY/XdFW3GNFt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202248; c=relaxed/simple;
	bh=PTdUQOC6XqHIZZzUbX9NbRUEsQnWghyfmSdlCkiRaII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPRm8mp1PMW3U7Pw0ksfFKCU9NcRrgpkgRF4JOec0c1s20ESDnwVA+pSX0UuqzORJOKImyRm4lAWT8SLfBsd6WBzkvOHs1LiUZ5iXvasPHEGT5jcO8POIv05q9H+PfptSqPvhf9hIO74IXvgcwGFVtqJBWV03SRdszuDdbTeQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=b4XsmlrG; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TrzvXrQ6; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="b4XsmlrG";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TrzvXrQ6"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVM75VPfz9shj;
	Sat, 11 Oct 2025 19:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyc2DoIYaPc0vTjiNx7YZ35hhTWb8Cwi1ST6UUpWQQ8=;
	b=b4XsmlrGKqGUaWia74v/401dTxoTOs9/CdL4hYvAtXA5JOaP4tNVvTfyrPcIwwPFEhDcmv
	9iNQpWANAy3P8uWy+Sl0f3vN8+6tsY3ug4ldmabm0OrXlaoxQHoUnTeyBsHpLQSBOa7VMl
	kbVOK2TiZCf06aviED2ENtXInQEzRaexqR42NW3xQ3AAacwqo0PTV+I72Azjxja+vH2Q6t
	yAgTyFRr6pkMx0wTT/ALguUT7fGmRlC9+fQTHgS5I9YAlaoae7x8Hx13KWQ2ccQHWqACqo
	r83PivBh/7DEJgKNjxf50TA/he5TownEzVITpToO3MiR74Elsao7OP2bj/hbWA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=TrzvXrQ6;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyc2DoIYaPc0vTjiNx7YZ35hhTWb8Cwi1ST6UUpWQQ8=;
	b=TrzvXrQ6j6WQ/LeT2j/oRvx7muyGBT8qXa/My+2y8GIF6HLktL3rpy10QR7I5l4II8T0c6
	M7Qkluxxi096YETNn1F36Teq7MOuj0feJfjth3wK42hrg7D2Q/rUnzD3nHx+5tXuW/D+kF
	kGV9+pYXegb41lgCF7Tex8z3EE2SCDy1Cdsn8NDt0kJvnTxQ7yDGcdfXh1RvqETXuJCI7m
	LpHkXIU9CFbkYFf7SBnrIGqnYJ+TgFYPAAUcIhMfyCECq7reouvXvFc08z4zt8zGo5zWsP
	wHCZYbh8exVJxpvd1sWyxcaUpeF09QDrB5kiXwnQdiLUh7aaG3mLV+wHgM2qVA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 25/39] dt-bindings: display: bridge: Document NXP i.MX95 pixel interleaver support
Date: Sat, 11 Oct 2025 18:51:40 +0200
Message-ID: <20251011170213.128907-26-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: cb9dfd7a07ea323ab6e
X-MBO-RS-META: ymqmomf8xzn1fjnaxof47mw1kfe48wyz
X-Rspamd-Queue-Id: 4ckVM75VPfz9shj

Document NXP i.MX95 pixel interleaver bridge support.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 .../bridge/fsl,imx95-pixel-interleaver.yaml   | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-interleaver.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-interleaver.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-interleaver.yaml
new file mode 100644
index 0000000000000..6a0647f060a02
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-interleaver.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx95-pixel-interleaver.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 Display Pixel Interleaver
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+  - Marek Vasut <marek.vasut@mailbox.org>
+
+description: |
+  The Freescale i.MX95 Display Pixel Interleaver receives and processes
+  2 input display streams from the display controller and routes those
+  to 3 pixel link output ports. The interleaver is capable of YUV444 to
+  YUV422 conversion and pixel interleaving.
+
+properties:
+  compatible:
+    const: fsl,imx95-pixel-interleaver
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  fsl,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to Control and Status Registers (CSR) module.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The pixel link input port node from upstream video source.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The pixel link output port node to downstream bridge.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - fsl,syscon
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    bridge@4b0d0000 {
+        compatible = "fsl,imx95-pixel-interleaver";
+        reg = <0x4b0d0000 0x50>;
+        clocks = <&scmi_clk 0>;
+        fsl,syscon = <&dispmix_csr>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                pixel_interleaver_disp0_to_dpu_disp0: endpoint {
+                    remote-endpoint = <&dpu_disp0_to_pixel_interleaver_disp0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                pixel_interleaver_disp0_to_display_pixel_link0: endpoint {
+                    remote-endpoint = <&display_pixel_link0_to_pixel_interleaver_disp0>;
+                };
+            };
+        };
+    };
-- 
2.51.0

