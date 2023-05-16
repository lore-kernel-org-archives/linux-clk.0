Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C569AC7EE26
	for <linux-clk@archiver.kernel.org>; Tue, 16 May 2023 10:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbjEPKww (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 May 2023 06:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbjEPKwu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 May 2023 06:52:50 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3974D1997
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 03:52:49 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-965f7bdab6bso2484827766b.3
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 03:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684234367; x=1686826367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpFcS6/U9h/RuUhlPguO2VViFIPJnqooFYL21zecDWc=;
        b=oSwt8ld8+bVPwcINZk+d5vBEei0mVDF0WO/J6YM7l5ysuBQvGHgKIXSd3W1NTAhgu9
         06XkGhYdkyewpOZkUUmE7Va9dC+PjzAwflNxd3VPu9zyGe9pesszAYKPsimh0f2whMpn
         WUkyh/qpp5ygRQVkVWsuDVqaDI7R++cimIYYyL17PuI/fKwCZhk7ydYqxa52j+VzFE+L
         /k4CEqYTuyLTc91kyamhimmfQUVAuMtmhRscbb04CW7DZwC1wcJaFJ2yZLgop48dn5++
         picHH5Z9j9hw+Cjkufhup3hIw8EQEA0x1VpPVDpUncqsIVGrf+r7T/LaZtms3kWV6nuC
         JYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684234367; x=1686826367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpFcS6/U9h/RuUhlPguO2VViFIPJnqooFYL21zecDWc=;
        b=S0+qGYVygv8Qmj0rz4hiqTr+ahX4OQ1xaoKo1ymbTApg49IFgG3lGRrowPFkSFNyOg
         nqNCeXW6ZJ8zHJHqMJQrtcn/vHVaziTXcnd0Vmh/CtB/+2A8FzvcKrOZ5w3iG3W1wOqM
         d3yN6cBt00zq6BKV88Oxv8O24++n4CS7YSjB0GRleTlMfulJfxJchSCnyGfAZh/RwYyq
         hU1pe9mLCbT4FTTZXdNNHz6UFXWIMb0vuBYYhHH9siRW7fzTxdlcAEpY+MZL4DNRrfag
         aivTwhy6JhjQFRfIkDFh7u+Aj4br5NylfFdcBc9iAxoGyx36FqKHia3vZX3zCyjq69tL
         9UgQ==
X-Gm-Message-State: AC+VfDw7uzCkRUX8AsRbBta4PuI8JFvBLHvaruo9osmrRodaAJtSC2Yb
        QH2nsG3H8slHRmqrHuS746fw7g==
X-Google-Smtp-Source: ACHHUZ4WIw3zHChy/kqbDEGUphyZGJjoFdQUKQslKtrGgvitcaudx5Cg32uWGTNUi43IpRsUm7pY/w==
X-Received: by 2002:a17:907:6d23:b0:96a:349a:6c91 with SMTP id sa35-20020a1709076d2300b0096a349a6c91mr20924070ejc.23.1684234367633;
        Tue, 16 May 2023 03:52:47 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id d1-20020a1709067a0100b0096b0e93193asm3679019ejo.90.2023.05.16.03.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 03:52:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: clock: qcom,gcc-sc7180: document CX power domain
Date:   Tue, 16 May 2023 12:52:40 +0200
Message-Id: <20230516105241.30091-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516105241.30091-1-krzysztof.kozlowski@linaro.org>
References: <20230516105241.30091-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GCC clock controller needs CX power domain, at least according to
DTS:

  sc7180-trogdor-pompom-r3.dtb: clock-controller@100000: Unevaluated properties are not allowed ('power-domains' was unexpected)

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add tags
---
 .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
index 06dce0c6b7d0..8bf9b6f49550 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
@@ -32,6 +32,10 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
@@ -45,6 +49,8 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
     clock-controller@100000 {
       compatible = "qcom,gcc-sc7180";
       reg = <0x00100000 0x1f0000>;
@@ -52,6 +58,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd SC7180_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.34.1

