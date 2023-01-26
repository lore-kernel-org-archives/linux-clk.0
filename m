Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EE7C54EAA
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 23:03:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbjAZXDo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 18:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbjAZXDm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 18:03:42 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03BBD5A373
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 15:03:38 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id j1so1197213iob.6
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 15:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFnQgKzi9ppV9VJGiOBnjcyAOZNDcLdMdaXWIYNXwKk=;
        b=qP3mU1xo+I9XVJ0stpRWLHeDB2WmZpVioBz59JrMezSkVQtQvFmt8iFGczec50RPpU
         sOkNcZBmrJTe/57CDT1J3YsJ3FwzeuxM0bOMikRL/s2aXLQBYF/3sG9qN2TSu8zYjBkU
         ZI394Ghw7zhV8brdQqTpJfCawXIdZ9yk3qJqRFuF85ic04O/0oLl3JNEZhkxJe6OZdFT
         whuvxyQtsczusxbxXRXxl0KlAaWugV6rJMHxC4LJBfGHpTedbNCn5iH8Bb39+qeDVV3U
         G9agmnEdmWbWc/1xoeGC54DuCuR0Hw7Lqa9hbL4tm/ck7D6hiYTpfu46A2Z326wYsVBC
         /cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFnQgKzi9ppV9VJGiOBnjcyAOZNDcLdMdaXWIYNXwKk=;
        b=R6AO8AZAEejy54wqzm61caiuuk9GcYPqw585DL+V5RzXyPoAAly5+gvNB2y3QP1Hht
         2JW4MT6vfQeygp3Drlv3KFUT6JtnW786Gh/WC3u/beEDKTkqycb4c+SDGsXY4jR7SLsV
         g+jOX+4jpaD3GjdHTcpHdAcDbIktld2Tohv9yD8G4knUfg+JR57Cg00PpSWlZDvUk0np
         VWsNOj97qaia7A20YN/7MN9gFlVaUz5HXnJCn9sgCJyEOXkvaEGUBfV29eblzuTHjDLn
         Yfv0jUCoXS/tq1B/jh+btmTQ5obVFCIcoNWhSGJkcHtNfgdB5hs14fWG2QeosXSmEwjN
         EOiQ==
X-Gm-Message-State: AFqh2kpFRa8hpgHlFQn/FGS8G6QgQeannn20tfLmPptMsndEZJTH45m0
        2sn+hLLhalLRzDCVhkrsX71d2g==
X-Google-Smtp-Source: AMrXdXuldKyzHGiATIRaGkEyt82ilHxZbn9uVkWvXwoP6vEP97st0wkVuQbXmP2WBKd+5U1bZ1klGA==
X-Received: by 2002:a5d:8190:0:b0:707:6e91:e866 with SMTP id u16-20020a5d8190000000b007076e91e866mr20134681ion.15.1674774217714;
        Thu, 26 Jan 2023 15:03:37 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id l4-20020a6bd104000000b006f8b7d869a0sm670924iob.1.2023.01.26.15.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 15:03:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/7] dt-bindings: mailbox: qcom: correct the list of platforms using clocks
Date:   Fri, 27 Jan 2023 01:03:15 +0200
Message-Id: <20230126230319.3977109-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
References: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The schema incorrectly lists some of the platforms in the statement
requiring clocks/clock-names. Correct this by moving platforms not
requiring additional clocks to the separate clause.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 26 +++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index ecc286ab49ef..5f7770036fed 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -72,15 +72,7 @@ allOf:
         compatible:
           enum:
             - qcom,msm8916-apcs-kpss-global
-            - qcom,msm8994-apcs-kpss-global
-            - qcom,msm8996-apcs-hmss-global
-            - qcom,msm8998-apcs-hmss-global
             - qcom,qcs404-apcs-apps-global
-            - qcom,sc7180-apss-shared
-            - qcom,sdm660-apcs-hmss-global
-            - qcom,sdm845-apss-shared
-            - qcom,sm6125-apcs-hmss-global
-            - qcom,sm8150-apss-shared
     then:
       properties:
         clocks:
@@ -124,6 +116,24 @@ allOf:
           items:
             - const: pll
             - const: xo
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,msm8994-apcs-kpss-global
+            - qcom,msm8996-apcs-hmss-global
+            - qcom,msm8998-apcs-hmss-global
+            - qcom,sc7180-apss-shared
+            - qcom,sdm660-apcs-hmss-global
+            - qcom,sdm845-apss-shared
+            - qcom,sm6125-apcs-hmss-global
+            - qcom,sm8150-apss-shared
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
   - if:
       properties:
         compatible:
-- 
2.39.0

