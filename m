Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E913280CC8;
	Sat, 11 Oct 2025 17:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202266; cv=none; b=lQU5di9r9bLCcc34DHCnDxxqIfjRjaso3p3ZLCB6lQbnbgVr/avFPAU3hA914WZ+2idhIzgwCfOf23w0H8uvFEY5d9vsZUnvtkdUl+yFyxCLn8OhHALEU6rrP158s/VnIJXjR+KQeQISxiV/e1r0sZDKYJlZr2wSvF1YdGqpATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202266; c=relaxed/simple;
	bh=PJYr5yDEJqdJzBYw6H9GNtvHvQtcbl5iKjenqkZCF8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2k8XaJYmPBxtBvS5zLOMagQinE1sEat95KBEOkBU/Wl5VMRvsHbFRzlQiSKE3N8ojiRlmOTXr3mJD6DupJhf6+zubb35K4Mm5rzSmO8+nthZ9SeTuVq0WktzY0WKcppF2rrxh1/c/MUi3Euligoinqh93IThrxH+J0uM4A6z2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QV0toiqM; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WbDdpH6N; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QV0toiqM";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WbDdpH6N"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVMV4Lvcz9swL;
	Sat, 11 Oct 2025 19:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NUFWy+mVyjqpy6KjPkU7AsQnp7kwZZufNXxN7pMKXnk=;
	b=QV0toiqMWyhVJSYQxlxF+xJb1WAfFd/QB2lXiPc34PVWvIIuD/SK2/M8H+nn2tDZzToEwf
	85v9D2mxJJCvDFfqgyRb2BoA1mHtWP8uaLBEUuctOWYHJXunzbCzjBG/neQJf/97GVod+U
	I4sHQfB976/RMmKa7yrzaOZsjqcM+kMzA3jk9HeIEZCx+taiV9WJG6oxnWKTNTdpa9udew
	AwoXS3cNCi6IafOrRHzvqlDrsb3unbAmoqyKE6i0zaZwZzD+vr0K/IYAeo6G4SWtQUKtAK
	HEkB+wt9Y4bDsffa5Ntig+tlHc2hC6d2FMFNubAeWsgnPqCapfup5B1SXjfujQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NUFWy+mVyjqpy6KjPkU7AsQnp7kwZZufNXxN7pMKXnk=;
	b=WbDdpH6Ng7IQS2ZF5dF4RIlD9KdiFxR2eZz0bxuF9qsdel+V7SX3Lp6ftzQ0UUtFmvtt6k
	k1eo16y1HNeCOChZI9FwK2mgNyvRxzmpV3cyXVJMck5L/MYKeArfhis4AxJmeR9dGttSVF
	kIwmby1s/8f6eOnJGkb1OpasPX+TFrXXv+XZt8Yew+wH8p7rRjVrqpK4vpsaDiyH/A23Vg
	s0ek9wMS8yK9NlBvdeDMigyRST8TYHu7L4KnfCOr2a/k8hGQND8pKgUaz8/nLOCml/50IM
	p291rgdgkueHkD6MqqNk32+iqSvB0cQnX7CaOkUAIS37dlKlBCJm6h9wzBTaXw==
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
Subject: [PATCH 31/39] dt-bindings: clock: Split support for i.MX95 LVDS CSR
Date: Sat, 11 Oct 2025 18:51:46 +0200
Message-ID: <20251011170213.128907-32-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f2d9cf52bcfd60a5d7e
X-MBO-RS-META: eju1ar4k4no4msuxweskionksmju7kb8

Split i.MX95 LVDS CSR into separate binding document, as it is different
enough from the other CSR in the block controller binding document and
has subnodes too.

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
 .../bindings/clock/nxp,imx95-blk-ctl.yaml     |  1 -
 .../clock/nxp,imx95-lvds-blk-ctl.yaml         | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,imx95-lvds-blk-ctl.yaml

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d62..0a28e24135243 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -18,7 +18,6 @@ properties:
           - nxp,imx95-camera-csr
           - nxp,imx95-display-csr
           - nxp,imx95-hsio-blk-ctl
-          - nxp,imx95-lvds-csr
           - nxp,imx95-netcmix-blk-ctrl
           - nxp,imx95-vpu-csr
       - const: syscon
diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-lvds-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-lvds-blk-ctl.yaml
new file mode 100644
index 0000000000000..663f3ee1df4e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-lvds-blk-ctl.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nxp,imx95-lvds-blk-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX95 LVDS Block Control
+
+maintainers:
+  - Marek Vasut <marek.vasut@mailbox.org>
+  - Peng Fan <peng.fan@nxp.com>
+
+properties:
+  compatible:
+    items:
+      - const: nxp,imx95-lvds-csr
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description:
+      The clock consumer should specify the desired clock by having the clock
+      ID in its "clocks" phandle cell. See
+      include/dt-bindings/clock/nxp,imx95-clock.h
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^lvds@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx95-lvds
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx95-ldb
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - power-domains
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    syscon@4c410000 {
+      compatible = "nxp,imx95-lvds-csr", "syscon";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      reg = <0x4b0c0000 0x10000>;
+      #clock-cells = <1>;
+      clocks = <&scmi_clk 76>;
+      power-domains = <&scmi_devpd 13>;
+    };
+...
-- 
2.51.0

