Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7F0C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbiL1Swq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232770AbiL1Swm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:42 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F7B15F1C
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:42 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id v23so7155549ljj.9
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuuDeykd0fWyvmdgCKovFBE0sMM/OGwl3dw5AGj6x9c=;
        b=E5EEtHRxumfT6nN4kpWSTts5iN9mXfF93TS57v/567KycZ+2SmwkNTE5z6DsPcXMRB
         kCXzoM/1FiclLZ1n+WYMRwkiNZ3FSm6lcm0lFckRROJaQTe6GNuhGXIKTvfz2EINHgh8
         aNc9gtrncKt5am2uPkG5/UkzOl6IlIXweW0AD4Q70yi0In/pqeQJbAoUf4PYrLJRg1Zg
         gagNEtXepv6KOCtxX/MBeCOHjiJ7IGs1zTpf+Wyq9FKErnAoRkGkFo7f7O7HgdoWMyeJ
         97YH+cP8DeQQ4Oph024maq5iJNU2tnxl+jUWirk25pNwePsIDSikf94PiZuTQ4OcuMtv
         tKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuuDeykd0fWyvmdgCKovFBE0sMM/OGwl3dw5AGj6x9c=;
        b=S5TQTfDovDvim92+kKYa9UM8It3wEvykxlh1h9awMmMlhBTC8MqQsWtm/RCLEKcu+g
         XsFxvYAgcZRdC6tApJXlQSdt19qIsZu1h1irCRPhIi6qEmySfA/6Os3W+KRGhhHgomkZ
         NIGatGQ9E2Ptec/CSa5RUfarVkMCDd9Vy3h/INmLdRRke1S0xL1pU871AOiGj12Fjjsp
         /XHBg8TOVodhr++pa0a3KUYh/upzw1xLvWOj/LjvOttfC8TVLwn3WPweYurjh9k4WFhW
         lKpB4rj4h+BztUQZZI1CI8EZt4HY1DwhcanJh/AkvJ5SCKFLlZd2cej9mQjPfmbljfaH
         rhMg==
X-Gm-Message-State: AFqh2kreY7XO9P6jNsT8fLEY4OesZ25JZliyBfELu/G7shHvMDPUQQSi
        GaBvDOICnOrlsO6FYv6HFF6Q+g==
X-Google-Smtp-Source: AMrXdXu+r3iM1uQ90G2yWnhNeYCGeEvXDj/kYPysaeAPHIhBgdV6QLA9CH5kKItOc5qmaJKTU8qeRA==
X-Received: by 2002:a05:651c:1cb:b0:278:f690:b736 with SMTP id d11-20020a05651c01cb00b00278f690b736mr7965293ljn.34.1672253560448;
        Wed, 28 Dec 2022 10:52:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 02/16] dt-bindings: clock: qcom,gcc-sdx55: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 20:52:23 +0200
Message-Id: <20221228185237.3111988-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-sdx55.yaml        | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
index 68d3099c96ae..428e954d7638 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
@@ -24,15 +24,11 @@ properties:
     items:
       - description: Board XO source
       - description: Sleep clock source
-      - description: PLL test clock source (Optional clock)
-    minItems: 2
 
   clock-names:
     items:
       - const: bi_tcxo
       - const: sleep_clk
-      - const: core_bi_pll_test_se # Optional clock
-    minItems: 2
 
 required:
   - compatible
@@ -51,8 +47,9 @@ examples:
       compatible = "qcom,gcc-sdx55";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
-               <&sleep_clk>, <&pll_test_clk>;
-      clock-names = "bi_tcxo", "sleep_clk", "core_bi_pll_test_se";
+               <&sleep_clk>;
+      clock-names = "bi_tcxo",
+                    "sleep_clk";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.39.0

