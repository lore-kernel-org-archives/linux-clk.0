Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E466C433E6
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 11:18:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 456B264E74
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 11:18:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhBLLR5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Feb 2021 06:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhBLLRy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Feb 2021 06:17:54 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA24C0613D6
        for <linux-clk@vger.kernel.org>; Fri, 12 Feb 2021 03:17:13 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id s15so4912094plr.9
        for <linux-clk@vger.kernel.org>; Fri, 12 Feb 2021 03:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w3eAc6FaBMb02UjLTylLBFxDGw5JxOTFicXpZo/jAB4=;
        b=jOv/7auoPeV648ioJTxzIIypvnEbLcmB7jg/WO0+Rzozd3LRYQWS8xIeVO+AA7wpj7
         59KRdSLqOZxS56/3R/kta2JjpZd1+pnmGYVs7aEcEzoqfGM9bfTbXumEO/lV5aWYS3xL
         vtCkdBHmCtYmNu6Lx/DLCsAVEJvJYvj6Cpjvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w3eAc6FaBMb02UjLTylLBFxDGw5JxOTFicXpZo/jAB4=;
        b=MXQNX7aRu3UR53rtuz9pS2JTXt9/O1e9J8Xe+yi9AslMJN2gTjCPgT1bScvwJ4I4NR
         ag4mGbVj201cIjEXH1LOpu9CZVtS2mjhGZ5MolIo2yekMViA231Z0lFjEe6OU2kh1MWr
         XhDJQOEZWC/3TsRGG6Hr711XWG9dE7ibCNpjKvm8sr+Y9J6TAioxteSpvtxI7Cig1lGc
         tM8so6IzQrYTHsimZ0Jwf4XT5bQl9GvgEEGN+knn+alaQL4Dyaa2xBvPza+5sepQkT4K
         kXMJI8Q/nSKtdNCX8Brr7LJ0IGtPzBauFbqrds6UM/OfCFHj8etoOM7aO9ZBmZ3KN/ZY
         Jyyw==
X-Gm-Message-State: AOAM533zsEGu9FqFUQxANUomKQt0d88m0/NbfdRKoX+NOQXd/SHRYY0H
        goVqrnVBh+BQA5bW6gdPxUS83A==
X-Google-Smtp-Source: ABdhPJyr3YyowB8Gvq2NvbGkjisZEoQ56XU0gS6QsNrt6V6ukhBJzJf9SVgcnf7U8FRfBHXit92S2g==
X-Received: by 2002:a17:902:b410:b029:e3:284e:4e0b with SMTP id x16-20020a170902b410b02900e3284e4e0bmr708773plr.33.1613128633438;
        Fri, 12 Feb 2021 03:17:13 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id h20sm5752662pfv.164.2021.02.12.03.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 03:17:13 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 1/1] dt-bindings: clk: Mstar msc313 clkgen mux
Date:   Fri, 12 Feb 2021 20:16:49 +0900
Message-Id: <20210212111649.3251306-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210212111649.3251306-1-daniel@0x0f.com>
References: <20210212111649.3251306-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a devicetree binding yaml for the clkgen muxes used
in various places in MStar/SigmaStar SoCs.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../clock/mstar,msc313-clkgen-mux.yaml        | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-clkgen-mux.yaml

diff --git a/Documentation/devicetree/bindings/clock/mstar,msc313-clkgen-mux.yaml b/Documentation/devicetree/bindings/clock/mstar,msc313-clkgen-mux.yaml
new file mode 100644
index 000000000000..7f2ff72a601f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mstar,msc313-clkgen-mux.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mstar,msc313-clkgen-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar/Sigmastar MSC313 CLKGEN mux
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+description: |
+  The MStar/SigmaStar MSC313 and later ARMv7 chips has a number of
+  "CLKGEN"s. Some in the pm area, some in the standard peripheral area
+  and some in the "scaler" area. Inside of these CLKGENs there are
+  muxes that either connect the output to an always on clock
+  (deglitch) or one of a number of clocks that are selectable via
+  a mux. Each of these muxes also includes a gate for the output.
+  Most of these are in a nice block with multiple muxes in a single
+  register. Some of them are embedded within blocks of unrelated
+  registers like in the pm area. Some seem to be embedded in registers
+  with unrelated bits. For this reason a syscon is used to access the
+  registers.
+
+properties:
+  compatible:
+    const: mstar,msc313-clkgen-mux
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    description: |
+      List of clock sources for this mux. If the mux has a deglitch
+      bit the last entry should be the source of the deglitch clock.
+
+  offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Offset in the register map for the mux register (in bytes).
+
+  regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the register map node.
+
+  mstar,gate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Bit position for the gate bit.
+
+  mstar,deglitch:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Bit position of the deglitch bit for muxes that have one.
+
+  mstar,mux-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Left shift value for the mux bits.
+
+  mstar,mux-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The width of the mux bits.
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - offset
+  - regmap
+  - mstar,gate
+  - mstar,mux-shift
+  - mstar,mux-width
+
+additionalProperties: false
+
+examples:
+  - |
+    clkgen_mux_mspi0: clkgen_mux_mspi0 {
+      compatible = "mstar,msc313-clkgen-mux";
+      regmap = <&clkgen>;
+      offset = <0xcc>;
+      #clock-cells = <1>;
+      mstar,gate = <0>;
+      mstar,mux-shift = <2>;
+      mstar,mux-width = <2>;
+      clocks = <&clk_mpll_div2_div2>,
+               <&clk_mpll_div2_div4>,
+               <&xtal12>;
+    };
-- 
2.30.0.rc2

