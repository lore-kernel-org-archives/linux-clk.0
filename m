Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32BA31715F
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 21:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788644016; cv=none; b=QslwGkYZe0oKAMLVal55zqPuWHMzgmSBRfq5yvTUIXWxsQSNxRsz1ExorGyKm2UtL3vKvwPOm97Z2wSCnx5jFZKASaHyQJ+HO6svoqdxTnyCd+w3PS7R356g1HbMGqeHKdpujxs1kkDd7ROx332m66bPv8DU/ZRGiOjxwssBF+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788644016; c=relaxed/simple;
	bh=PVilgbHHs7aR8Qkx3HORWWvrIUgpzson356NM/5tNnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mm4w+0xhz+vMUqJGQkJDcWO+vwREHqp8A3xo1TwLeJ1uiA3zH2m+2TGUZIJLaDriOHCEgP+013EpACDhzZ+wdL35jRraQMJ2FtVnPoYxUPY0T8LOkPEZYW32PiT4NkF/Tgp1n0sofm2tpVzxrOT25hv1Va3FJnoqZl5YuU0blQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhDN8Nl4; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhDN8Nl4"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9edso107171a91.2
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 14:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788644013; x=1789248813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+WACWGGRxnr7upWs/bzK9T7rZ+TwizKBmDY48I3U9o=;
        b=OhDN8Nl4I15AbEH8vfoh9aT8LMRL8GA74qceBHTSYXs0CNB29l3WYtUT9gyMXArLxL
         gKvF4bLQVOiXKR6dMm4z1tBkVZBWcU4QoQNvlpjGqbFcz6DEe2kCtLKbu/oHOcUASSsR
         6Yyb/8LzbF6TnbeIw+iOkos5ZBw27qwnqrzlCAY5dfZzK6EQ8IacVttaHDtYvUW83YEG
         sqQMOM7SOO0skxS0jhCr3bc7y437h+iHbRIh/+vxiL6JGMH+dRIvkQxaVKoD2J/1NvXQ
         Ogf0P0Arlwgg3hDhykoOqXkjw30XdDSffqSh+txA4oTOCgymDU8l3FERXAbDU33zgXWP
         P7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788644013; x=1789248813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+WACWGGRxnr7upWs/bzK9T7rZ+TwizKBmDY48I3U9o=;
        b=QlU3Ff2LMU+fGuhL4H1gjJUR1dwGUjB0RnxPbh6P7PfC7stLIKgjjJ4M0ytppLx61i
         OeQoCxOROHzOzO8yvnRymu4Moxx3NlPbmDcxd4/VkHJg0rpqFSuXQfCCbeH+/4dOIbZH
         qKqr2Y0bSTF5lbJAKr4ttDY/YfaTpaIcGjt/qIHkNbdx6/CNpY0W8/A8V5yD8fiVmfxh
         y+d+UvueyUs9qbvmpLNOK3oTRaXqusqTkKofiL/Vp/N8Gq0lRYFesbVM22yfPmr1XFJG
         Mpa8l5uEJ/mfBH1h6jTDUDdFp3czD97Feugsjc2Qp1iJ6iUfCJMoIXYFuyh2FdmZQ+h6
         BDsA==
X-Gm-Message-State: AFuF++la0ola56hi6yJ8BSILlmAU0vU1TZcCGsCfpZDXS15uaub0+j8D
	Uww9fDKamVUsFw4hcR839J0bxkw4QJOWpV10IM9gYuZvBGo1MuAbpM79
X-Gm-Gg: AYBFou3XOUwFzkMguxWk1tNNNT9/qctwajry2CCfGBxQZAs3QnJHinCuWADHQXojWIN
	ufJSKZ3sMCny3rZDE/NyPtlFmaeGs8T9BQJehXlHXGvo+2N4DTjwj/FtxkpwbWiOl3I8jP6scOa
	Lt7pfi3SJVvos9XaC8wO+GlaEk6QOmMcy5pKwIbCum0ZZWt1MJpuYRmwTfBQpgyqd4Xieu6NnWR
	Rdk4jjno4RI/MetvE2KTwekm5tO7+aIjp2H1V0jCLOlvGEd1nSPytkKNbXhUkU9xu+avKDul2Xj
	I2dt5hn9vBeQEBHj723FrFceHxEtVxieAD1rrdkJ/5scVhJZhovzaeTvhIE/uFJeQoPzDTtk+qR
	bFYDcdKlJtwLsBflSRagB0kUKv/Vx7qs28h0wLtAwMHq++7xa4Mji5ML0lygxebnY1b3BH54V4Q
	il3B9fLveP0yd5wqJlmcaoRjye9yU5jG0AFhZHFaP0d+cvJ35pQMNCCHY+zXz4vMojwoJT1wWu
X-Received: by 2002:a17:90b:562b:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-39b3d5f2c09mr7341040a91.2.1788644012998;
        Sat, 05 Sep 2026 14:33:32 -0700 (PDT)
