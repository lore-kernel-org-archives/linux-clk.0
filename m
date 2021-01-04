Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4B7C433DB
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 08:13:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56F5820798
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 08:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbhADINB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jan 2021 03:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbhADINA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jan 2021 03:13:00 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B396C06179A
        for <linux-clk@vger.kernel.org>; Mon,  4 Jan 2021 00:11:42 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id m6so16017989pfm.6
        for <linux-clk@vger.kernel.org>; Mon, 04 Jan 2021 00:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CxihuApHeST5FtR1ic0MIOxlrYHGlIn3irwCDLvd5sM=;
        b=BpAHH4z7dBz+9MtlkHURf9h9Jom69vFHB+b4oROjoPES4tpnQZcIHzUGTYA6HA4we2
         NvQH40Hhy/8qTIFq89IboeKBQoo3kWTl4AZUy9cvRjjYzoTeCwqKGc+PTZELhs9DkJv4
         wSy6pyD6zbAg7cY5t/xJ769muFVFQUzII4m+WmHUdeGllqDotmtOr9Z3n7KrNC45FfPg
         tCLg8zSz56Pqqohri8sSaSxwdmTpb41Z8HozHaDHKwZ+pDfMv6GjBOLl+DvDWXmqdzk0
         PT4EEXLVxdhzMpeffC66L4pOMl/dbaMlcJbxT2UmoO+TEoR5og1/zpw8xVNpjJGwOMvR
         vGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CxihuApHeST5FtR1ic0MIOxlrYHGlIn3irwCDLvd5sM=;
        b=K1UkQFal0P0cSd4fs0PUzzLfzWBCTSI0VAf4ZHUXl//5whTaWjQO4thV6Z92ATahbV
         4Vj543upyG4eJu+GfGdkoRzkvxWfhBaOmcN7/aIJrTtNq1IRofRJgfxg/mpR+Jqi8Tyg
         K58Y9UouF5IXae2zA3nEgvoePXR3fLP2z+uduxu4IVxbuc+246LznvSB3RxTqF/ws8Wv
         Jq2tmezVSfrP+uopzC8MAVtZ7n+CX11LpCCFLZGiPyKqN0yFc4pTj9/FZspOluK+WpeW
         dVVDPKTLqDdIng7fh1V47CyaUeuCJ5gtE0rO4ax7pLWwfnu2Fd9c3JLiyzPnhD4UtbOa
         kGJQ==
X-Gm-Message-State: AOAM531ctpUOTuiw0+lRi6+YpZPA6GpF20eQ44xrMhRvC7vdxmhj+wNU
        7u7j7/WhpTq5yPDD0N0Xp9K4
X-Google-Smtp-Source: ABdhPJzsUzP25IuIbNHbmlezqcHXoggp/NpOFZ6YItSIZh0LEJkTFEBCupvJVazPbqroM29RL8ffzg==
X-Received: by 2002:a65:458e:: with SMTP id o14mr64244220pgq.444.1609747902114;
        Mon, 04 Jan 2021 00:11:42 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id n7sm55051339pfn.141.2021.01.04.00.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 00:11:41 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/5] dt-bindings: mailbox: Add binding for SDX55 APCS
Date:   Mon,  4 Jan 2021 13:41:21 +0530
Message-Id: <20210104081125.147300-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
References: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devicetree YAML binding for SDX55 APCS GCC block. The APCS block
acts as the mailbox controller and also provides a clock output and
takes 3 clock sources (pll, aux, ref) as input.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 59 ++++++++++++++++---
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index ffd09b664ff5..3c75ea0b6040 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -27,26 +27,24 @@ properties:
       - qcom,sdm660-apcs-hmss-global
       - qcom,sdm845-apss-shared
       - qcom,sm8150-apss-shared
+      - qcom,sdx55-apcs-gcc
 
   reg:
     maxItems: 1
 
-  clocks:
-    description: phandles to the parent clocks of the clock driver
-    items:
-      - description: primary pll parent of the clock driver
-      - description: auxiliary parent
-
   '#mbox-cells':
     const: 1
 
   '#clock-cells':
     const: 0
 
+  clocks:
+    minItems: 2
+    maxItems: 3
+
   clock-names:
-    items:
-      - const: pll
-      - const: aux
+    minItems: 2
+    maxItems: 3
 
 required:
   - compatible
@@ -55,6 +53,49 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,ipq6018-apcs-apps-global
+            - qcom,ipq8074-apcs-apps-global
+            - qcom,msm8916-apcs-kpss-global
+            - qcom,msm8994-apcs-kpss-global
+            - qcom,msm8996-apcs-hmss-global
+            - qcom,msm8998-apcs-hmss-global
+            - qcom,qcs404-apcs-apps-global
+            - qcom,sc7180-apss-shared
+            - qcom,sdm660-apcs-hmss-global
+            - qcom,sdm845-apss-shared
+            - qcom,sm8150-apss-shared
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Primary PLL parent of the clock driver
+            - description: Auxiliary parent
+        clock-names:
+          items:
+            - const: pll
+            - const: aux
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sdx55-apcs-gcc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Primary PLL parent of the clock driver
+            - description: Auxiliary parent
+            - description: Reference clock
+        clock-names:
+          items:
+            - const: pll
+            - const: aux
+            - const: ref
 examples:
 
   # Example apcs with msm8996
-- 
2.25.1

