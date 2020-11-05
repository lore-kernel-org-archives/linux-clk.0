Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2AFC4741F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 10:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1DE020A8B
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 10:48:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MEfDeOCf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgKEKsw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 05:48:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbgKEKsn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 05:48:43 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5C1C0613CF
        for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2020 02:48:41 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id e7so1163423pfn.12
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2020 02:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qDk/WLdPfqfnVhfBhaQ9EDmCSmTng2GQJJLJH9JNtu4=;
        b=MEfDeOCfActV1/s6XUhH7BWGz8UGY3f8v9vADXaSpUvQpebf/cEUmHQ00WkArwIMt8
         XSXO0/1ftU/OYwVI4IG+ARtrR9XOnGwxBYdAZH+jQj4yepbKAqExqOoGEzJwkUUBtirJ
         Ddv/ktPu6dID6hyPKNhp4StHLwNi3ynvgxOaSIiEH5H0v1OTcPgsuojy1fJDCg6edOWe
         jVj2K32+KNzEDQbV2hFKTyxhmxliwf4k5YEuqwB6r1Zy92TCNryJp7RlPqxRm5mwwupq
         MKv8+WrQGjxuotQlRcIiyYfBGza9sNbgOa/9Rtn/hzR7TjgcfYjKeTQysANpwn8m2Mz1
         hVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qDk/WLdPfqfnVhfBhaQ9EDmCSmTng2GQJJLJH9JNtu4=;
        b=EG297RUqxD0LsdpFRjQ5nFc9IDX5tFQ8mSpqxoiX2u8QseeL+L10i/ZX/J7XYf7quB
         8zcJszxLmGAHVH2Z82wt7I8jvDKe/xlhu4eI44C7u9mNT/lsy62jGXHNcHxGdGHn2vg+
         Wz1WvnUdp6+DcBA7RRj5k66peMa9jfs7m0jn0WVWjQBe3fGq2J7ziQgbJuJcq1NOFwd1
         QhocSwZ5d4fGqd/+G4eL7rR/33Ljz8QGiGgHUZcNkNec9mqHeBIyQd42rC7eFFqT1z/H
         NdVI+Xyy7BA+NS0FykRYLVs3nuCpt7/8I+A2PUpXy/pxwHmR0hsvd3x7BNq3JGBfEOid
         FfGg==
X-Gm-Message-State: AOAM5312CVoXp/UKbFrs18gJuYwwhhZvagsf7bnrEYBCa6H41c6pKyoN
        ELKqtvSPfzCNcwH5soIi2q4M
X-Google-Smtp-Source: ABdhPJy/HechZX5iFlKIjv90tNKWNE+UEGwgYegiNm9++/Q1+euGEuzre5ZQkIiA4GFZyCij1sDFZg==
X-Received: by 2002:aa7:8548:0:b029:164:769a:353 with SMTP id y8-20020aa785480000b0290164769a0353mr2032591pfn.45.1604573321280;
        Thu, 05 Nov 2020 02:48:41 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id a84sm2131234pfa.53.2020.11.05.02.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 02:48:40 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/4] dt-bindings: clock: Introduce RPMHCC bindings for SDX55
Date:   Thu,  5 Nov 2020 16:18:16 +0530
Message-Id: <20201105104817.15715-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Add compatible for SDX55 RPMHCC and DT include.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a46a3a799a70..a54930f111ba 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,sc7180-rpmh-clk
       - qcom,sdm845-rpmh-clk
+      - qcom,sdx55-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
 
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 2e6c54e65455..cd806eccb7dd 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -21,5 +21,6 @@
 #define RPMH_IPA_CLK				12
 #define RPMH_LN_BB_CLK1				13
 #define RPMH_LN_BB_CLK1_A			14
+#define RPMH_QPIC_CLK				15
 
 #endif
-- 
2.17.1

