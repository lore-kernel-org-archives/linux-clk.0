Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52013CCA482
	for <linux-clk@archiver.kernel.org>; Sat, 25 Jun 2022 01:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbiFYBc4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 21:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbiFYBcy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 21:32:54 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C78C45AFE;
        Fri, 24 Jun 2022 18:32:51 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id CAEED84472;
        Sat, 25 Jun 2022 03:32:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656120769;
        bh=XORlzyHvsaFZp8TCn7dgYyIVqomD81V6Jj80HNYGlV4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bOoS0abhEwCRsRNKEsYQfXkbX1MTIDopQV9BOPB0NG+r2L215l7hrAD15rmoadZJd
         2LZFdU8HNZzoAXkTbhFMCaLwrA1nosRbqLsygx7fcbacfbw+KAotoyLqeLiAFtUUML
         tOVXbYd6qye+9bTztct26NqeyB9ZHLb7HNiQJzbq2orAkddqq/RmkInYFYdMi8mXYp
         o66NxwIx47zxFO+Iq2xOdl/Re5vow1PtLxFgfjD3Th3u/rzOY0jeUquN2Ky9N81tVo
         MqkFpq+1QxR5G/GqJgheBef6J73vpgLEw5bgBdGYMdZ2Rd7YP2C5Rx3RjTb9pukt0L
         7KAgDEdLVU5wQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: [PATCH v3 4/6] dt-bindings: clock: imx8mp: Add audiomix block control
Date:   Sat, 25 Jun 2022 03:32:33 +0200
Message-Id: <20220625013235.710346-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220625013235.710346-1-marex@denx.de>
References: <20220625013235.710346-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
series of clock gates and muxes. Add DT bindings for this IP.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-imx@nxp.com
---
V2: No change
V3: - Add missed RB from Rob from V1
    - Rename audio_ahb to plain ahb
---
 .../bindings/clock/imx8mp-audiomix.yaml       | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml

diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
new file mode 100644
index 0000000000000..01b4e1e311cef
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8MP AudioMIX Block Control Binding
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  NXP i.MX8M Plus AudioMIX is dedicated clock muxing and gating IP
+  used to control Audio related clock on the SoC.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-audio-blk-ctrl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    const: audio
+
+  clocks:
+    minItems: 7
+    maxItems: 7
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: sai1
+      - const: sai2
+      - const: sai3
+      - const: sai5
+      - const: sai6
+      - const: sai7
+
+  '#clock-cells':
+    const: 1
+    description:
+      The clock consumer should specify the desired clock by having the clock
+      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mp-clock.h
+      for the full list of i.MX8MP IMX8MP_CLK_AUDIOMIX_ clock IDs.
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - power-domain-names
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  # Clock Control Module node:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+
+    clock-controller@30e20000 {
+        #clock-cells = <1>;
+        compatible = "fsl,imx8mp-audio-blk-ctrl";
+        clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
+                 <&clk IMX8MP_CLK_SAI1>,
+                 <&clk IMX8MP_CLK_SAI2>,
+                 <&clk IMX8MP_CLK_SAI3>,
+                 <&clk IMX8MP_CLK_SAI5>,
+                 <&clk IMX8MP_CLK_SAI6>,
+                 <&clk IMX8MP_CLK_SAI7>;
+        clock-names = "ahb",
+                      "sai1", "sai2", "sai3",
+                      "sai5", "sai6", "sai7";
+        power-domains = <&pgc_audio>;
+        power-domain-names = "audio";
+        reg = <0x30e20000 0x10000>;
+    };
+
+...
-- 
2.35.1

