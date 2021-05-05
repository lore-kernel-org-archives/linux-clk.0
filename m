Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B552AC433ED
	for <linux-clk@archiver.kernel.org>; Wed,  5 May 2021 21:38:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B99B613EB
	for <linux-clk@archiver.kernel.org>; Wed,  5 May 2021 21:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbhEEVjK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 May 2021 17:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbhEEVjH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 May 2021 17:39:07 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC07C06174A
        for <linux-clk@vger.kernel.org>; Wed,  5 May 2021 14:38:11 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id b14-20020a17090a6e0eb0290155c7f6a356so1561522pjk.0
        for <linux-clk@vger.kernel.org>; Wed, 05 May 2021 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G8+gYdiVbmjOwjaPy7U2TKEE4QviaMAH4q5NozXKn0Q=;
        b=iBQAa1NKgpUgni9h2YA6oy4Dn8VunyJlqmjKKrxMQ3nQ6IbaEFRXGLYlYp+pgZz5fT
         4juD1l4LNyQyKEfwDt5lQ1qbmSyVPZRXOWH5t/g9PfGAmBDOVnQCoKTHQe4w6xJfgngd
         +UgsZOvjPV96U8y5firvnk35d14xflagdpdkrwzEX850NrG+kUIU4ydsTX7Cug/bQjfQ
         Q80OH4+HkkBX3vI35IfBIRTH9Xf5Y7n3baFScUzxxT6Xw05G4T7nRrus7lj/f7gHTxJd
         xXGnXALRWRZ5RXml1+sMSnlHE5BizZyLQ1tA3hlpDqlD8i8iwYh+cw1X//TT3ZL7F3Di
         HwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8+gYdiVbmjOwjaPy7U2TKEE4QviaMAH4q5NozXKn0Q=;
        b=OUUf8WILdKchNxq1jNV9/AJaccwImcOA2ZP+T5zIwGH2LEvalopl2iijNjjfrMr9Ia
         H9FK3TlejG2TBuqYevq1pCDtqtKVD+Loel3PYqe7gRCtmO4H6Ud7QoPpL60bqOeXh75a
         JMBVt44iaUJQJTvMxfaq1qzUDDVK6UXEUGVphm9am+SJpJWgPcwYwt50AfLCihn/z45K
         XybidMmQSI2WxPBU4U/jBBd8TbcdA9agKH74cRro4lqzgR2G44PVbIAYO1LlRh1dBD5s
         AcrplCAf74AGxOLnz9TTA8WO/m96K0op+oWLkWwCO7xGOS7OkdpyLCXyzMRG6r8RNAdl
         bTLQ==
X-Gm-Message-State: AOAM531CHZUvwYsR2dISWGN6iPIle/ppN3fkmySkpTSxzezVvTZuCQ0n
        aBW3L3O0Q5zKnNipCLuxJQGKig==
X-Google-Smtp-Source: ABdhPJzTn9wRcKkeSIPwlw1URylkANElXVgG9hVuwr1AC3j5LFOGnSLRAMSLSbgcIRCZohliYs84cg==
X-Received: by 2002:a17:90a:246:: with SMTP id t6mr737090pje.228.1620250690710;
        Wed, 05 May 2021 14:38:10 -0700 (PDT)
Received: from localhost.localdomain.name ([223.235.141.68])
        by smtp.gmail.com with ESMTPSA id z26sm167031pfq.86.2021.05.05.14.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:38:10 -0700 (PDT)
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
Subject: [PATCH v2 02/17] dt-bindings: qcom-bam: Add 'iommus' to required properties
Date:   Thu,  6 May 2021 03:07:16 +0530
Message-Id: <20210505213731.538612-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the missing required property - 'iommus' to the
device-tree binding documentation for qcom-bam DMA IP.

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
 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
index 077242956ff2..60a76c0fb118 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
@@ -13,6 +13,7 @@ Required properties:
 - clock-names: must contain "bam_clk" entry
 - qcom,ee : indicates the active Execution Environment identifier (0-7) used in
   the secure world.
+- iommus  : phandle to apps_smmu node with sid mask
 
 Optional properties:
 - qcom,controlled-remotely : optional, indicates that the bam is controlled by
-- 
2.30.2

