Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5122EC43331
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 05:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 024BC64FF7
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 05:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbhCJFZp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Mar 2021 00:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbhCJFZa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Mar 2021 00:25:30 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80436C061760
        for <linux-clk@vger.kernel.org>; Tue,  9 Mar 2021 21:25:30 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id g4so10619207pgj.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Mar 2021 21:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=00Qj3y18Y6HEZTQemqqh4Pl0Lyv+swPhAM+M8xYZg30=;
        b=HQ9BQEzxD10uSnjlp0tQau1zqNP1/AQG2ieW3xcPQZMFBQ/AFgIqZJfNBJkIztjKqH
         JsVzZvt7BWvGKJIH8CjXAK/fj6QVO03l/F6wKZZeCFpskXmHneQEI375vKdWp9xUqsxq
         g+VOFQOX8E2Fu4milwd7D3xnb/VVbd7cN88GuHts5IF03WVSiUmKeZM3TupXr2roB9oT
         TGBQXafPfOpVIuzxQvGRYluaBk6qt+XUEEX5QHn0FkTm/ya3EbPm5gw/Gvgj3hXC8Sek
         E+whyWF9itbCwqV91MF+ecgyCS5cqxG52nWHZ5524H/2xxKPJI47s9oaZ9mgPOZJcXIS
         TZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=00Qj3y18Y6HEZTQemqqh4Pl0Lyv+swPhAM+M8xYZg30=;
        b=W65jKTO+kGFC3VqAmMIpFJBU3CRLjRyCII6ggzdiQjP30hII923cKa8O/mvKlWI10u
         W9hv66HLM53x4/KOQ0VMEztY4nV2pVVcCArmGNZoXwtSykI/EEkBvNgzesRR/7j4+F6A
         OA8LejQK6OCZew/nl1AsgopK725r8eIJT/Qh8hFShjpHWfVT8tJL4RDwf8WuI/07riEk
         YzIoSfUoxNnjHNOaAYicRwdi4V2ZL4kTzCzMzP7+Gj/pY/fDWkZYPME9T8AGgLDamVoG
         Wl017xJpU+SSsg4EBdooQ3ONmrUSD3viYO6kiBWedo5Xtjk+VjBTpKcqPmICJJaSm9/4
         hLJw==
X-Gm-Message-State: AOAM532EOfdYJ79xRLAm8SXk4Id/C4yHy5044apibrxaZMGIuP6sIL0/
        INLAwE3DNLzkk1f+ha08I0eY1g==
X-Google-Smtp-Source: ABdhPJwfyJA7R9hJ6TqvcQhg8m3LL00lMVdevq2ilYQbeQdkIkW5NLWx+2xHXbaKD10ANJEyIvRakg==
X-Received: by 2002:a63:207:: with SMTP id 7mr1298617pgc.346.1615353930118;
        Tue, 09 Mar 2021 21:25:30 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:9f4:a436:21bd:7573:25c0:73a0])
        by smtp.gmail.com with ESMTPSA id g7sm13915224pgb.10.2021.03.09.21.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 21:25:29 -0800 (PST)
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
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 1/8] dt-bindings: qcom-qce: Add 'iommus' to required properties
Date:   Wed, 10 Mar 2021 10:54:56 +0530
Message-Id: <20210310052503.3618486-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
References: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds the missing required property - 'iommus' to the
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
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
index fdd53b184ba8..07ee1b12000b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
@@ -11,6 +11,7 @@ Required properties:
 - dmas        : DMA specifiers for tx and rx dma channels. For more see
                 Documentation/devicetree/bindings/dma/dma.txt
 - dma-names   : DMA request names should be "rx" and "tx"
+- iommus      : phandle to apps_smmu node with sid mask
 
 Example:
 	crypto@fd45a000 {
-- 
2.29.2

