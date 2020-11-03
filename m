Return-Path: <SRS0=je5o=EJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657D2C2D0A3
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 11:19:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 228562071A
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 11:19:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbgKCLT5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Nov 2020 06:19:57 -0500
Received: from inva021.nxp.com ([92.121.34.21]:41062 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728476AbgKCLTU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 3 Nov 2020 06:19:20 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 18AD1200869;
        Tue,  3 Nov 2020 12:19:18 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0B9BD2008F0;
        Tue,  3 Nov 2020 12:19:18 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 515FD2033F;
        Tue,  3 Nov 2020 12:19:17 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v5 09/14] Documentation: bindings: clk: Add bindings for i.MX BLK_CTL
Date:   Tue,  3 Nov 2020 13:18:21 +0200
Message-Id: <1604402306-5348-10-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604402306-5348-1-git-send-email-abel.vesa@nxp.com>
References: <1604402306-5348-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the i.MX BLK_CTL with its devicetree properties.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/fsl,imx-blk-ctl.yaml | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx-blk-ctl.yaml

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/fsl,imx-blk-ctl.yaml
new file mode 100644
index 00000000..5e9eb40
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,imx-blk-ctl.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fsl,imx-blk-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX BLK_CTL
+
+maintainers:
+  - Abel Vesa <abel.vesa@nxp.com>
+
+description:
+  i.MX BLK_CTL is a conglomerate of different GPRs that are
+  dedicated to a specific subsystem. Because it usually contains
+  clocks amongst other things, it needs access to the i.MX clocks
+  API. All the other functionalities it provides can work just fine
+  from the clock subsystem tree.
+
+properties:
+  compatible:
+    items:
+      - enum:
+         - fsl,imx8mp-audio-blk-ctl
+         - fsl,imx8mp-hdmi-blk-ctl
+         - fsl,imx8mp-media-blk-ctl
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+
+    audio_blk_ctl: clock-controller@30e20000 {
+       compatible = "fsl,imx8mp-audio-blk-ctl", "syscon";
+       reg = <0x30e20000 0x10000>;
+       power-domains = <&audiomix_pd>;
+
+       #clock-cells = <1>;
+       #reset-cells = <1>;
+    };
-- 
2.7.4

