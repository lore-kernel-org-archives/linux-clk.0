Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7F281341;
	Sat, 11 Oct 2025 17:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202268; cv=none; b=O5bboVi3WE4lrNRu90M2KUseiUwc7x6+mYgEKFK2E5rz+mY5IpfQ+nSC8G+RMMcGNWicr3txuEN0ao7MUSe7O7rDzCjAzZd0NoPmWiNl2Hm4L4I8w3rTgk+gXtlMBsKda3AHQudUwyE85MrlU3l0+bjN9JqdjdRM0iI1vTQYXFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202268; c=relaxed/simple;
	bh=AFJN5vz97CiNiZ9N4Jw1LYZ/Jh13BSZ2e3MpJmLmifU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZgMgBpp4LaTd9s6NlgOYGj0DPWdWIrbClY2IAhR3cs2mZH+9FEm70yx3KaxTirGRe2zOzyFPVGss46QZYP9fptR+TbfaTIGF7+64Qy7FC2IB58GNrkf+3vh3UhC/cHxWbozPucfoO1nPosEgjoMn09AcVF7IQow0G600MgYPow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XaR2fVkN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=O51sbNnc; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XaR2fVkN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="O51sbNnc"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVMY3Xpqz9sqh;
	Sat, 11 Oct 2025 19:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EeEbDQhWonnXdbJ5j5TrV2WxPPBauvVZw8N3snFwnw=;
	b=XaR2fVkNVeJR4TWCTAvv4ykUuI26H806Im9SDZtmw1sXCnwCafPCenzJRelZlWmV+bgBbk
	VFqmHeZMlVTP/Xp6NCReqFMovU2Egs5sUiZi7JcUF/tRCspDC/D0ydEp7aVkSqmk4+yk4L
	9GwsyGY+fKP96ZY+W0i22YOcfC7g77EAoNxfOoAiGn9YFrtjNeSvVbChyBy9jJJizrJYKy
	r1SUfxr3Q72yQp2HO4j8xht/BXulSJzkyITNesg/1c/mATbbBPsiuLyFfiHLhmj86F1GSi
	OdRuVnoe6v4CjSDocrhvOrA2LznGh1LH9hXhASfLm7vZY8cZogAPN1EGtCQDoQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=O51sbNnc;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EeEbDQhWonnXdbJ5j5TrV2WxPPBauvVZw8N3snFwnw=;
	b=O51sbNnccdWvDx6mhOHor5jev36SCLGVkofz+L3W6Tx0zg9MDyioo8yGEZUQpwDk+LsH+l
	dq9p++TIcbQKOueMvE/coOfg9n85hKi2rqAmzV/o90u8IhkHq3o1cPF5VcdhBRc/C/OUcN
	15msZrYJsVxstHjXuLbjQUlrgnYghIzc8HtMPhUJ7nvlRDF5GP8sVpw9uMai55io4v6GhS
	2F5PQLp7wZre7b2SVJfBkO+HtyJiDPhTWytzPNRLadQ95OMIahqli2D87XNVCL/wjFejGZ
	nlkY3GzNoQxoTmoDJtiNq7zorf4CxVgRACItAuGgnZCvJ8SFV6yZFwQMjajGSQ==
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
Subject: [PATCH 32/39] dt-bindings: display: bridge: Document i.MX95 LVDS display bridge binding
Date: Sat, 11 Oct 2025 18:51:47 +0200
Message-ID: <20251011170213.128907-33-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 22afb507fe09ad60786
X-MBO-RS-META: 5rt3yriaq3d7qpkq6ca771w6qx8wxd37
X-Rspamd-Queue-Id: 4ckVMY3Xpqz9sqh

Document i.MX95 LVDS display bridge (LDB) bindings.

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
 .../display/bridge/fsl,imx95-lvds.yaml        | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml
new file mode 100644
index 0000000000000..8ada9c82a10d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx95-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 LVDS Display Bridge
+
+maintainers:
+  - Marek Vasut <marek.vasut@mailbox.org>
+
+description: |
+  The Freescale i.MX95 LVDS Display Bridge(LDB) has two channels.
+
+  The i.MX8qm/qxp LDB is controlled by Control and Status Registers(CSR) module.
+  The CSR module, as a system controller, contains the LDB's configuration
+  registers.
+
+properties:
+  compatible:
+    const: fsl,imx95-lvds
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: ldb_di0
+      - const: ldb_di1
+      - const: ldb_ch0
+      - const: ldb_ch1
+
+  power-domains:
+    maxItems: 1
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: Represents a channel of LDB.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      reg:
+        description: The channel index.
+        enum: [ 0, 1 ]
+
+      phys:
+        description: A phandle to the phy module representing the LVDS PHY.
+        maxItems: 1
+
+      phy-names:
+        const: lvds_phy
+
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port of the channel.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port of the channel.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+      - phys
+      - phy-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - power-domains
+  - channel@0
+  - channel@1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    ldb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "fsl,imx95-ldb";
+        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
+                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+        clock-names = "pixel", "bypass";
+        power-domains = <&pd IMX_SC_R_LVDS_0>;
+
+        channel@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+            phys = <&mipi_lvds_0_phy>;
+            phy-names = "lvds_phy";
+
+            port@0 {
+                reg = <0>;
+
+                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
+                };
+            };
+        };
+
+        channel@1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+            phys = <&mipi_lvds_0_phy>;
+            phy-names = "lvds_phy";
+
+            port@0 {
+                reg = <0>;
+
+                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
+                };
+            };
+        };
+    };
-- 
2.51.0

