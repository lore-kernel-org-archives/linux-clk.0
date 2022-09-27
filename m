Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E238BC6FA83
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 11:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbiI0Liq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 07:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbiI0Lif (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 07:38:35 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0318F14DAFC
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 04:38:30 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a8so15231553lff.13
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 04:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=fsvySvv5M9V3xQBXuCnLy2D+B90t0AmGqa1i1Z9WwTg=;
        b=pgZNPdDlu78web2YSWdRD++2SpRZV4F9J+k5on9NlF8nezvxj85vnvdZ8H1RkEDfna
         4J4dmcdUW+akozjb1X/BXwS5HFrrrt7BmSXJmjAW7q90kqfSYn28UftXKJL+sEmDb/2A
         HnQpOs2IX4Ug2idpJuIeOeM74VwKcKOU61FCnnHA7uIMKHbl7OHlgM1VF0xx3XKscwPx
         8hya53+0IzgA4vSuKCv2SLtMe2z6yrOgR1i2LCcPffU8MbTRDryu+YnX5FbI20VO+HuL
         TVI6EIfJRuK6pFUUBKZmOJRUzXpwu9sjqqncdpq3qq0FYRonAUkBpgTZ5ahb0Jm3agXH
         AZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fsvySvv5M9V3xQBXuCnLy2D+B90t0AmGqa1i1Z9WwTg=;
        b=Y6ioAVU8bDClsIuTVIR8sWA8DBBSXmXeEwekz9ymI0o+F1Tlt+/ycC/BFEZWVy2ckN
         PL0uic8ynXyUgPMGAXJEgvpu65b3SJ4Rnctr28M28nSBPWALhn9lZ8hJ/UFoCzWLWeXD
         M0814+iWuXYtncr0lIkaMAk1wasYM3rd7DNyNXwCAWc6hpvTNDqz23ipYEjnkuA0+RaQ
         9oQmNhzr838ql+3b510rkNIIvnraDwi+8Bdyc4XqxT7yNpydHcwTdW2HO+Y+V5DqJpJC
         JxNPXMFVYTx2JJhHlMzjIdYl2fcGuK317mh7sOpGH8fMtz5A0Rq67G8u6zOx+EtqI5ll
         H6Eg==
X-Gm-Message-State: ACrzQf2XR02Ub3vopMWjlYiRvTLmUG7N1BKvp4Uy+msQYjvCqmEzIXYu
        6c6v7xLIek9HHbyMmG+fBlzzFA==
X-Google-Smtp-Source: AMsMyM5Y0cLzSNYGobE3uvN1ksI0VMgd/oKeSZsmjeTYz4+W9GO/lE6Bl7v8N0JQ52pdhZfd+VKEkg==
X-Received: by 2002:a05:6512:ad0:b0:497:a620:157d with SMTP id n16-20020a0565120ad000b00497a620157dmr11650761lfu.643.1664278708766;
        Tue, 27 Sep 2022 04:38:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t12-20020a056512208c00b00492dfcc0e58sm142165lfr.53.2022.09.27.04.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 04:38:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom,gcc-ipq8064: add pll4 to used clocks
Date:   Tue, 27 Sep 2022 14:38:24 +0300
Message-Id: <20220927113826.246241-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927113826.246241-1-dmitry.baryshkov@linaro.org>
References: <20220927113826.246241-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On IPQ8064 (and related platforms) the GCC uses PLL4 clock provided by
the LCC clock controller. Mention this in the bindings.

To remain compatible with older bindings, make it optional, as the
driver will fallback to getting the `pll4' clock from the system clocks
list.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-ipq8064.yaml      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml
index 9eb91dd22557..d1f93ee9ff69 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml
@@ -27,14 +27,18 @@ properties:
       - const: syscon
 
   clocks:
+    minItems: 2
     items:
       - description: PXO source
       - description: CXO source
+      - description: PLL4 from LCC
 
   clock-names:
+    minItems: 2
     items:
       - const: pxo
       - const: cxo
+      - const: pll4
 
   thermal-sensor:
     type: object
@@ -51,13 +55,14 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/qcom,lcc-ipq806x.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     gcc: clock-controller@900000 {
       compatible = "qcom,gcc-ipq8064", "syscon";
       reg = <0x00900000 0x4000>;
-      clocks = <&pxo_board>, <&cxo_board>;
-      clock-names = "pxo", "cxo";
+      clocks = <&pxo_board>, <&cxo_board>, <&lcc PLL4>;
+      clock-names = "pxo", "cxo", "pll4";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.35.1

