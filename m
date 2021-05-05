Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD4AC433B4
	for <linux-clk@archiver.kernel.org>; Wed,  5 May 2021 21:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F34CA613EB
	for <linux-clk@archiver.kernel.org>; Wed,  5 May 2021 21:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbhEEVjY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 May 2021 17:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbhEEVjV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 May 2021 17:39:21 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCF9C061763
        for <linux-clk@vger.kernel.org>; Wed,  5 May 2021 14:38:24 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id c17so3079931pfn.6
        for <linux-clk@vger.kernel.org>; Wed, 05 May 2021 14:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vhdjZZj0cxH1sOFf7cnRwsPjytINyJCyqoplegM2Sio=;
        b=KK/K8fTNtpI/sRKDN8LJvWs6y2Qovav6Xw5RxAc1rnqpauUJhF78f/iHvVOeJ3TgZW
         6yjVrsBJK14LiSiumhRtbCB/uHTme/poowcZKzyNQosaW19AyH3U/ejQFzDHUHCZMplg
         eWZs9aJA0zmE3SOfR/wUgdO2M47TSn8+Cx6VP3Cp4C7pMr2rV784fW6JzU//1XTdfz9z
         OWCgZVTGKx0WRIAc1uGCfvdzqk/K8N2yoJNDAtnG65byYQDIMbK+57GfgPG80pj4KMD4
         fyDBOscWHWEZCZutV3LwdXor4Ei6P4cWEpotCEtAeul1FQBi1wabIAbBPRJhipmEN/39
         5dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vhdjZZj0cxH1sOFf7cnRwsPjytINyJCyqoplegM2Sio=;
        b=inJ0+rTL+tF4WbEkc6na3XG+A7GCF+wyRhCZEAJdJq3cyhOnbcvjA6iKibttnD4udQ
         CXJ53BvfBF6mSunuyrAAbMOTp1RTrnJyWZadiacLF0MXR28Zgj9Te6UWyuXCwqVr0ibd
         WYGMgNgA3caMQueY2gK2awvkHSVh47U2D3W5UBwO4rRf9rTvs8GfQk4IkMJyYyxvabiZ
         ugggthN0ojui8+64gSmtqRh3UaFZ3x+jzJYXWEBMBXm0Ky1UcI9oeK0Ag0fCynAL1YtC
         NZqTVIKKAAmD5xdJRLo0bg27ro5RDBNWwaorpUGu4gpp4lcQdpw1QCROA4iDLQjJmXAC
         gGqg==
X-Gm-Message-State: AOAM5305Ag91wpOK72cj91Moo2L3PIqy5mwJ8wEY4PvHQN2xODT4wAbB
        q4u0VAhAKfQwnyohFkNVS5aAK/09Vr26JA==
X-Google-Smtp-Source: ABdhPJyWSpq7imTNSFR9FHpSkOIrd2OpZ1ePNrNW0UYnS8xM5sixk3U1mHqE+u12pKmEZxHEdAH3jQ==
X-Received: by 2002:a63:4b5b:: with SMTP id k27mr920490pgl.368.1620250703669;
        Wed, 05 May 2021 14:38:23 -0700 (PDT)
Received: from localhost.localdomain.name ([223.235.141.68])
        by smtp.gmail.com with ESMTPSA id z26sm167031pfq.86.2021.05.05.14.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:38:23 -0700 (PDT)
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
Subject: [PATCH v2 04/17] dt-bindings: qcom-qce: Add 'interconnects' and move 'clocks' to optional properties
Date:   Thu,  6 May 2021 03:07:18 +0530
Message-Id: <20210505213731.538612-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
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
 .../devicetree/bindings/crypto/qcom-qce.txt        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
index 07ee1b12000b..3f70cee1a491 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
@@ -4,15 +4,19 @@ Required properties:
 
 - compatible  : should be "qcom,crypto-v5.1"
 - reg         : specifies base physical address and size of the registers map
-- clocks      : phandle to clock-controller plus clock-specifier pair
-- clock-names : "iface" clocks register interface
-                "bus" clocks data transfer interface
-                "core" clocks rest of the crypto block
 - dmas        : DMA specifiers for tx and rx dma channels. For more see
                 Documentation/devicetree/bindings/dma/dma.txt
 - dma-names   : DMA request names should be "rx" and "tx"
 - iommus      : phandle to apps_smmu node with sid mask
 
+Optional properties:
+- clocks	    : phandle to clock-controller plus clock-specifier pair
+- clock-names	    : "iface" clocks register interface
+                      "bus" clocks data transfer interface
+                      "core" clocks rest of the crypto block
+- interconnects	    : Interconnect path between qce crypto and main memory
+- interconnect-names: should be "memory"
+
 Example:
 	crypto@fd45a000 {
 		compatible = "qcom,crypto-v5.1";
@@ -23,4 +27,6 @@ Example:
 		clock-names = "iface", "bus", "core";
 		dmas = <&cryptobam 2>, <&cryptobam 3>;
 		dma-names = "rx", "tx";
+		interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+		interconnect-names = "memory";
 	};
-- 
2.30.2

