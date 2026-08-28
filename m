Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15E9469834;
	Fri, 28 Aug 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924909; cv=none; b=QDX+YQl+0mrP/FzqeiIae+zLks3GVrytWybxeJVcaxy56cT2hvI+ITFwfwnr5QHdedo16B4YhxT6iIysW5UgRSPAQSMC5qfx+gP5Xb8sG1qPpdUIsPd5pXnKteHX6DJ3kOc3k5a34xEBOC9XPO3XLauQbRRpdPzyUsFe4LX9Bw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924909; c=relaxed/simple;
	bh=ZfuPMs0DOKI99Q9NCbNb2V9SomixPB3u3nesQJtTgrM=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=Rz8awZrS8pGZniK6ZQzMgOzl57XwXmOm7R/jvDPrEjY00aPkFQqtNZItJTRJ6tMZ7XbF9aQxes47y2Itj15+2LTVRMp2z1kumwnShp3txl40IcnDcwi64rDgQLnz+zrQgtsTAov1yoIhHbPb0MVxRf9/+J+5lbph9zxXjaLJ4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Dfwsxnt/; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Dfwsxnt/"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260828134818euoutp014bd7f860d90d0ea018a93dab00064d46~P-DjRIa-22677826778euoutp01p;
	Fri, 28 Aug 2026 13:48:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260828134818euoutp014bd7f860d90d0ea018a93dab00064d46~P-DjRIa-22677826778euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787924898;
	bh=3FNVkoCj+rUBQs5sF0+gEF30Fzp817jl+zaghdPRBDI=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Dfwsxnt/WVHDbjOgNfop4KqlsaRnJdeIxWUe0FntCXWAhlSWhblZ8kPOwXafZuwQY
	 KdogJqSQpeixfczifupD7zwzWNxga3a3YMAZN/muHLysYkHQHVGIFE9LegnxBvkjVN
	 +V84JMf/nXvwVlMA5ulakN+o6Flac7VlkiPsczv8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d~P-Di5h09s1637816378eucas1p2I;
	Fri, 28 Aug 2026 13:48:17 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260828134815eusmtip14def0533d74c34de71cd13bac4bd71f3~P-DhGGsh43269032690eusmtip1D;
	Fri, 28 Aug 2026 13:48:15 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 28 Aug 2026 15:47:26 +0200
Subject: [PATCH v2 02/15] dt-bindings: display: bridge: Add
 starfive,jh7110-inno-hdmi-controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-jh7110-clean-send-v2-2-331680c8b9d1@samsung.com>
In-Reply-To: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,  Simona
	Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,  Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>,  Andy Yan
	<andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>,  Maud
	Spierings <maudspierings@gocontroll.com>,  Graham Markall
	<hello@big-grey.co.uk>,  Michal Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d
X-EPHeader: CA
X-CMS-RootMailID: 20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
	<CGME20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d@eucas1p2.samsung.com>

Add the dt-binding for the StarFive JH7110 Innosilicon HDMI controller
(DRM bridge).

This device is the second child of the starfive,jh7110-hdmi-subsystem node.
It consumes register access clocks (sys, mclk, bclk) from the voutcrg and
both the pixel clock (pclk) and the PHY from its hdmi_phy sibling.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../starfive,jh7110-inno-hdmi-controller.yaml      | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0e584e7b756e24e2f99a62daab3117bbf4b472b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Innosilicon HDMI Controller
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The controller portion of the StarFive JH7110 INNO HDMI IP.
+
+properties:
+  compatible:
+    const: starfive,jh7110-inno-hdmi-controller
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System clock for register access
+      - description: Module clock
+      - description: Bus clock
+      - description: Pixel clock from PHY
+
+  clock-names:
+    items:
+      - const: sys
+      - const: mclk
+      - const: bclk
+      - const: pclk
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: hdmi_tx
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: hdmi-phy
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      A graph node with one input port and one output port.
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  # Shown as a child of the HDMI subsystem node; see
+  # Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsystem.yaml
+  # for the full node.
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    controller {
+        compatible = "starfive,jh7110-inno-hdmi-controller";
+        clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+                 <&hdmi_phy>;
+        clock-names = "sys", "mclk", "bclk", "pclk";
+        interrupts = <99>;
+        phys = <&hdmi_phy>;
+        phy-names = "hdmi-phy";
+        resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+        reset-names = "hdmi_tx";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&dpu_out_dpi0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&hdmi_con_in>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.34.1

