Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28338C11F66
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 01:31:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08C706162B
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 01:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhGIBdd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jul 2021 21:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhGIBdd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jul 2021 21:33:33 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180B0C061766
        for <linux-clk@vger.kernel.org>; Thu,  8 Jul 2021 18:30:50 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id r16so5362185ljk.9
        for <linux-clk@vger.kernel.org>; Thu, 08 Jul 2021 18:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KLWZj85HgqkOqv1HxmNCRrODidaWLC0A2DygbxwWKbA=;
        b=Q+7Q06TZMaRjb0umJVm8KyLu9MHa3JJHlLCPzVZ7OBOVBMu7IhodPJTBciQftzkP27
         Z9bskE9ahMvfBjG+XIf7Y/uhylwsmrCMDjm46DuoMBO+nAxF5BZbNDEYifc69xgt47aY
         l8uRhn4igEMAydPH4TU1JZUpHrnhC15LsuIakC1sqlCFye9ZkM+YIih3MeP1UpaAOyvv
         13WBz0AFMfa8G6gk/SJx9Z0Cdu2Hqc/IbqyDI1IBWQQJ/YSR1UiQ5BkVle+FdQ3XVNR3
         esK5CIfXyX9bjc9V24g9frP8cftRFEr6pTODIkXeHyeiUTVhf7duaeY9ZNMjvY/wEVwM
         tmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KLWZj85HgqkOqv1HxmNCRrODidaWLC0A2DygbxwWKbA=;
        b=qTCGM5GdMJNqYfq9BmE+6uF5S35ErVhQ9ywVtojasjecGhNkq3wVW/0b4YvKgKnL4R
         uUG5+M+U17m8o+zgLWttgwVuzyqJ/9+pebjK2Y/AkMnqmLW02SgRJOlfVm6jQ4j0yrOz
         BxFSqxZxOn4KOkuXwZZ69PXIliUEPWqh3hffBvZ/HYHEXnt6Xfqfj5N/ASOgSG/yd/Q5
         79ZxtJsw9ZxDdb9aUs44HU70IVCJSpJSfFgjwtv7CCk2hfnRUkyw8nK4n0R6iFDBUVTq
         TWWg+L8YoawikzanQ403YlOFOQDaeryQEsAPwn/yJnk3JVhv3erzDNJcTv04+opUpu5g
         Mg1A==
X-Gm-Message-State: AOAM531B1C7TvedZeUI/H1Hck/aMWn4I+zrGm88O489CMbVLQP8pDu19
        8qWcGGdzLKkPgyZOd2aTeA6M0g==
X-Google-Smtp-Source: ABdhPJx2k6Xm8E5xsLvF3RDfCZJ65Ifo/B0TBeALDSbIwgbtTanatypBMXqYC8pOu436474jtNXeVw==
X-Received: by 2002:a05:651c:d4:: with SMTP id 20mr27455105ljr.68.1625794248294;
        Thu, 08 Jul 2021 18:30:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm405637ljj.113.2021.07.08.18.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 18:30:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
Date:   Fri,  9 Jul 2021 04:30:37 +0300
Message-Id: <20210709013043.495233-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
References: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On sm8250 dispcc requires MMCX power domain to be powered up before
clock controller's registers become available. For now sm8250 was using
external regulator driven by the power domain to describe this
relationship. Switch into specifying power-domain and required opp-state
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0cdf53f41f84..d5c4fed56b6e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -55,6 +55,11 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -69,6 +74,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@af00000 {
       compatible = "qcom,sm8250-dispcc";
       reg = <0x0af00000 0x10000>;
@@ -89,5 +95,6 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      power-domains = <&rpmhpd SM8250_MMCX>;
     };
 ...
-- 
2.30.2

