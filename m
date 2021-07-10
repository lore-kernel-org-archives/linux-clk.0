Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BCAC07E9C
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 01:33:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 837F2613F4
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 01:33:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhGJBfm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 21:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbhGJBfm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 21:35:42 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92849C0613EE
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 18:32:57 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 11so6891230ljv.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VrN3elTI7+Kzg6g/SXVfIltFU3nA2N1wG+nv/RHcI9U=;
        b=TsGqX9r08myLBRBpZxu83bcCsAtPbTnf38LqBnpRufsarBMYAAQIBQyo4YiewiqxOa
         550OxDGs1qnBM6P6Lmrj3egadxWAKVruhkURl+9ZNXDHCDL8CWZFVx67vT/IN2TwmbRG
         rRGY8ptYEAdhWxlWgDSO+l8hOE/zDc6jMK0g+eNPyoCcFReoN90TUvmkuEEXer0mFXAb
         Ge2B/lUjLMqaEBqPPbpAYhqFMwhXTCr7WiQWTJBgtQt388RsqZAOLwMGqXmE74xIKQQS
         L0RGE/yIoLIYIPcUEAWqXlQoCbZRoaoHbkB3Z/Y6lvW3nexqCJ/7jM77c7J57k3DwTEj
         s52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VrN3elTI7+Kzg6g/SXVfIltFU3nA2N1wG+nv/RHcI9U=;
        b=Ixbnvi6xcu7oLk+qXyHR0D+vqBr2dC/S1o9+lQYLllwVxy5PjVclfWIY38/IGieTZz
         M5hsZSH0mA9KNSVwYrgsWpOES6upvkhevfzkaiKen7J/xxUPXa4WbZ8rMulDjQP5Caut
         rNZ4lx0qf6Eq/erXvlkaREEucbQEg1pU97pvZ346ska32gvYvz9WYc1BagYFvMh1CWYP
         +85D3foohEmJj8Bu/xOHLPejEr5VKn4lewrqX3+ETWT8481PZOh0375JMrUWoIWq+1XE
         W7DdO+q3E0Y+ufXIQAKxfX8PADm1TcKbX48q7ZcTiVPASFGneMmA0jYCcmvzhHbq5ucR
         XMDw==
X-Gm-Message-State: AOAM530YaJGRz/vMcz8b+RdhMlaFAjNv1J7MERziHjxBDeVcZ9BWO8ah
        STz6TceBzwOgASmOoohLqE8Low==
X-Google-Smtp-Source: ABdhPJy0X5/mqnBvFEI8/TZ91QxTtriJEzkTBGMP1Xr9Mp7g+lm+TvlFSBZCFghjhtnHuaX8sqWdcA==
X-Received: by 2002:a2e:b6ca:: with SMTP id m10mr2944239ljo.282.1625880775932;
        Fri, 09 Jul 2021 18:32:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13sm588788lfh.206.2021.07.09.18.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 18:32:55 -0700 (PDT)
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
Subject: [PATCH v4 1/6] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
Date:   Sat, 10 Jul 2021 04:32:48 +0300
Message-Id: <20210710013253.1134341-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
References: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

