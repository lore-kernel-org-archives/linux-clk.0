Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D239CC433ED
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 14:38:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B62D1613AD
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 14:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354256AbhESOj0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 May 2021 10:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354388AbhESOjS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 May 2021 10:39:18 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F59DC061761
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 07:37:58 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id b7so2988012plg.0
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gLAnCBqQqsONCjJBDJE0yrv+GAq9KPhwa4QXZbYyuMc=;
        b=c9bg2n3awUNosoxiqlWahS89fYJ+gyP54aVvYVGfNLcJPtw/1INOIfKLsyffRjjfBu
         TsbHHAXnsVT5Dky72Lnt2Nl6JBO4pQtt2P1TgmUXynMkgZEcbcAgcbT3bSiLCpu5YAC7
         99A7JRffauR+Gd30PcQsD47/eiTs2P8anCAoLNTp5ms5/cCLTYD3rS1HwcyczXQw/YlU
         uV5h51GL4KrPnNBdOnbtPCCUn7VzlFZLrwq2PPqHWnPqmwciMgeQxlLvbF2nCKhY5zh9
         hOUch6L1bcRqNl2VylFqMl5GDcUgqJh09qxe6ZxQAlyuXMV6AHXRQz4o7RhQHCTFw0qW
         EIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gLAnCBqQqsONCjJBDJE0yrv+GAq9KPhwa4QXZbYyuMc=;
        b=hdq/MzPREZzykvxjy0F4m7kpHksCBPUEppO8a228hnb/tu0AXaiDamlfbkrR6ECP8q
         gON5FgNxODiF3ZSuGn1q+fw9PL/vIV6Mp5ECZWYGg1aRkI9cx9EydV0L3XLyRTpdJpoT
         0GQioFsrPh45m2gmYQq7m3OOfeG/nOF6emgVOxBuWskrezq+X7zRPa+uPzQpPKo/v4R9
         YmumTriS6efdlWvKddnya0X3z3n3WdZ3LdZIFx0rz3rVvGi+9dii1HJRWIore4ex5BQa
         1jNmlrK/awUcQN/cAxiDCBw1faiB/t4pN6kpl1bQMsws4s9cXa2Khg6Q+3PTR4c//ZoY
         4IWQ==
X-Gm-Message-State: AOAM5315ECoRSJKUDzHYW7172cRH7jTco9F/GbN6ghCkkQFuRPFogkus
        L0G9oNeCET9VmoHP1xMGfXTmiA==
X-Google-Smtp-Source: ABdhPJwWLUgDVcf71X7gGMbQ99Sae9tunGUiXGB07T59dA9jnSueiZzrbe8btSVLrlVTHea+QELaXg==
X-Received: by 2002:a17:90b:713:: with SMTP id s19mr12238075pjz.144.1621435077893;
        Wed, 19 May 2021 07:37:57 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:37:57 -0700 (PDT)
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
Subject: [PATCH v3 05/17] dt-bindings: qcom-qce: Add 'interconnects' and move 'clocks' to optional properties
Date:   Wed, 19 May 2021 20:06:48 +0530
Message-Id: <20210519143700.27392-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add 'interconnects' and 'interconnect-names' to the device-tree binding
documentation for qcom crypto IP.

These properties describe the interconnect path between crypto and main
memory and the interconnect type respectively.

While at it also move 'clocks' to the optional properties sections,
as crypto IPs on SoCs like sm8150, sm8250, sm8350 (and so on), don't
require linux to setup the clocks (this is already done by the secure
firmware running before linux).

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
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index a691cd08f372..f8d3ea8b0d08 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -34,6 +34,14 @@ properties:
       - const: bus
       - const: core
 
+  interconnects:
+    maxItems: 1
+    description: |
+      Interconnect path between qce crypto and main memory.
+
+  interconnect-names:
+    const: memory
+
   dmas:
     items:
       - description: DMA specifiers for tx dma channel.
@@ -47,8 +55,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
   - dmas
   - dma-names
 
-- 
2.31.1

