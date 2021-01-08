Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215DEC43381
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jan 2021 11:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE9D2239FC
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jan 2021 11:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbhAHLeM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Jan 2021 06:34:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbhAHLeK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Jan 2021 06:34:10 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC45C061290
        for <linux-clk@vger.kernel.org>; Fri,  8 Jan 2021 03:32:59 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 15so7496054pgx.7
        for <linux-clk@vger.kernel.org>; Fri, 08 Jan 2021 03:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SajeAnD/bM3T+Qtfi1lyQyoeSgIHCjSTfGa4G04tdEU=;
        b=fJy7+QGBqAxxSegOAf62IGmG6rSwcILXGWqlg3Xvw5g+u56K0xj8AiR+FERB5y8EZg
         XwEI3JPeS19Um/yvQZPCDUXuQVYSOSqLRpOmLsBLWxMlNFu1PP6OU8pa6C3I8j16ghzu
         qVR5es2wVQDm/y1cVJo2kvler0i4tbLGrKkk60ZvkSI0GO2o3gFK04rT13OY8hR66V8N
         tbeW8tN2JzmM5QIngmQFn4o85XlQSryucmI7XWswoHJ1iz7C0kK1kvv0td1hIiuwCfxQ
         g2J8WksgoGlV04L61JOgjSYLmd4PntXgD7FYgTjmDheRF9Exj/plgGTeHC7cYm7Mp15l
         KKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SajeAnD/bM3T+Qtfi1lyQyoeSgIHCjSTfGa4G04tdEU=;
        b=jDF0L+XQ5KnOaq5WvmHwHX70M0IlES9+JaujoHH8PWvXXWWjJ8DnS2s1AQ+zcXHhGW
         TtU7I7UsU99rRtYfsFFrKq2RZSGY69jVVAL9NZUjUWknnseidEJIyo3BVguUj/QaqL4+
         a2DdK8SLJEdYlHUl1Ur3FugiB4jKBNEYbTsrWIHQCOBQhYf2W8X9BXF1XrD8in35gh/m
         YM5bnmLSlKmmhUQoa5hqNt7n4x0qUyFQbkZVrcxWfy2mxEAMlLSb9n2BSoNzq5T31wcE
         ZPgKQrXImUggV/CMg4dNx2BKnwdL7zFbHqws6BKLsIBFEOgx17bvyePWEOQNG0gp0lIE
         rVIQ==
X-Gm-Message-State: AOAM53204+YzPPqKLZPeC6QcuvLm+yzB3qwRkLtlszRQlOVG2NcbUwsd
        WCXpbFGQct4ElbVx4t6KQn8B
X-Google-Smtp-Source: ABdhPJwWOldoMw4h2aza5aaKvwjvJUmGJC7vRbeUobUvqk2/cnv1Fsioy0ztzWfw8kH9BRR4k0YOLg==
X-Received: by 2002:a63:101d:: with SMTP id f29mr6576907pgl.165.1610105579458;
        Fri, 08 Jan 2021 03:32:59 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.188])
        by smtp.gmail.com with ESMTPSA id i25sm9261573pgb.33.2021.01.08.03.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 03:32:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/5] dt-bindings: clock: Add Qualcomm A7 PLL binding
Date:   Fri,  8 Jan 2021 17:02:31 +0530
Message-Id: <20210108113233.75418-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
References: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devicetree YAML binding for Cortex A7 PLL clock in Qualcomm
platforms like SDX55.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/clock/qcom,a7pll.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a7pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
new file mode 100644
index 000000000000..8666e995725f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,a7pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm A7 PLL Binding
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  The A7 PLL on the Qualcomm platforms like SDX55 is used to provide high
+  frequency clock to the CPU.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdx55-a7pll
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  clocks:
+    items:
+      - description: board XO clock
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    a7pll: clock@17808000 {
+        compatible = "qcom,sdx55-a7pll";
+        reg = <0x17808000 0x1000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "bi_tcxo";
+        #clock-cells = <0>;
+    };
-- 
2.25.1

