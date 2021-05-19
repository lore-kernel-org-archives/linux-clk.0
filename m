Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48667C433ED
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 14:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 274A76124C
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 14:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347874AbhESOkP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 May 2021 10:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354416AbhESOj6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 May 2021 10:39:58 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE42C06138A
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 07:38:19 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id c17so10036465pfn.6
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N4+Pmvy+Kn++u+tJ4TtTc+C+SSq9T8K7CwVNxOIPf08=;
        b=x2HRCTgG0GipiWBQV07MrWomyjGTmV7e4awp8zrWM08SFfCgZhcczG3pxZ8iD2a1/d
         kAyVzuq69LQyP0DH5u32JgTO48NM0M4agymuMF3Y9akEUjkPGSnpqualcBZl5Ue3lLvr
         h2+udxNYvoW8ZM9ymO8oRwyLaJkasizAM7pMMZLyQJzZoVO8lpaitttXtcVF+I5FLH89
         WN1gbQo2LRRpT5OPvqlATjjUahEWcsUSi99+xxRd9LEynK5VUH/lCulfveJozVyPs5OA
         uFgEO51te7ziVGkJRdeKwxlRDLlhzFDQX3T5VDhwxhCq8bjJ6PbcXW5aCW/02q4cidEr
         ISIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N4+Pmvy+Kn++u+tJ4TtTc+C+SSq9T8K7CwVNxOIPf08=;
        b=hjOZvYW0d+03/9qmD/IUS3V8rpXVdOuGlchZwfisGDp9LkG8BdgqfmUnKHBuT2+4gK
         7vNbZTytdy1PVyaReD+fWbAD5BAgWgGhz3usD8hxjoCzX91fo7xBIQgwEDUt6TWH7eK4
         ZsE3sdU/9tXr+l4fGkQ3NnQ5dxnxG9D79/x1ajerP4DnblVf9TBttvVjJSHPxW95Fpuk
         lNj05KgOciUiX1ETML/K4ikIeUxK2nlYPWHty1Z4FoGNhAiq6MbN3CtqJ8Cmfi++65nX
         FvMMtLwZIVXtC5nKGpZaxgQXKbCDXvTfdIN7lu+SXIGLOiOiDH6SFbhLEF1WX7r5F3rT
         /qhw==
X-Gm-Message-State: AOAM5326xikrIgGGaZ35m/XXKVC1YtWstvRsIfUeTeLjuG62u34mMV1v
        91fOHoxzaYWEX5d1aA66CMdFmw==
X-Google-Smtp-Source: ABdhPJwQ8L+n4Xe7Qq4tu9SJumb4UjS8KaJ/uz1/vXqSGC2KvOezTn5DRRaQ0RPlEN0HrPsxQ4PLvA==
X-Received: by 2002:a63:bf4a:: with SMTP id i10mr10994699pgo.200.1621435099126;
        Wed, 19 May 2021 07:38:19 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:38:18 -0700 (PDT)
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
Subject: [PATCH v3 08/17] dt-bindings: crypto : Add new compatible strings for qcom-qce
Date:   Wed, 19 May 2021 20:06:51 +0530
Message-Id: <20210519143700.27392-9-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Newer qcom chips support newer versions of the qce crypto IP, so add
soc specific compatible strings for qcom-qce instead of using crypto
IP version specific ones.

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
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 4be9ce697123..7722ac9529bf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -15,7 +15,12 @@ description: |
 
 properties:
   compatible:
-    const: qcom,crypto-v5.1
+    enum:
+      - qcom,ipq6018-qce
+      - qcom,sdm845-qce
+      - qcom,sm8150-qce
+      - qcom,sm8250-qce
+      - qcom,sm8350-qce
 
   reg:
     maxItems: 1
@@ -71,7 +76,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-apq8084.h>
     crypto-engine@fd45a000 {
-        compatible = "qcom,crypto-v5.1";
+        compatible = "qcom,ipq6018-qce";
         reg = <0xfd45a000 0x6000>;
         clocks = <&gcc GCC_CE2_AHB_CLK>,
                  <&gcc GCC_CE2_AXI_CLK>,
-- 
2.31.1

