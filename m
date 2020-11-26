Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA27C71156
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 07:29:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AD7821D7F
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 07:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IWikPKEJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbgKZH3i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Nov 2020 02:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgKZH3i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Nov 2020 02:29:38 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AEEC0617A7
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 23:29:38 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id w187so869256pfd.5
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 23:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GP/RLQWEDchE9LzjUTRfvMF58ENPqeEQ3Vvq9pvpD94=;
        b=IWikPKEJRAA2PtKy1qmWs9edanz/sraQoZz85InqUpvpd3Qb2wTR3VtjV/LytD0yD+
         lpHISQBnRBRAS+vYYklCmBCH7uH8UU7glm7CX3aGQgkbc/7KZJVeCtHGpkF/ujiMjPtb
         CLn5qSIK5qS8VwEFr5v+KGodrJNlRDYS1WOcdKuehu8zujpJQwKzRFOJ1XOlPEd9hHRG
         5synRKoaNvhkgypQvhqWREpxSf/cksVw1KzUNG0j1v3IwgaHezLx7sHXaqFsNGJ0W9bW
         ANSsG3rS1ngNk/JE+ka2+7TNU+GaWoVPRsKAbJ1Thyllq4Hly1rUcuSNqb2w6s3Fn+i6
         VS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GP/RLQWEDchE9LzjUTRfvMF58ENPqeEQ3Vvq9pvpD94=;
        b=gZ2LsURVKgh8losDPI+2Z8ticeFC0x9yN/tU4pXOZ02hnfN2/tU36U0xgx2Q3BFxEK
         rswb8KUqHQTm5tEqgJkLDurLYK7KnIRHwScI2II1wz/afzhxFftOlph91KVgawalLZ8B
         kUzMnojp1CSWSLXw8U64y95VZvbx/cujueiZXTpdK9To7s9n0uSUT9Vj0GCl3zK4UDSH
         zLo2YXICh0+0xgxuD1nKe4WHwuVyRhpgJv5ay8SRb1al27Q3cgLw3GdELCDO9j4teZuG
         Agkx+EdSYX4ARUE7AQDkPDyNS5jzCx4NtMAayTfoq1VFyIPhncTtKvqfCI0kFr+LnM9v
         xdUg==
X-Gm-Message-State: AOAM533QuSOmnYFoO5+NR+4wGeJ53wC29wOVa27ZwIkvnKIi9Jnm2UFg
        gAPHl6uWASWWpsy94Km+znUe6Imr/9QR
X-Google-Smtp-Source: ABdhPJxdnS7t3IQhsVxD7mCMRvjEQ63yhQJXiRPytWksfZRnVUiYTj9+m57D6KAKudr11ehEwmVCWQ==
X-Received: by 2002:a62:76c2:0:b029:198:1469:3a8d with SMTP id r185-20020a6276c20000b029019814693a8dmr1693866pfc.20.1606375777812;
        Wed, 25 Nov 2020 23:29:37 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id t9sm5508097pjq.46.2020.11.25.23.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 23:29:37 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v4 3/6] dt-bindings: clock: Introduce RPMHCC bindings for SDX55
Date:   Thu, 26 Nov 2020 12:58:41 +0530
Message-Id: <20201126072844.35370-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Add compatible for SDX55 RPMHCC and DT include.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
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
2.25.1

