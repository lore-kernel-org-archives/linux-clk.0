Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2F9C3DA7C
	for <linux-clk@archiver.kernel.org>; Mon,  2 Jan 2023 08:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjABI7U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Jan 2023 03:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbjABI7Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Jan 2023 03:59:16 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73145270F
        for <linux-clk@vger.kernel.org>; Mon,  2 Jan 2023 00:59:14 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bp15so40766065lfb.13
        for <linux-clk@vger.kernel.org>; Mon, 02 Jan 2023 00:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4q/jhl+3gZkrvW3nGc8IjCx71O7qM9VQv4+FQ3jfK4=;
        b=OODQjf8rzsECesI4/DlAy5E/7P5nVKNg0lV1B9Xv8ILMlNkm2Yym4c4r0lwkXnCoEq
         3YS9B9m/beohywqDiF2OhJGAqWnhcaSnOzHoxkeMAdz2UQABwhHOzQCk2Yx7ZEmCv8/h
         kZEJn37eo//zRMt8mznFLHx2FAlUAmBPp0C2gP8MfuN1nF+svRmVUCEECKrP7pHlA0aa
         queXEG8Xu074Yc6TbMYcBe7vp8D00EgyFek3AllapVNNtn+ODVq3S5+OnpXD5uTMRRYk
         l3hb30Zs3VwvJwxOwO59q+0VzB11eyBOZMGhMLAMA10psY7CSzJasLBDwj3isGK3iX6l
         /24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4q/jhl+3gZkrvW3nGc8IjCx71O7qM9VQv4+FQ3jfK4=;
        b=aHfzTX7R36QCRoJoaILGIZWY8Bav/UFjbwoYYyTTYHLUSIZ9GViLnY7+5TnvIUaCAt
         Lj3bwYig0RNvHkH33ZO2w9AUw4gSj6sOtNiMXmlEtwAi7ftqwGCLwNpfkRaNOHY/J8Bt
         wyoann0NCQ5WdS9O7SVdBpXuG0Q7BiAw3KHi7oQDII5+uc96c1w7jsVfekrKjQjnW7is
         /nCFOfMfa08cLPzU/971xHRpEDlrdaNCtqJGDD7N46u00FFzGJzv+cIxGXE5iP6mdUGk
         FqF/oeUfEvB6dFYe4b5SFj9acM4zohDTDjK1vbc9g8E78CPJZOCYOIHY6JhugaaSRqUB
         EAIA==
X-Gm-Message-State: AFqh2kpeIhM+zrsC39JKgZJKZBNbgm2bdVo89TxKqAmGxR+GtZY7fa2b
        NJI8K6rnaqGH5CzaJ/F5xDi57g==
X-Google-Smtp-Source: AMrXdXspJWKdIifZHT3HNdT448iaptTWyDEqqaBpjqDxBVVjJnOAtDMpV+0t1lZYPG9PjGA2DRekLA==
X-Received: by 2002:a05:6512:3901:b0:4a4:68b7:e71c with SMTP id a1-20020a056512390100b004a468b7e71cmr11302705lfu.6.1672649952849;
        Mon, 02 Jan 2023 00:59:12 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y2-20020ac24202000000b004bd8534ebbcsm4370798lfh.37.2023.01.02.00.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 00:59:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: clock: qcom,gcc-sc8280xp: document power domain
Date:   Mon,  2 Jan 2023 09:59:09 +0100
Message-Id: <20230102085909.24620-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

GCC clock controller is supplied by CX power domain:

  sc8280xp-crd.dtb: clock-controller@100000: Unevaluated properties are not allowed ('power-domains' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
index c9d8e436d73a..5681e535fede 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
@@ -55,6 +55,10 @@ properties:
       - description: First EMAC controller reference clock
       - description: Second EMAC controller reference clock
 
+  power-domains:
+    items:
+      - description: CX domain
+
   protected-clocks:
     maxItems: 389
 
@@ -70,6 +74,8 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
     clock-controller@100000 {
       compatible = "qcom,gcc-sc8280xp";
       reg = <0x00100000 0x1f0000>;
@@ -106,6 +112,7 @@ examples:
                <&pcie4_lane>,
                <&rxc0_ref_clk>,
                <&rxc1_ref_clk>;
+      power-domains = <&rpmhpd SC8280XP_CX>;
 
       #clock-cells = <1>;
       #reset-cells = <1>;
-- 
2.34.1

