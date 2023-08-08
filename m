Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70C6C001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 20:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbjHHU3I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 16:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbjHHU24 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 16:28:56 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB62F18548;
        Tue,  8 Aug 2023 12:48:24 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RL3dc4fFnz9th0;
        Tue,  8 Aug 2023 21:48:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1691524100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=m4T7txvwDZo66//eyFQ595Fov1LoPrHozn9oIy+lVAo=;
        b=YnO/HK8tkEG9CJHVE7JePmlazpXHKf3I7BMpnZmLmqAwKlcAUZA43cUfnAD6Rsqcbgmv5G
        kzLC9nKpRYKT0V6itVvHd7HHYwIJr7OBBFxSlb5AVFykJa09MrTke5tpBULviEnn47uJBJ
        uTXAKk6f59l7/pUihWL0Z9F9lM/n6ufS1kf9MzquBfCagepmsNno1T++mbxr6iCvwpjtM5
        axEBs7Fj+kJaii4kX2UYOecRd5Ry8UF5LvTodbFJQzd61jeSo6LAu6vZTPe9owjthSNX1c
        CliHaKYY4X8OQ+LA1PRKWNIthVZbzBaW6DeH5Q7o0Gns1dy42WgY4NFTxRoofg==
From:   Alexander Stein <alexander.stein@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1691524098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=m4T7txvwDZo66//eyFQ595Fov1LoPrHozn9oIy+lVAo=;
        b=yowgY7lJFF6fvylwiuC06d6Y3lNGcGHa8ogingXuw0VYUT68pjHbTH9CpRFC19G0TGOe7G
        1NYj1r3i3pLQcgBIjeuou+BglETafxAjG5jxLDhxGcv84Doc1IXBxtIA9o4jDKYX90uYyH
        h2nCT9jbn/4Uej//6v2jleyY35AE361yPkmLJziao38nYaf2C1i4lDQHYg3IGRV5dCbg3/
        Dv7/IJ7KYj7XVtbhvpQjyfxqP956zJu1AlppcfGm7KWdz7CpGDVWLQLp1yu9zkfDuTb3DF
        kinFdTZaeJLOA+aSSjb6DvEM829JVdhetMyXB7h1GBmSgEav85DEWakkSa/TIA==
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     Alexander Stein <alexander.stein@mailbox.org>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to YAML format
Date:   Tue,  8 Aug 2023 21:48:10 +0200
Message-ID: <20230808194811.113087-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 53b41qmsw6boj3pa8bbjec9dhakihip8
X-MBO-RS-ID: 5b9ec271d505e8d7b17
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert Amlogic AXG Audio Clock Controller binding to yaml.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
As it is the same directory I picked the same maintainers as 
Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml.

I'm not 100% sure about the optional clocks constraints. As mentioned in
the .txt version only pclk is mandatory, others are optional.

 .../bindings/clock/amlogic,axg-audio-clkc.txt |  59 --------
 .../clock/amlogic,axg-audio-clkc.yaml         | 136 ++++++++++++++++++
 2 files changed, 136 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
