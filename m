Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD2BC2B9F8
	for <linux-clk@archiver.kernel.org>; Tue, 25 May 2021 09:01:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 220AD6141B
	for <linux-clk@archiver.kernel.org>; Tue, 25 May 2021 09:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbhEYJCt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 May 2021 05:02:49 -0400
Received: from mo-csw-fb1515.securemx.jp ([210.130.202.171]:37668 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhEYJCt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 May 2021 05:02:49 -0400
X-Greylist: delayed 849 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 May 2021 05:02:49 EDT
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1515) id 14P8lI5H029613; Tue, 25 May 2021 17:47:18 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 14P8l6xI000617; Tue, 25 May 2021 17:47:07 +0900
X-Iguazu-Qid: 34tKJKyADU8jd6341I
X-Iguazu-QSIG: v=2; s=0; t=1621932426; q=34tKJKyADU8jd6341I; m=kq8eNwFnEjaPRwcE0vY9Pymw94pfMN7NhZHNKG2EMXA=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1513) id 14P8l5Kv013657
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 25 May 2021 17:47:06 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id BCD921000C3;
        Tue, 25 May 2021 17:47:04 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 14P8l4Oi006845;
        Tue, 25 May 2021 17:47:04 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, punit1.agrawal@toshiba.co.jp,
        yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 3/4] dt-bindings: clock: Add DT bindings for SMU of Toshiba Visconti TMPV7700 SoC
Date:   Tue, 25 May 2021 17:46:54 +0900
X-TSB-HOP: ON
Message-Id: <20210525084655.138465-4-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525084655.138465-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210525084655.138465-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for SMU (System Management Unit) controller of
Toshiba Visconti TMPV7700 SoC series.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../clock/toshiba,tmpv7708-pismu.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pismu.yaml

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pismu.yaml b/Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pismu.yaml
new file mode 100644
index 000000000000..7a8eac00e624
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pismu.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/toshiba,tmpv7708-pismu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti5 TMPV7708 SMU controller Device Tree Bindings
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description:
+  Toshia Visconti5 PLL controller which supports the clock and resets on
+  TMPV7708.
+
+properties:
+  compatible:
+    const: toshiba,tmpv7708-pismu
+
+  reg:
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
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pismu: pismu@24200000 {
+            compatible = "toshiba,tmpv7708-pismu";
+            reg = <0 0x24200000 0 0x2140>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+    };
+...
-- 
2.31.1

