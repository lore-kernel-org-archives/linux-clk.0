Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B39C433E6
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 14:59:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7399561A2B
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 14:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhCZO7H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbhCZO6y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Mar 2021 10:58:54 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB2EC0613B3
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 07:58:54 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id f26so7701226ljp.8
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=poG+00NR3A/mJvY0huIpYA8eZO34WbE2BkLHQjye9Xo=;
        b=lTOosdYbCD9/gpjh2Jw/ASQJNPOr7lwvxyE/E+tTyeEwq3Pj8TRUsOikBb4yLo19t7
         kmu5p9/ICxySQmZrXOMi3md57VJ5Nind++mFrz5CiYormjAPBtT6zCQiDO+moqIwMUMK
         Ng/OQpT3oxaIgCrK7ZdG2ub/njE4msdqWLPW6kHfwPItBYeAdwH+g7lcJKQRYbUhqYYE
         yHwRPI12Grg1qa+m9uPcqKtIl2J0BbasxMQ8VIRO6GywG92egDKmVTwitEWsOToFCWj6
         MqVPWYYNTBLWhoK4hE15BIipnAQjQDQ8Kqo/Sjh6PCOqvFF8VxfeTeNN0C1olqzTAkOn
         WxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=poG+00NR3A/mJvY0huIpYA8eZO34WbE2BkLHQjye9Xo=;
        b=Oo7h5tUtnTy+ql9O/U0ElBkc7Frg6QawOQiLoy5wP/LUekvm94quHLcTLd6y7JtQPP
         GRKfq+8c6EatX6dQEY4JrMT3LQTmlRnbpXhVF1wh+lEZJZ5cfDh6AQNyzADrSqSmLYBp
         wz1E76dM/NhTieQmvvkiTT1/nctInBJmjyzLQYn0MkMVWr+7cxTugHN39AY3o4HZ2vwj
         6Dody9R/008L1bHsMD/6Gho0GuCQENl8iLvw1i5pAtJk+e6K3FZ/k2pg4J1WSwmaoKiD
         kYoF4kjk7gMmNHKykwCKLiiHuzYQbA4KsifPpGy0Y1d4azgaWYVOzZ7Zr2Q5HZbIYuaL
         q67w==
X-Gm-Message-State: AOAM530yIuIKq1t+SWQdBLsSgoVV3XOtJRgg9HOX2BCXl8/RbBPCj858
        nN7LbyMxndjNkrs1fJbmpgFENg==
X-Google-Smtp-Source: ABdhPJyQPBwS17vy4o4cDJyDTWBJcHrL3hLQRNn+/Ag329pJV9TjcbwV+wASNpObNwq3uGNp3Vep2g==
X-Received: by 2002:a2e:9c8e:: with SMTP id x14mr9326421lji.312.1616770733080;
        Fri, 26 Mar 2021 07:58:53 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.googlemail.com with ESMTPSA id k2sm893382lfm.174.2021.03.26.07.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:58:52 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 15a566f0;
        Fri, 26 Mar 2021 14:58:48 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 4/5] dt-bindings: arm: qcom: Document MSM8226 SoC binding
Date:   Fri, 26 Mar 2021 15:58:15 +0100
Message-Id: <20210326145816.9758-5-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
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