Received: from [10.63.138.252] ([2409:40c2:5007:4aea:63cc:914c:1243:e03c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm21538010a91.14.2026.09.05.14.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:33:31 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 06 Sep 2026 03:02:40 +0530
Subject: [PATCH v3 2/2] dt-bindings: clock: ti,dra7-atl: convert to
 dt-schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ti-dra7-atl-v3-2-5962d8f608ed@gmail.com>
References: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
In-Reply-To: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788643973; l=5776;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=PVilgbHHs7aR8Qkx3HORWWvrIUgpzson356NM/5tNnY=;
 b=DL3YnQqEXykByzKQZKcgiPrSi/EuaWqQmmis6FTbLFpIZkjEwsviCp370Al0771vyuyBdRe/H
 QfDGTSMFJqxDDmSYwkaaBzuj4FGsyipibsEHw7Ij0rECGrKIpMRwvoZ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the IP driver portion of the DRA7 ATL (Audio Tracking Logic)
binding from the freeform text binding to dt-schema. Together with
ti,dra7-atl-clock.yaml this fully replaces dra7-atl.txt.

ti,hwmods is marked deprecated as modern DTS uses ti,sysc target-module
wrappers and the property is absent from current dra7-l4.dtsi.

bws/aws maximum set to 15 per the 16 mux sources in
dt-bindings/clock/ti-dra7-atl.h.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/ti/dra7-atl.txt      |  56 ------------
 .../devicetree/bindings/clock/ti/ti,dra7-atl.yaml  | 100 +++++++++++++++++++++
 2 files changed, 100 insertions(+), 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
deleted file mode 100644
index e3c05844ae86..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Device Tree Clock bindings for ATL (Audio Tracking Logic) of DRA7 SoC.
-
-The ATL IP is used to generate clock to be used to synchronize baseband and
-audio codec. A single ATL IP provides four ATL clock instances sharing the same
-functional clock but can be configured to provide different clocks.
-ATL can maintain a clock averages to some desired frequency based on the bws/aws
-signals - can compensate the drift between the two ws signal.
-
-In order to provide the support for ATL and its output clocks (which can be used
-internally within the SoC or external components) two sets of bindings is needed:
-
-
-Binding for the IP driver:
-This binding is used to configure the IP driver which is going to handle the
-configuration of the IP for the ATL clock instances.
-
-Required properties:
-- compatible : shall be "ti,dra7-atl"
-- reg : base address for the ATL IP
-- ti,provided-clocks : List of phandles to the clocks associated with the ATL
-- clocks : link phandles to functional clock of ATL
-- clock-names : Shall be set to "fck"
-- ti,hwmods : Shall be set to "atl"
-
-Optional properties:
-Configuration of ATL instances:
-- atl{0/1/2/3} {
-	- bws : Baseband word select signal selection
-	- aws : Audio word select signal selection
-};
-
-For valid word select signals, see the dt-bindings/clock/ti-dra7-atl.h include
-file.
-
-Examples:
-
-/* binding for the IP */
-atl: atl@4843c000 {
-	compatible = "ti,dra7-atl";
-	reg = <0x4843c000 0x3ff>;
-	ti,hwmods = "atl";
-	ti,provided-clocks = <&atl_clkin0_ck>, <&atl_clkin1_ck>,
-				<&atl_clkin2_ck>, <&atl_clkin3_ck>;
-	clocks = <&atl_gfclk_mux>;
-	clock-names = "fck";
-};
-
-#include <dt-bindings/clock/ti-dra7-atl.h>
-
-&atl {
-
-	atl2 {
-		bws = <DRA7_ATL_WS_MCASP2_FSX>;
-		aws = <DRA7_ATL_WS_MCASP3_FSX>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml
new file mode 100644
index 000000000000..f4bb233be83d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dra7-atl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DRA7 ATL (Audio Tracking Logic) Clock Controller
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+description:
+  The ATL IP is used to generate clock to be used to synchronize baseband and
+  audio codec. A single ATL IP provides four ATL clock instances sharing the
+  same functional clock but can be configured to provide different clocks.
+  ATL can maintain a clock averages to some desired frequency based on the
+  bws/aws signals - can compensate the drift between the two ws signal.
+
+  See also Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml
+
+properties:
+  compatible:
+    const: ti,dra7-atl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: fck
+
+  ti,provided-clocks:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of phandles to the clocks associated with the ATL.
+    minItems: 4
+    maxItems: 4
+    items:
+      maxItems: 1
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the hwmod associated with the ATL.
+    deprecated: true
+    const: atl
+
+patternProperties:
+  "^atl[0-3]$":
+    type: object
+    additionalProperties: false
+    description:
+      Configuration of ATL instances.
+
+    properties:
+      bws:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Baseband word select signal selection.
+        maximum: 15
+
+      aws:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Audio word select signal selection.
+        maximum: 15
+
+    required:
+      - bws
+      - aws
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ti,provided-clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ti-dra7-atl.h>
+
+    atl@4843c000 {
+        compatible = "ti,dra7-atl";
+        reg = <0x4843c000 0x3ff>;
+        clocks = <&atl_gfclk_mux>;
+        clock-names = "fck";
+        ti,provided-clocks = <&atl_clkin0_ck>, <&atl_clkin1_ck>,
+                             <&atl_clkin2_ck>, <&atl_clkin3_ck>;
+
+        atl2 {
+            bws = <DRA7_ATL_WS_MCASP2_FSX>;
+            aws = <DRA7_ATL_WS_MCASP3_FSX>;
+        };
+    };

-- 
2.55.0

