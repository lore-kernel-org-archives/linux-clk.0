Return-Path: <SRS0=iGjC=EO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE73C56201
	for <linux-clk@archiver.kernel.org>; Sun,  8 Nov 2020 18:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4910021D40
	for <linux-clk@archiver.kernel.org>; Sun,  8 Nov 2020 18:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="e75+iNV6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbgKHSvs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Nov 2020 13:51:48 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:46625 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728854AbgKHSva (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Nov 2020 13:51:30 -0500
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 6CD6D23E6F;
        Sun,  8 Nov 2020 19:51:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1604861487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vO5z6bNFh8p9WfUjnOgafQ0jJFzSGzWQXf8Tg6kwf5I=;
        b=e75+iNV6f4tZTiHklhGdR2andvnC8WcUf34rOoCFej83KVD/DP9wn5qmbay6Jv23h19slX
        ME5/G1DhMZ2fHnknL2BqY7iv7AbSDJYx2NdB7VIqJNmaodh235gPRv4E7t+Ltm3EcMKTAG
        eb8cYvcroo/b51yTyEGDa17xNXogckg=
From:   Michael Walle <michael@walle.cc>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        "Y . b . Lu" <yangbo.lu@nxp.com>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Ashish Kumar <Ashish.Kumar@nxp.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 6/9] dt-bindings: clock: document the fsl-flexspi-clk driver
Date:   Sun,  8 Nov 2020 19:51:10 +0100
Message-Id: <20201108185113.31377-7-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201108185113.31377-1-michael@walle.cc>
References: <20201108185113.31377-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v2:
 - none

Changes since v1:
 - new patch

 .../bindings/clock/fsl,flexspi-clock.yaml     | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,flexspi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/fsl,flexspi-clock.yaml b/Documentation/devicetree/bindings/clock/fsl,flexspi-clock.yaml
new file mode 100644
index 000000000000..1fa390ee7b9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,flexspi-clock.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fsl,flexspi-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale FlexSPI clock driver for Layerscape SoCs
+
+maintainers:
+  - Michael Walle <michael@walle.cc>
+
+description:
+  The Freescale Layerscape SoCs have a special FlexSPI clock which is
+  derived from the platform PLL.
+
+properties:
+  compatible:
+    enum:
+      - fsl,ls1028a-flexspi-clk
+      - fsl,lx2160a-flexspi-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    dcfg {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        fspi_clk: clock-controller@900 {
+            compatible = "fsl,ls1028a-flexspi-clk";
+            reg = <0x900 0x4>;
+            #clock-cells = <0>;
+            clocks = <&parentclk>;
+            clock-output-names = "fspi_clk";
+        };
+    };
-- 
2.20.1

