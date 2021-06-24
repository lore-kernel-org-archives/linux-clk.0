Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00BFC49EA7
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 03:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F177613C0
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 03:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhFXDqV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jun 2021 23:46:21 -0400
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:60482 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhFXDqU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Jun 2021 23:46:20 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 15O3hoeQ008755; Thu, 24 Jun 2021 12:43:50 +0900
X-Iguazu-Qid: 34tKtFoas3MGyUSbSe
X-Iguazu-QSIG: v=2; s=0; t=1624506230; q=34tKtFoas3MGyUSbSe; m=TlF7vYjPlrCXnNMAHx+rzAtLCz6VQVuaRlMa+XDu+w0=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1510) id 15O3hm0d029662
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 24 Jun 2021 12:43:49 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id 96A8D1000B9;
        Thu, 24 Jun 2021 12:43:48 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 15O3hlsj012590;
        Thu, 24 Jun 2021 12:43:48 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 2/4] dt-bindings: clock: Add DT bindings for PLL of Toshiba Visconti TMPV770x SoC
Date:   Thu, 24 Jun 2021 12:43:35 +0900
X-TSB-HOP: ON
Message-Id: <20210624034337.282386-3-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624034337.282386-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210624034337.282386-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for PLL of Toshiba Visconti TMPV770x SoC series.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../clock/toshiba,tmpv770x-pipllct.yaml       | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml b/Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
new file mode 100644
index 000000000000..e88c9e4c4982
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/toshiba,tmpv770x-pipllct.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti5 TMPV770X PLL Controller Device Tree Bindings
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description:
+  Toshia Visconti5 PLL controller which supports the PLLs on TMPV770X.
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
2.32.0

