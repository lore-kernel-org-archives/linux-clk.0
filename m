Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02C5280CF6;
	Sat, 11 Oct 2025 17:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202285; cv=none; b=HPEqVg4NzjO/j1x/fIN1pXV0QUwwd3XJn4zpzWAU1Sc2Lp31hVXTUBSbQvRuD8ZX1MAOeW+W2vcUonqPyi120JZPtmS/yOKe5Id25lZzynZHhuedv+bvw6iAwDny4WU+xBIHiBUlF8F+M95NWWCB0YS2gqTba8Nt7R7s+hKz6QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202285; c=relaxed/simple;
	bh=shjGUgD42aA3UBeH8UXPox3YY2NG8E0aO/Pif9jEx2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpdXMkeE0qF8qvjYdDHS6ZAuU5ovNKL1bf3SWYBCBO4tT9KKSzdmLdkGlYj3JZDOBETLt7V807KV41w6nfjSJeC3dDoFkJpI3xIr9bUasEPPXMflDLZCc3RLld8KnvDBw1qVP1VqUkuoqOzWmiEI0AimOD9qBixH5aunCMSretE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tqjlmaHY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=f++N/k58; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tqjlmaHY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="f++N/k58"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckVMt0wx4z9smD;
	Sat, 11 Oct 2025 19:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LjHuRvAlrfCTpQDqtJrxybp4IoylwmrNNBs7s/aRME=;
	b=tqjlmaHY1CGDfdfoJiakvgTc2fopzFqf6q/gsCflhFR4rHqU7L2EEsms4bzwKYHXYz4b3o
	V4g3hvuaXo0bCu32JJofDqANm16PwIHAoIdMxp8k3XYBbb1aUiV89Cfwkiuh5FNeDj4yG7
	hZREnFB1IqgP33ytoWRKCIeNMlY0UFL39PEVLLkgWGc7Dr6eQE0y2fIkIrrJdPxXnUGR75
	GFi5jlbVW+STjYsMTgEa8bW66No4Si3qYAQIfKYhSY3/r+VQTe/2uA14Duw8s/Z0QgQh09
	HcwGhM9Itesjg3icn3UyLkYdVflVpDhJsiR1bSWFPgjr58F2pvp2xZkLc3bziQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LjHuRvAlrfCTpQDqtJrxybp4IoylwmrNNBs7s/aRME=;
	b=f++N/k58Ot2ykVd+EAPD/3jivNMZ2j25H2ZOquPo6g9OT0UyYX8s1RAcZUpBhHcLHz3SO7
	4aDJ3l5xEysB1uf9Is7mT1ZPiZYweub6nq7FdwUyYhmy8bGpRx3MykW/4PIZt146zL/3UW
	x5c6nPQJN6Vo0pjn9sFuBKu+e9TXEr/7eFrscX4GZd5NlMDG3qO6hSw3N+Ip1nobyiYDRi
	Jk0WiuNIDJvOu0NbI7PkIliODsQZ0Qbix4FP1S+SVRnBDYMxtRXRLowvYkm5FsmTZ8PAMp
	vXv6EG10as4nBcYQJfP3Xx7oliOur4qUXxNQA9HWIpRTsCM7TRwX5Y2G7Fmufw==
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
Subject: [PATCH 38/39] dt-bindings: clock: support i.MX95 Display Stream CSR module
Date: Sat, 11 Oct 2025 18:51:53 +0200
Message-ID: <20251011170213.128907-39-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xry4amm6fd4yjhbdnui4z36buro1w5ge
X-MBO-RS-ID: 7d7d6d1d1f9255c8d3d

i.MX95 DISPLAY STREAM_CSR includes registers to control DSI PHY settings.
Add dt-schema for it.

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
 .../imx/nxp,imx95-display-stream-csr.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
new file mode 100644
index 0000000000000..61153120c9378
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/nxp,imx95-display-stream-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX95 Display Stream Block Control
+
+maintainers:
+  - Marek Vasut <marek.vasut@mailbox.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nxp,imx95-display-stream-csr
+          - nxp,imx95-master-stream-csr
+          - nxp,imx95-mipi-tx-phy-csr
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@4ad00000 {
+      compatible = "nxp,imx95-display-stream-csr", "syscon";
+      reg = <0x4ad00000 0x10000>;
+      clocks = <&scmi_clk 62>;
+    };
+...
-- 
2.51.0

