Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B42C7EE23
	for <linux-clk@archiver.kernel.org>; Mon, 22 May 2023 06:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjEVGcW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 May 2023 02:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjEVGcV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 May 2023 02:32:21 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A61AE9;
        Sun, 21 May 2023 23:32:16 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34M6W0Zl083222;
        Mon, 22 May 2023 01:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684737120;
        bh=CiCfrMcb4BYFASqX11gojkZmjfK+qOQOzQ+Q6TDuTCQ=;
        h=From:Date:Subject:References:In-Reply-To:To:CC;
        b=S5FS1GqwsyKfiUOZUFwr81Ckf6aFQUC8yOsEuEMJeTgudjGzKiROBIvLbLXiWW0Zh
         G2OPmy8da/3MMav+dJeHYVqbqZYi7IiT1m3YmQZUmneVwAnyZp6LOoKx148/IatpEh
         ZpCnCWZZIVqsjGoch2euqPdPqE9tr7v5X+As1bf0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34M6W0db069258
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 May 2023 01:32:00 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 01:32:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 01:31:59 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34M6VxKj124364;
        Mon, 22 May 2023 01:31:59 -0500
From:   Jai Luthra <j-luthra@ti.com>
Date:   Mon, 22 May 2023 12:01:55 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: Add binding documentation for
 TI Audio REFCLK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230515-refclk-v2-1-fc9ff08826f5@ti.com>
References: <20230515-refclk-v2-0-fc9ff08826f5@ti.com>
In-Reply-To: <20230515-refclk-v2-0-fc9ff08826f5@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=Et4mocBn4YPUAENbGwghw+m7cx59NgRRvJfkDMlpQXg=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkawxegp1c4a9ZID7+jUDmD9dTFZgFO5HZ2Zlhb
 6QMAZDZ0MKJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZGsMXgAKCRBD3pH5JJpx
 RY0UD/4vD7/4ImWAuBjukkX2uLtSfX3bC6cA2OxD+NeZVU9/DZgd1OWV7MpiijhQh3y002NXPUA
 B52I+t9X/PL4fg8C1FlyBzpZm6AA3DKd1Drs28Q9tBCcxtvZiqX8O7qnaFf3aVXYGXABoxKI1SQ
 W/QqOcXscNInPwZaPFeUyeMMwmyGXAkCrInwesD3Xf0tJRZhOT8GGI9rpE6XvZgudDTx7eRTK9/
 kswxj/JhgtsVa+tXnXFUEGQ7rcL8OEkgNgSZ6N5QrNDQ8iv6Am99aNY8feWvicTZDwFhO/OmvX0
 n8dAIgiJWekhbSeq7dUdaMI53Ps0MaNFJS9pbfl72yP1X+N74aHee++AslwzLjBz+S+ZnH5G18Q
 Ayd4ye6SiVMhlzZZSyNagPTrVMYhGHcacX8wn9H/vjIM0OKzTv5C5MYOfcFtiNkIvMokDdPRSfC
 qOPrHtmuAFlfUg03W/vUaRzeFYDGm2S8K2kVKhXVygX5cWIyRZt5w4s8jvqIUSV26eqPZnbVkUn
 7Cs6wKQg2ITyA05VUy59Rv5m4V11TR+dhwaV82eHYT27QF50tkdKolWdnkJvjV+SuefBmQCONWH
 0O2QNx/1AmyXBvkBCuzeLODL8kUjjIJuvTeKMScuULo/XOgefpA5iI2mvKnkRWk6iKmQKD+In2G
 VIgXCv14e/ZdVXA==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add DT bindings for TI's audio reference clocks (REFCLK) present on AM62
SoC.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../bindings/clock/ti,am62-audio-refclk.yaml       | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
new file mode 100644
index 000000000000..b2e40bd39a3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,am62-audio-refclk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Audio Reference Clock
+
+maintainers:
+  - Jai Luthra <j-luthra@ti.com>
+
+properties:
+  compatible:
+    items:
+      - const: ti,am62-audio-refclk
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    audio_refclk0: clock@82e0 {
+        compatible = "ti,am62-audio-refclk";
+        reg = <0x82e0 0x4>;
+        clocks = <&k3_clks 157 0>;
+        assigned-clocks = <&k3_clks 157 0>;
+        assigned-clock-parents = <&k3_clks 157 8>;
+        #clock-cells = <0>;
+    };

-- 
2.40.1

