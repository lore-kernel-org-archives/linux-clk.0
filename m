Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E64C433B4
	for <linux-clk@archiver.kernel.org>; Sun, 18 Apr 2021 12:30:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B26D61207
	for <linux-clk@archiver.kernel.org>; Sun, 18 Apr 2021 12:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235116AbhDRMad (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Apr 2021 08:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235346AbhDRMa1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Apr 2021 08:30:27 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF864C06138B
        for <linux-clk@vger.kernel.org>; Sun, 18 Apr 2021 05:29:57 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id e7so37345905edu.10
        for <linux-clk@vger.kernel.org>; Sun, 18 Apr 2021 05:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=poG+00NR3A/mJvY0huIpYA8eZO34WbE2BkLHQjye9Xo=;
        b=jxI71f4L5r2PHuL6P8eTxXCWATovgLqV9ms1eVcUgKCwi+hTiX9pD5PAYCGLrRRnsD
         bTVo7NJqPzuGTkPrW8xxSnUsIjNiQbftvHPsiMa/bBPqfkNPz534XcXYhyT61l0Ptlpj
         YpxMpuPdlKrNNP06vxg3z5/NfNpJS80Wbsvfj1Epu87eC/WOYvC59jPJI7ov+UmvgaWR
         nGpHz5GefQAuBh+n8idLvg7XXnYau2iV8Zp+3u6R+gbAMAyhdoJ5egOlHtymAixP9a8G
         I0qok4jXFSNgvQMMszsNHW5usoljDr96S8uANTNpjBCy8tbKx6/+qfpotCWlV48TcSOF
         OztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=poG+00NR3A/mJvY0huIpYA8eZO34WbE2BkLHQjye9Xo=;
        b=K1lT0CwyudwcxJs8GJjhaGx0dyvs1J0p1UAvJdtcd5d0lvT4TrbPSUbPKUYLOpXojK
         b5m6XM0znnDRljqhs16/EkT5rBgKngpLDuL8srpKnUcVrf3ciXtQJDDYB+Tjc7mrGTjo
         /FTmpLxE2Jg8gwD/rrgLZnpjBiqLmTeIGtF5W6xHojaJkGYlOyWWQWSfcn6KxHZZEQss
         faHBZaYv1r+RjI2SUL6GTwjITnSb7f6oeSlG2cHuW8iWhTLpNJUT/rH6y02fN6dKJWtY
         GPFqRqYRpmZKTNC8GZ59IK7Jg3F9cJ8tX7p9cIOKd96Xp9p/x9n9WjICFRiLpLlN8d9D
         W1RQ==
X-Gm-Message-State: AOAM533N9/+6vqAFxE1o/r0KfY3CkeM69NHoWP0Ep/oVulLpkPMx7EIy
        hNheIzff9nYW8cXFR+P85qXgKp6wNavmke03
X-Google-Smtp-Source: ABdhPJyGX/ftdays69q5ndkss6svGGpAWjC4/CJqNRxdNiBRdj2hPflxZYvnlGj4VBPrnuejAMbtxQ==
X-Received: by 2002:a05:6402:1157:: with SMTP id g23mr20062254edw.303.1618748996620;
        Sun, 18 Apr 2021 05:29:56 -0700 (PDT)
Received: from PackardBell (87-49-44-144-mobile.dk.customer.tdc.net. [87.49.44.144])
        by smtp.googlemail.com with ESMTPSA id k26sm8483371ejk.29.2021.04.18.05.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 05:29:56 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id f2c73f30;
        Sun, 18 Apr 2021 12:29:50 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2 4/5] dt-bindings: arm: qcom: Document MSM8226 SoC binding
Date:   Sun, 18 Apr 2021 14:29:08 +0200
Message-Id: <20210418122909.71434-5-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the MSM8226 SoC device-tree binding.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 11ec349d56..73902ce46f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -31,6 +31,7 @@ description: |
         ipq6018
         ipq8074
         mdm9615
+        msm8226
         msm8916
         msm8974
         msm8992
@@ -111,6 +112,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - samsung,s3ve3g
+          - const: qcom,msm8226
+
       - items:
           - enum:
               - qcom,msm8960-cdp
-- 
2.25.1

