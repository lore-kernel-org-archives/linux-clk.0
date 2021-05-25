Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B07C2B9F8
	for <linux-clk@archiver.kernel.org>; Tue, 25 May 2021 09:02:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 485056100B
	for <linux-clk@archiver.kernel.org>; Tue, 25 May 2021 09:02:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhEYJEV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 May 2021 05:04:21 -0400
Received: from mo-csw-fb1515.securemx.jp ([210.130.202.171]:37800 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhEYJEU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 May 2021 05:04:20 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1515) id 14P8lH3X029612; Tue, 25 May 2021 17:47:17 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 14P8l66M012871; Tue, 25 May 2021 17:47:06 +0900
X-Iguazu-Qid: 34tMXTv7vvsrHGppiG
X-Iguazu-QSIG: v=2; s=0; t=1621932426; q=34tMXTv7vvsrHGppiG; m=fB1mUvOVKKSiWUUtYzo2/exqNeA6x3ruH6fNiPP+lS0=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1511) id 14P8l4EI026345
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 25 May 2021 17:47:05 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id 611DA10008D;
        Tue, 25 May 2021 17:47:04 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 14P8l3MT006840;
        Tue, 25 May 2021 17:47:04 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, punit1.agrawal@toshiba.co.jp,
        yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 2/4] dt-bindings: clock: Add DT bindings for PLL of Toshiba Visconti TMPV7700 SoC
Date:   Tue, 25 May 2021 17:46:53 +0900
X-TSB-HOP: ON
Message-Id: <20210525084655.138465-3-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525084655.138465-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210525084655.138465-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for PLL of Toshiba Visconti TMPV7700 SoC series.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../clock/toshiba,tmpv7708-pipllct.yaml       | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pipllct.yaml

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pipllct.yaml b/Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pipllct.yaml
new file mode 100644
index 000000000000..a8d7ee6dd883
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pipllct.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/toshiba,tmpv7708-pipllct.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti5 TMPV7708 PLL Controller Device Tree Bindings
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description:
+  Toshia Visconti5 PLL controller which supports the PLLs on TMPV7708.
+
+properties:
+  compatible:
+    const: toshiba,tmpv7708-pipllct
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  osc2-clk-frequency:
+    description: Frequency of the OSC2 oscillator.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - osc2-clk-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pipllct: pipllct@24220000 {
+            compatible = "toshiba,tmpv7708-pipllct";
+            reg = <0 0x24220000 0 0x820>;
+            #clock-cells = <1>;
+            osc2-clk-frequency = <20000000>;
+        };
+    };
+...
-- 
2.31.1

