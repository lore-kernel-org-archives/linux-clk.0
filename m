Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CDBC433ED
	for <linux-clk@archiver.kernel.org>; Wed,  5 May 2021 21:38:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AD07613E3
	for <linux-clk@archiver.kernel.org>; Wed,  5 May 2021 21:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhEEVjC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 May 2021 17:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbhEEVjC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 May 2021 17:39:02 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15511C061761
        for <linux-clk@vger.kernel.org>; Wed,  5 May 2021 14:38:05 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id gj14so1665934pjb.5
        for <linux-clk@vger.kernel.org>; Wed, 05 May 2021 14:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vuvuy1+AT+Se+Ymw219J/gL7FUpA6VquAVOTuh+g8Jc=;
        b=uLOLtUcD3/U1CPx3mWyktMgcU6UbmGRwzeLDy4y7Ko+ItOTBeVT4QOjivBXuALBv1Z
         54HWe0iEGbQEYyCBJ2mM+dIUqEYuwoHRv23IcpltCHEvUpbB5mV9o8YEfzyF4fgTmAgc
         VpMDp2zXpdU3XunQJKlaiAld9JzGfl4jL6hSmsebXSmPtAHp8oLn6lkNmJQOOH1UOYR1
         X3Zfyb3GZ5j2F8pkHhMtaKjToe4oOhPvurX6uYcrBUvghfzKbouG4B/adKZ+hGJKWag+
         RzJvBrTqmA0OQNcq7P/Pp3MOjBIrVbbawH1TIpNtswND6IsjO09IT2KuU4BdtxZOXbJu
         RumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vuvuy1+AT+Se+Ymw219J/gL7FUpA6VquAVOTuh+g8Jc=;
        b=JAZ2J5MyRaqf9aPXJ20ZfRtn0DxJugXjqHuCaoIJyZTo0KrPUeoY7DnoL2DsF+oEOJ
         KsUp525Rv8M2NmBkraS9QWcYl7twSSTt7SJpZE5hBTzVdL1eAIs+CinI9z18wgcKjAPn
         4ac7qA+/ieETAhr7UnK00yy2eQhC6ZDuo0Djc1FekZZ6WPIlXXrbrvEb//qdRCw/hAMe
         vIwDBzYu9HotYqVrDh+iZA50K/SrkQWwyx/72rpSaK+vzyqgA03DdN0i6OC/OdKInRE1
         Lex2LcuO3QcyMPv9gwLXbgnARdvlk+nu8ljRQ8Ribxxo4wsoRrzFHKp7V3/vWO520wnf
         629w==
X-Gm-Message-State: AOAM532dtV8OEJg+9KUKZf8d0Y9v0xv7R3I4nL8lpQlY9GUh/8tXJaoN
        s5ii0Pp5yM6ejVJVqmvnhCbj+Q==
X-Google-Smtp-Source: ABdhPJzgyvFxC589Qe4/bKRPP1/ndf0oUgZck9SproAnrE2LdXa+IqmozDQT9VjeQ6MEgdjPA6HmGA==
X-Received: by 2002:a17:90a:e643:: with SMTP id ep3mr13636722pjb.194.1620250684644;
        Wed, 05 May 2021 14:38:04 -0700 (PDT)
Received: from localhost.localdomain.name ([223.235.141.68])
        by smtp.gmail.com with ESMTPSA id z26sm167031pfq.86.2021.05.05.14.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:38:04 -0700 (PDT)
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
Subject: [PATCH v2 01/17] dt-bindings: qcom-bam: Add 'interconnects' & 'interconnect-names' to optional properties
Date:   Thu,  6 May 2021 03:07:15 +0530
Message-Id: <20210505213731.538612-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add new optional properties - 'interconnects' and
'interconnect-names' to the device-tree binding documentation for
qcom-bam DMA IP.

These properties describe the interconnect path between bam and main
memory and the interconnect type respectively.

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
 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
index cf5b9e44432c..077242956ff2 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
@@ -13,12 +13,16 @@ Required properties:
 - clock-names: must contain "bam_clk" entry
 - qcom,ee : indicates the active Execution Environment identifier (0-7) used in
   the secure world.
+
+Optional properties:
 - qcom,controlled-remotely : optional, indicates that the bam is controlled by
   remote proccessor i.e. execution environment.
 - num-channels : optional, indicates supported number of DMA channels in a
   remotely controlled bam.
 - qcom,num-ees : optional, indicates supported number of Execution Environments
   in a remotely controlled bam.
+- interconnects : Interconnect path between bam and main memory.
+- interconnect-names: should be "memory".
 
 Example:
 
-- 
2.30.2

