Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D223C43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jan 2021 04:13:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D9B1223E4
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jan 2021 04:13:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732088AbhARENl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Jan 2021 23:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732090AbhARENk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 17 Jan 2021 23:13:40 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B21C0613ED
        for <linux-clk@vger.kernel.org>; Sun, 17 Jan 2021 20:12:24 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id j12so1060pjy.5
        for <linux-clk@vger.kernel.org>; Sun, 17 Jan 2021 20:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JA2bOmH7zXucsB0pL10PBkPjMC5JaJqOe1c7ajz47T4=;
        b=TlUnawC9tBIYQZlOxs++2xywj/BJI3N7LTSFv1Y0PWumDX2Gs6Tp+GyafoWhXdnmPf
         lReyfV+Ya9L6dL2P3thkKkipztY1N0sdNKGB72igmNb+8bISneowTE/KD/3w/6qF7Jd6
         ycGFoTEMSBSAVn+7HMzBbPTwdKTQFAh1yVYv/i5A7n1aZNkzSqEL9I+MC1FNiGOt8HLu
         PHc7BJ7jJ6RmEWmNv3VH99kcjkG34JezH6b/rOR7ilXLunOAGs+eRr/c/3QBy4PjjakS
         b0MPV2DXAuZfIoqmTZDfw1X27LpfG/dgzPuf2D59giD9Lm94H4ZSllR0ekbQ63i1f1ia
         gn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JA2bOmH7zXucsB0pL10PBkPjMC5JaJqOe1c7ajz47T4=;
        b=f1W59Z8pzhg+bo5PA8VTL1DabjkpUITktFFjOCqLanP3D/SqUut9Atqs6Zzc7sTrpP
         wvu8IKvtjfbexGrbsFPr26eTvegfPii5SP/zg6zfhIZGBhWz1uq0WXBFlrhfhZG9nqU6
         T7eQL29OKG+rZgqpavLePH6GtaBLwvLLtONGRbsgjk+HjvAqj0hHEgBoJyKkJZCFfA1b
         6TmySa4K0c2AyhPSSEgJIk8izvnRD5uoaY/Qht/enWhSIpw2HVttSfCoW2If+hrWzZWf
         jwjroR4Oclwz0vru0Iy+IDIk7eh6iNQxfiTLnATM42/0XGKPAZhv0dqI9totBn/OEjXT
         D+7Q==
X-Gm-Message-State: AOAM5335OvXXjhToEJqzDZH0T+wgdTKObLQ7P5aMA7Idcd+SZoPO5PXk
        SR1Dj1Dykt+ouJoyS28bj+KF
X-Google-Smtp-Source: ABdhPJx5eT0mGnQxBoihp84O2W77mHeFvDWkxNpF7I7Caofs/5tx5QE2CNYF1b+B9k12/LpLSisLVQ==
X-Received: by 2002:a17:90a:4cc5:: with SMTP id k63mr23944580pjh.202.1610943144354;
        Sun, 17 Jan 2021 20:12:24 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id h15sm6727319pja.4.2021.01.17.20.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 20:12:23 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: mailbox: Add binding for SDX55 APCS
Date:   Mon, 18 Jan 2021 09:41:52 +0530
Message-Id: <20210118041156.50016-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
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
 .../mailbox/qcom,apcs-kpss-global.yaml        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index ffd09b664ff5..144350f72f6a 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -33,9 +33,11 @@ properties:
 
   clocks:
     description: phandles to the parent clocks of the clock driver
+    minItems: 2
     items:
       - description: primary pll parent of the clock driver
       - description: auxiliary parent
+      - description: reference clock
 
   '#mbox-cells':
     const: 1
@@ -44,9 +46,11 @@ properties:
     const: 0
 
   clock-names:
+    minItems: 2
     items:
       - const: pll
       - const: aux
+      - const: ref
 
 required:
   - compatible
@@ -55,6 +59,35 @@ required:
 
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
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sdx55-apcs-gcc
+    then:
+      properties:
+        clocks:
+          maxItems: 3
 examples:
 
   # Example apcs with msm8996
-- 
2.25.1

