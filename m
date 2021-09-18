Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BADC433F5
	for <linux-clk@archiver.kernel.org>; Sat, 18 Sep 2021 04:51:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB8F36008E
	for <linux-clk@archiver.kernel.org>; Sat, 18 Sep 2021 04:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237210AbhIRExF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Sep 2021 00:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238562AbhIRExA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Sep 2021 00:53:00 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54967C061574;
        Fri, 17 Sep 2021 21:51:37 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so11434162pjr.1;
        Fri, 17 Sep 2021 21:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dBR896KlY1z6huYxfm9iTRWxOzKzdtI8BPmSkEkZUPM=;
        b=Uq3fObXG6YJPBptVW2NAHS19Y0j6NhSnlX1RnKS54C/IO6nBI6KDUiooiwX3WPq4vE
         AisWFqOo2d7gPZmghGD2A+uhMKQXYu0nGG9FhZnJ3pUtj4LOrvM5QzOWfe26l9MrutzQ
         c+wbvR6p2S1gtlXP4mc8FQgxVYRJfk2I7sA6JdYsHNrpKPD0TYIczJPpGBi6EDbUl7tc
         /kOoJRq8Tzo9pHr1f3DubGD27glGT5d4HYnoOXa9risy92W+hjLomzZH0/V4zmikqLbh
         Knp6sLAnUOygwFK18vP5QiocF628RETwqu8eJw+es1g4NyzvLg/+sEFbM6Mtws99z6no
         3OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dBR896KlY1z6huYxfm9iTRWxOzKzdtI8BPmSkEkZUPM=;
        b=Xj8z+5k/zkArEg0T1xEYyrNCD3TTPNa5UaINpseDTdbv9jaFb4wev/C9nBd5EcZfaM
         2pOvWNLe6tTdGM6qRkf1AzS0Rn0gamfXirch+hi7EK+M5bIoFdvqv5WAAnlY543TOv73
         Q218rNIHhaM74HlTTRuVgahYxADt4vRf5LinCQlA3mJ63JFOo9Sl79VRa58erce0cARL
         CaNteM5eR7/Q2wnhOzL21rjwHmn7mFzBXQImCnZqkUz4B5zdrAWTDwZdP0shtsN3nJCk
         MT2/aVVQwxhuD6+MARD8GUavbY461KNcSBov69wlVHdbR2ZanIruoEy2EGTAyRQfaPsn
         sTJg==
X-Gm-Message-State: AOAM530wtOSywdwnXjHegkmYIo5gBepQnXkKsWiqIY17zueefmWleGSj
        KWo0MSaXuH0+yqjBH/Xlw3E=
X-Google-Smtp-Source: ABdhPJyGIaYmJhWAG+OgMtGnAmxyqY2j2rfuegU2q0NEDBRn+BRasQdHuYjEvwObaIMiSMKui/wtFg==
X-Received: by 2002:a17:903:1c9:b0:13b:f43a:41b8 with SMTP id e9-20020a17090301c900b0013bf43a41b8mr12716853plh.69.1631940696936;
        Fri, 17 Sep 2021 21:51:36 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id p5sm7663101pfp.218.2021.09.17.21.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 21:51:36 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: mfd: sprd: Add bindings for ums512 global registers
Date:   Sat, 18 Sep 2021 12:51:12 +0800
Message-Id: <20210918045114.387005-3-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918045114.387005-1-zhang.lyra@gmail.com>
References: <20210918045114.387005-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

Add bindings for Unisoc system global register which provide register map
for clocks.

Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 .../bindings/mfd/sprd,ums512-glbreg.yaml      | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.yaml

diff --git a/Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.yaml b/Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.yaml
new file mode 100644
index 000000000000..3522f3d2d8de
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/sprd,ums512-glbreg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc System Global Register Device Tree Bindings
+
+maintainers:
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+description:
+  Unisoc system global registers provide register map
+  for clocks and some multimedia modules of the SoC.
+
+properties:
+  "#address-cells": true
+  "#size-cells": true
+
+  compatible:
+    items:
+      - const: sprd,ums512-glbregs
+      - const: syscon
+      - const: simple-mfd
+
+  ranges:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    # Child node
+    type: object
+    $ref: "../clock/sprd,ums512-clk.yaml"
+    description:
+      Clock controller for the SoC clocks.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    ap_apb_regs: syscon@71000000 {
+      compatible = "sprd,ums512-glbregs", "syscon", "simple-mfd";
+      reg = <0x71000000 0x3000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0 0x71000000 0x3000>;
+
+      clock-controller@0 {
+        compatible = "sprd,ums512-apahb-gate";
+        reg = <0x0 0x2000>;
+        #clock-cells = <1>;
+      };
+    };
+
+  - |
+    ap_intc5_regs: syscon@32360000 {
+      compatible = "sprd,ums512-glbregs", "syscon", "simple-mfd";
+      reg = <0x32360000 0x1000>;
+    };
-- 
2.25.1

