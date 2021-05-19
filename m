Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCD0C43617
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 14:38:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 079C46124C
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 14:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354445AbhESOjc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 May 2021 10:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348199AbhESOj0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 May 2021 10:39:26 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652C9C061761
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 07:38:05 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id v12so7133163plo.10
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R9Krb+n145fDfyPy6Q+6FikWTCuZ2x/Un3CW1NBeexc=;
        b=ZHUwdEfGjfzjF+1Xzy03WJG6lceLujT8ZApwtXutEA+cikysCCmrDPAXbDR6owzLvB
         TprktMT8fF7xDML9mbIYolmJBoiyzxgnLBWkDLzQk99IxBeCFBzw4mGdQ3dkdhdZ7dIc
         dnAfaukxJ+hZW0/F1m1rYrqI0ITrWXWcaaqAywwmok80BF4KYIBJ0d74MrVHdeNm6oY5
         eEh1x5KH/MuRK8MBEBbXHeX7h8Sm0cW2mJgV77v12S9lFs6bHNP7dEEBEoz9cPFY7DUb
         a7DmY1jaFJKTTpLy4543cdiDupl5HZ9XMYMf2Ukn5g0cAwVXlVHDS76sAdhcv2AMPhMa
         yzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R9Krb+n145fDfyPy6Q+6FikWTCuZ2x/Un3CW1NBeexc=;
        b=mwPJ9iAFeWY4r8IXotrmj5j/+aY7/75yf0U+rdilgY2qPTEszIfa4Ej3tSlR36nUut
         JwHJef94nPWMornDritB1yoZCIXQGk9/hda2hfzyeus8aBSz+pTED+YoyBbO5KNKrHzB
         9p+fkrtvwaR1sswVKm8H3IyPFiM5RYr0zPmGgzOYUOzjMXgvyaFuiCNJBLhqNpwWRGA4
         Scm9qk1nGX0zSTsZAid5Vwtag2HW9EHVHOGRuada9HugIUf4gcIyPHSBNfdytvbBZC8A
         cavMP+DBTOS4v0tqnD6EqDWEsMbeabYnSkMhY9jf4oPw27JUGyOHHAcs7V826wX5gns+
         LMVw==
X-Gm-Message-State: AOAM532a786ixDQpIAV2TQ93bZfbkWwIKk/pigLKJ3ex90bpQzLhzA9Y
        l7UoparxPK1vKj4E7u3nGAsAHA==
X-Google-Smtp-Source: ABdhPJzGm8igSQWVOQrpGm9zPwCp15NHaHODb+6kVtJ5RUfeDsQhZhOjJ/ZgJ0Bs/skxeb9IUjgK2A==
X-Received: by 2002:a17:90a:a087:: with SMTP id r7mr11679403pjp.84.1621435084870;
        Wed, 19 May 2021 07:38:04 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:38:04 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH v3 06/17] dt-bindings: qcom-qce: Add 'iommus' to required properties
Date:   Wed, 19 May 2021 20:06:49 +0530
Message-Id: <20210519143700.27392-7-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the missing required property - 'iommus' to the
device-tree binding documentation for qcom-qce crypto IP.

This property describes the phandle(s) to apps_smmu node with sid mask.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/crypto/qcom-qce.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index f8d3ea8b0d08..4be9ce697123 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -34,6 +34,12 @@ properties:
       - const: bus
       - const: core
 
+  iommus:
+    minItems: 1
+    maxItems: 8
+    description: |
+      phandle to apps_smmu node with sid mask.
+
   interconnects:
     maxItems: 1
     description: |
@@ -57,6 +63,7 @@ required:
   - reg
   - dmas
   - dma-names
+  - iommus
 
 additionalProperties: false
 
@@ -72,4 +79,9 @@ examples:
         clock-names = "iface", "bus", "core";
         dmas = <&cryptobam 2>, <&cryptobam 3>;
         dma-names = "rx", "tx";
+        iommus = <&apps_smmu 0x584 0x0011>,
+                 <&apps_smmu 0x586 0x0011>,
+                 <&apps_smmu 0x594 0x0011>,
+                 <&apps_smmu 0x596 0x0011>;
+
     };
-- 
2.31.1

