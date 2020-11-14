Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D7FC6369E
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 13:52:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC3F622252
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 13:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Uu7hY/Wd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgKNNw0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Nov 2020 08:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgKNNwZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Nov 2020 08:52:25 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44739C0617A6
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2020 05:52:24 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id j19so2362775pgg.5
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2020 05:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pQB8wgB7xeIzH4jYM33Ni/91/CZjY/s5lPEIdcq3mCs=;
        b=Uu7hY/WdqQASdhCOaP1aQEOiIjN5oC5jyTXW4bN0uyIfzp/ctO8WPQlZ/O0BY7gkKQ
         PVQRjcB2ShZ50gUFqHusQ8U4utYtgZr9ijG9dp54JAlRHUaDUw2gY1bwmmSMgaUjky3a
         XDUusT4Y9e9PJtJYcXwkuvvhDOny98vTjOUBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQB8wgB7xeIzH4jYM33Ni/91/CZjY/s5lPEIdcq3mCs=;
        b=Yr1ZeiDcq+YW/Wvrfkcqvh0FI7POVlBtwBG1p5qdVS4tNqqLcF9LQdRO7pAsvey+7s
         RzxplLCTjbpYx4tdEumHlAcC8C5WlQFgJgbVpKewEq2Y0CMQaqHGtCUwTmyqYvbJ9XnK
         gH8DLOWrjfTS7D3vb9clsYsM21TuYCZJdG8Xvrac9moETuW/8FTkm0tHlz/Mbl5+U8Yv
         T3Bjc0+HoF9ACcWUuXeaXhb/2ZFX7mc1H3JWGyvBldDBS1eHGYS/3zjXPvM7/oMECJ+x
         JcWE6ZbpIPVbuLvMUn0i9+n6QajCGQW7Wi9CkRyv2FYBSn5BVhm+ys65MksEMsANhGGc
         tXAg==
X-Gm-Message-State: AOAM533jRxj3A8WvAskFVVWfxOPCwkmEYE4WlCdr/bH8OJWjjKVZApJM
        3dl81PwA3KeZmikSQje+IuojCb8M+3H0ug==
X-Google-Smtp-Source: ABdhPJybgsuJ2MR9afC4TvV1wuAq0kjAHSEVh7bgfL3c5ZOBk5Ui3Qqzj6j2VtFir9Yr6HaMI/hg/w==
X-Received: by 2002:aa7:9414:0:b029:18c:23f6:bc6d with SMTP id x20-20020aa794140000b029018c23f6bc6dmr6451830pfo.21.1605361943642;
        Sat, 14 Nov 2020 05:52:23 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id r205sm13008023pfr.25.2020.11.14.05.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 05:52:23 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/6] dt-bindings: clk: mstar msc313 mpll binding description
Date:   Sat, 14 Nov 2020 22:50:40 +0900
Message-Id: <20201114135044.724385-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114135044.724385-1-daniel@0x0f.com>
References: <20201114135044.724385-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a binding description for the MStar/SigmaStar MPLL clock block.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../bindings/clock/mstar,msc313-mpll.yaml     | 58 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml

diff --git a/Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml b/Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml
new file mode 100644
index 000000000000..9ddc1163b31b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mstar,msc313-mpll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar/Sigmastar MSC313 MPLL
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+description: |
+  The MStar/SigmaStar MSC313 and later ARMv7 chips have an MPLL block that
+  takes the external xtal input and multiplies it to create a high
+  frequency clock and divides that down into a number of clocks that
+  peripherals use.
+
+properties:
+  compatible:
+    const: mstar,msc313-mpll
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names:
+    minItems: 8
+    maxItems: 8
+    description: |
+      This should provide a name for the internal PLL clock and then
+      a name for each of the divided outputs.
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-output-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    mpll@206000 {
+        compatible = "mstar,msc313-mpll";
+        reg = <0x206000 0x200>;
+        #clock-cells = <1>;
+        clocks = <&xtal>;
+        clock-output-names = "mpll", "mpll_div_2",
+                             "mpll_div_3", "mpll_div_4",
+                             "mpll_div_5", "mpll_div_6",
+                             "mpll_div_7", "mpll_div_10";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e874fda810e..d1c98a6f9f24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2131,6 +2131,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar/*
+F:	Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml
 F:	Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
-- 
2.29.2

