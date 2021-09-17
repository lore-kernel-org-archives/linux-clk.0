Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D0EC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 17 Sep 2021 03:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 907E6611CA
	for <linux-clk@archiver.kernel.org>; Fri, 17 Sep 2021 03:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243661AbhIQDGX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Sep 2021 23:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243535AbhIQDGT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Sep 2021 23:06:19 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9F5C061756
        for <linux-clk@vger.kernel.org>; Thu, 16 Sep 2021 20:04:57 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id n18so5217301plp.7
        for <linux-clk@vger.kernel.org>; Thu, 16 Sep 2021 20:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7aZTfIyIwGJxBeqjp2VS+8QxWVwQJBhJBrFL9IwQ/I=;
        b=TfH/UwihBn07N6B8SaiphNPVx6O91D902u9TQ/EbMLi02aRRf/JGhLsckQFVRKagqX
         nj+URvWiTuuPkzk5H1UH7HoHwe8d5kbH738tn5BQ89Bs2t8GKBygiRZOnMWB+xJZCS+D
         pyRK1oJ0eW7KIIATgqVaTQtK10QDQLDm4pnmkKvQDcaR7hU4JoSLufXXeExBIZBD0o6e
         kvB6yQoLhovrdcwVN07it/wHj5Qa2iGdSKzDZ6KKKLBJh5HZV27n3Pb8KYikgpF1JSoL
         28IUSnRqpyia+pd6cYjRqfG0qLYE7/7dYnc9ORPQdoW8/dmtq8rJ561E4ZXskyPuLCc2
         er1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7aZTfIyIwGJxBeqjp2VS+8QxWVwQJBhJBrFL9IwQ/I=;
        b=P/9NvqSJ9vVhkrZXhB346CN19uMObIbhEFo+buY0fCq2bWhUjp9WyypztBKgJ1lCHS
         AVY6E59fNPzOuyAatgHYljis8Ho6zycDFAcS4k9bZlMuubSA3fzNF01rMgPPIvn+Z2RV
         Ef0Y1cxOJiLBmiQ+yRu4SopKVqiIvmNs0vfsKPz5kxxDIGxDgSw71TX8ZH4eK4UVSy4n
         j2Xrmjz+iRJMG9NE3FDn6WYiPG5RXATp8m1j/lhp+MC9jBM7q3SnwuoBlQ8U7Z9v1Qj1
         kBLveCgBXKeCGOYNaE/zxn22ajm6iUAnDacPoLpPsHSXCnfKcgkIV6qIY+CD4+f004uS
         lB0A==
X-Gm-Message-State: AOAM530T479WunMOrv+++k9vWogEfdMPxPlALmRIXgRKAogeWE91BTEe
        T9xN3z5iOLIVlAJK9w1iJGbTxw==
X-Google-Smtp-Source: ABdhPJxW3k+400xVkw3brZ8+3L3VXOsWc6oWBCos9LEzYvlO/dzrhaf2VqwNivupm/FilZzgjd0nEA==
X-Received: by 2002:a17:90b:1a90:: with SMTP id ng16mr18682154pjb.116.1631847897462;
        Thu, 16 Sep 2021 20:04:57 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id q2sm9133930pjo.27.2021.09.16.20.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 20:04:56 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: clk: qcom,rpmcc: Document QCM2290 compatible
Date:   Fri, 17 Sep 2021 11:04:33 +0800
Message-Id: <20210917030434.19859-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917030434.19859-1-shawn.guo@linaro.org>
References: <20210917030434.19859-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add compatible for the RPM Clock Controller on the QCM2290 SoC.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index a4877881f1d8..da295c3c004b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -25,6 +25,7 @@ Required properties :
 			"qcom,rpmcc-msm8994",·"qcom,rpmcc"
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
+			"qcom,rpmcc-qcm2290", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
 			"qcom,rpmcc-sdm660", "qcom,rpmcc"
 			"qcom,rpmcc-sm6115", "qcom,rpmcc"
-- 
2.17.1