deleted file mode 100644
index 3a8948c04bc9..000000000000
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-* Amlogic AXG Audio Clock Controllers
-
-The Amlogic AXG audio clock controller generates and supplies clock to the
-other elements of the audio subsystem, such as fifos, i2s, spdif and pdm
-devices.
-
-Required Properties:
-
-- compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D,
-		  "amlogic,g12a-audio-clkc" for G12A,
-		  "amlogic,sm1-audio-clkc" for S905X3.
-- reg		: physical base address of the clock controller and length of
-		  memory mapped region.
-- clocks	: a list of phandle + clock-specifier pairs for the clocks listed
-		  in clock-names.
-- clock-names	: must contain the following:
-		  * "pclk" - Main peripheral bus clock
-		  may contain the following:
-		  * "mst_in[0-7]" - 8 input plls to generate clock signals
-		  * "slv_sclk[0-9]" - 10 slave bit clocks provided by external
-				      components.
-		  * "slv_lrclk[0-9]" - 10 slave sample clocks provided by external
-				       components.
-- resets	: phandle of the internal reset line
-- #clock-cells	: should be 1.
-- #reset-cells  : should be 1 on the g12a (and following) soc family
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. All available clocks are defined as
-preprocessor macros in the dt-bindings/clock/axg-audio-clkc.h header and can be
-used in device tree sources.
-
-Example:
-
-clkc_audio: clock-controller@0 {
-	compatible = "amlogic,axg-audio-clkc";
-	reg = <0x0 0x0 0x0 0xb4>;
-	#clock-cells = <1>;
-
-	clocks = <&clkc CLKID_AUDIO>,
-		 <&clkc CLKID_MPLL0>,
-		 <&clkc CLKID_MPLL1>,
-		 <&clkc CLKID_MPLL2>,
-		 <&clkc CLKID_MPLL3>,
-		 <&clkc CLKID_HIFI_PLL>,
-		 <&clkc CLKID_FCLK_DIV3>,
-		 <&clkc CLKID_FCLK_DIV4>,
-		 <&clkc CLKID_GP0_PLL>;
-	clock-names = "pclk",
-		      "mst_in0",
-		      "mst_in1",
-		      "mst_in2",
-		      "mst_in3",
-		      "mst_in4",
-		      "mst_in5",
-		      "mst_in6",
-		      "mst_in7";
-	resets = <&reset RESET_AUDIO>;
-};
diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
new file mode 100644
index 000000000000..629fa3a81cf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic AXG Audio Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jian Hu <jian.hu@jian.hu.com>
+  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
+
+description:
+  The Amlogic AXG audio clock controller generates and supplies clock to the
+  other elements of the audio subsystem, such as fifos, i2s, spdif and pdm
+  devices.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,axg-audio-clkc
+      - amlogic,g12a-audio-clkc
+      - amlogic,sm1-audio-clkc
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 11
+
+  clock-names:
+    oneOf:
+      - const: pclk
+      - items:
+          - const: pclk
+          - const: mst_in0
+          - const: mst_in1
+          - const: mst_in2
+          - const: mst_in3
+          - const: mst_in4
+          - const: mst_in5
+          - const: mst_in6
+          - const: mst_in7
+      - items:
+          - const: pclk
+          - const: slv_sclk0
+          - const: slv_sclk1
+          - const: slv_sclk2
+          - const: slv_sclk3
+          - const: slv_sclk4
+          - const: slv_sclk5
+          - const: slv_sclk6
+          - const: slv_sclk7
+          - const: slv_sclk8
+          - const: slv_sclk9
+      - items:
+          - const: pclk
+          - const: slv_lrclk0
+          - const: slv_lrclk1
+          - const: slv_lrclk2
+          - const: slv_lrclk3
+          - const: slv_lrclk4
+          - const: slv_lrclk5
+          - const: slv_lrclk6
+          - const: slv_lrclk7
+          - const: slv_lrclk8
+          - const: slv_lrclk9
+
+  resets:
+    description: internal reset line
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-audio-clkc
+              - amlogic,sm1-audio-clkc
+    then:
+      required:
+        - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-clkc.h>
+    #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clkc_audio: clock-controller@0 {
+        compatible = "amlogic,axg-audio-clkc";
+        reg = <0x0 0x0 0x0 0xb4>;
+        #clock-cells = <1>;
+
+        clocks = <&clkc CLKID_AUDIO>,
+            <&clkc CLKID_MPLL0>,
+            <&clkc CLKID_MPLL1>,
+            <&clkc CLKID_MPLL2>,
+            <&clkc CLKID_MPLL3>,
+            <&clkc CLKID_HIFI_PLL>,
+            <&clkc CLKID_FCLK_DIV3>,
+            <&clkc CLKID_FCLK_DIV4>,
+            <&clkc CLKID_GP0_PLL>;
+        clock-names = "pclk",
+            "mst_in0",
+            "mst_in1",
+            "mst_in2",
+            "mst_in3",
+            "mst_in4",
+            "mst_in5",
+            "mst_in6",
+            "mst_in7";
+        resets = <&reset RESET_AUDIO>;
+      };
+    };
-- 
2.41.0

