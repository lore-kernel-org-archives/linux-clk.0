Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C83C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:20:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5663361606
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:20:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhBWGUA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Feb 2021 01:20:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhBWGT4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Feb 2021 01:19:56 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382EDC06178B
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:16 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id kr16so1132351pjb.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OhVat5LrE1fhESIUjnpbwIUbs1+uHdZHHpdx8ggYgCw=;
        b=jjuchHLCWGF1ErNoEErzLFpwqBimzUP/Th11yILb0nPHSuvnP8OMSacbRaJ7LcuyMd
         uRdAZQZT4Sa2ZlaMZCbiyXINMezClHcLza61IqCWH0t6QXJ+rxQc5rvgjfEp9blQrG6Q
         PPq5+dXItdUiZKqUniyqJABdhNqTf6cAr/Oc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OhVat5LrE1fhESIUjnpbwIUbs1+uHdZHHpdx8ggYgCw=;
        b=MwMQm4kB07LtFGna/bFn0mfqaFaWPPlPJ0wFEdLCw7OgQqyCPB+An/kMPtNorwc9o5
         vn1ZjZQ+rC/BujpoKoZkYAPiMs7bMiP8XNfLSyJPab2CvMH29Yf+PDJvKjoYUf+35tJe
         us4gND/SXrQ3SFnCIkqizFPxLMIheg+6Jpq93iQKJskMYSjEVHSmwyPjShwIaAA+5fxe
         RAfraaykJ5X3k2HRWT8nOYiNhCGqyy1ZyOLJD9oDAOjZQxbGDJVI7eU3XXHGkkLiMzBf
         5ZfpAmtyx8jSV2GHXEQEZb9+l6B2jh3WqQOuiiq/kr8fC81T3PvkNmf6HB+Akd8R1sPE
         Q4fA==
X-Gm-Message-State: AOAM533Vfh0oisuK7OKtvw32syrzkrZg9s4jw/RygMbtIC7wmo/qtASi
        f2GC3B42CaVI5CUKBKQ+ODmx6Q==
X-Google-Smtp-Source: ABdhPJyXXR+t7UNc7M5JbvOoe9YC9FsdP2ZLpFwkfCS9cnni/x9cZLknpqKBKyk/9ba9udsHt8d96g==
X-Received: by 2002:a17:90a:ca11:: with SMTP id x17mr26126122pjt.201.1614061155775;
        Mon, 22 Feb 2021 22:19:15 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:15 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        soc@kernel.org, sboyd@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding description
Date:   Tue, 23 Feb 2021 15:18:23 +0900
Message-Id: <20210223061830.1913700-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a binding description for the MStar/SigmaStar CPU PLL block.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../bindings/clock/mstar,msc313-cpupll.yaml   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml

diff --git a/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml b/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
new file mode 100644
index 000000000000..a9ad7ab5230c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mstar,msc313-cpupll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar/Sigmastar MSC313 CPU PLL
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+description: |
+  The MStar/SigmaStar MSC313 and later ARMv7 chips have a scalable
+  PLL that can be used as the clock source for the CPU(s).
+
+properties:
+  compatible:
+    const: mstar,msc313-cpupll
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mstar-msc313-mpll.h>
+    cpupll: cpupll@206400 {
+        compatible = "mstar,msc313-cpupll";
+        reg = <0x206400 0x200>;
+        #clock-cells = <1>;
+        clocks = <&mpll MSTAR_MSC313_MPLL_DIV2>;
+    };
-- 
2.30.0.rc2

