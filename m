Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D081EB64DB
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jun 2023 12:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344678AbjFOMCE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jun 2023 08:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344675AbjFOMBr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jun 2023 08:01:47 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082F53C10;
        Thu, 15 Jun 2023 04:56:50 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FBufmJ086492;
        Thu, 15 Jun 2023 06:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1686830201;
        bh=W9iiHwjdGP5imfSBo37bnm2qDQ491c1YdJEXZJipicM=;
        h=From:Date:Subject:References:In-Reply-To:To:CC;
        b=GW+k0fMhYHeJ6q9PPU5rGDxIZDhEuUWzzl0DPBDBW1VE8ILiVbX1GY4OQilntjACU
         0U03oULZapFtRnkEH6B7SrO+sgdCLhEVG/NUyYfnQSCmO+2kg0KN1Lrh5PX6pkjeFU
         qEs8l+/Z3IQD5pPmLKwzg8+kXvqCZMvP+oiaEa3A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FBufKm130043
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 15 Jun 2023 06:56:41 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 06:56:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 06:56:41 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FBueiY002003;
        Thu, 15 Jun 2023 06:56:41 -0500
From:   Jai Luthra <j-luthra@ti.com>
Date:   Thu, 15 Jun 2023 17:25:35 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: Add binding documentation for
 TI Audio REFCLK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230515-refclk-v3-1-37c0b550f406@ti.com>
References: <20230515-refclk-v3-0-37c0b550f406@ti.com>
In-Reply-To: <20230515-refclk-v3-0-37c0b550f406@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jai Luthra <j-luthra@ti.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=sQ9ec5YFJ+Y8ENQetUcqU9qt54E7RHL6FfG8IWKEvjo=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkivx390StvIVTDs3XMMkmqkRhBKVHtbAo/YEYt
 r7sfHiEX6WJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZIr8dwAKCRBD3pH5JJpx
 RQRLD/wPZVGXumEedqmhqZDtKFsGoATCbKaMebE+idnLSYKetn8ZAwL0LKabhowjDC5+m4/nvTh
 sGurUHrhyZdE6S5dVJAe6XbzkAsR0llWpTisyJBOCBx/++Jxa7NtRYINu1os0OvCjHywwcrv6LH
 DEfJcSWb3i+XmO3+NmcuyTjyrMPcbWex257sP56qFifasjxcsk6uVgit27kOggnIfaOxOPH+5Jf
 VAbUD6TRy58AN4EvqJMTI39fP0B78lvyooAwmiyllB9BAsw87xtVv56ZGwGkHvjoj6vnCSoRn9o
 R9X829qDuxCQ4sCasvPtw7V2BO2/gobbMZMoDADPt7+suunneVMl6yPSRwPPf1CSC/nD6JY4slW
 FCGqRAxh6/DwfJ1CqLlXLxz1hTuSFaJ5RXFHjfyeUjlVjKvAWSxju4cJrOkICooMLDR/L4uuB9R
 5i14dK+VUrulWnaJMnUrAjmWiuyxJcY0wDlqdNyIidxnIKno1lc9QgBQK11cCNWsBFfaj/KLyka
 tkoJlAeDW8IY2fVpifOeTx8HTrkO3gwbFruyaXqSI37kskgnj8YBarzFVYABRoD//zqTkKyNO+1
 REVPfT8+woc8CTNQjss0Lj/O9208hAQEN2ioWwE4HXO7DPiZHMaOEza/ZB5vnexXXlqyI0FXAHn
 yxSlY/7IuTwk+iw==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add DT bindings for TI's audio reference clocks (REFCLK) present on AM62
SoC.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
2.41.0

