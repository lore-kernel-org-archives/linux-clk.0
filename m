Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28A5C54EAA
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 23:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbjAZXDm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 18:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233312AbjAZXDf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 18:03:35 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFB2589B2
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 15:03:34 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id q130so1200731iod.4
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 15:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60xbViVesinnCs8Gq9usNvmq6jftqqElQdF+JDe/eCU=;
        b=tWTI6bI6hZY8GKUxqEourUhIoJzGkInywP019Kc+1c/UouuWQXNB5z/ULI4PqMaJmq
         QJbV9rYsSN51haZU0EXpb237eM4Tpyzj+lpAebR5TGJwAL+TkeqbIryYZGWew5gaQiFt
         F2icF3dF0C/N/fkcjmypIcFmPjSny/jOGw/o54TQXiKWMXufecNZ4MttUOt2IyYNFaSW
         L3YNK38rCA/5P4Ci3fIaBOraV26ATBvTJr18GYNmYHoYS28J6NQPmzxP4sdx3bdrwgNO
         4rV/oYxfXjQfgs0tJyGoMcD0qtvFrtAihxJGVgVkDWIGrxVMoY/JyCljLuPU4ULHQ7fF
         ngcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60xbViVesinnCs8Gq9usNvmq6jftqqElQdF+JDe/eCU=;
        b=Lo7d/PyWQFTM/yNq5fHHl2iZ+Q1rk74mfz5twAsUtAULGov++QCl8sgs6AT/M83TIg
         1qRWhvZ/hj1iwCG27X8vV3e2dJpeUZdC6l2h/hGzaHSVoD3W5IXFGC0qghfyN6lrS+TG
         KzL1v0gUb+jxjtDsg9LLd/HjetjgoIFbwrBDVJzEyx11oQ4e8oSHx6hw8mbwbNtKJL2d
         6Hj+vzaOtXWJ5dmWz2KK4O3XcylEDXz5fuP1pz9buxSSi1ct7P8toDRceavmzFT7vCcN
         bI4T0RAthDHPlrPQYPlE8Sv3zlNM+9kNM2gEi6O5KEsONB3J1Zs9qlTMuhkonfyItXKw
         Yz8A==
X-Gm-Message-State: AO0yUKV6fxA74BdQqn2EioCRA6d3RQm7PnIdtkWTdx0HY/YcPYIHW6Ww
        pPccfQXejCU6kpXow9ZRbZbtdw==
X-Google-Smtp-Source: AK7set9QmGuL4g3+bJHs80N+f87Y8dv1O2X1wGPkwhEF+Iy0Oe+D2el+Fwqjt5SHhGQrYi8E5Ep4dw==
X-Received: by 2002:a05:6602:341d:b0:707:f268:989e with SMTP id n29-20020a056602341d00b00707f268989emr8918107ioz.16.1674774213988;
        Thu, 26 Jan 2023 15:03:33 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id l4-20020a6bd104000000b006f8b7d869a0sm670924iob.1.2023.01.26.15.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 15:03:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/7] dt-bindings: mailbox: qcom: enable syscon compatible for msm8976
Date:   Fri, 27 Jan 2023 01:03:14 +0200
Message-Id: <20230126230319.3977109-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
References: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On msm8976 platform APCS also uses syscon compatible, so move it to the
block of compatibles using SoC-compat together with syscon.

Fixes: 60545466180e ("dt-bindings: mailbox: qcom,apcs-kpss-global: Add syscon const for relevant entries")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 36deddca1524..ecc286ab49ef 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -20,7 +20,6 @@ properties:
           - enum:
               - qcom,ipq6018-apcs-apps-global
               - qcom,ipq8074-apcs-apps-global
-              - qcom,msm8976-apcs-kpss-global
               - qcom,msm8996-apcs-hmss-global
               - qcom,msm8998-apcs-hmss-global
               - qcom,qcm2290-apcs-hmss-global
@@ -37,6 +36,7 @@ properties:
               - qcom,msm8916-apcs-kpss-global
               - qcom,msm8939-apcs-kpss-global
               - qcom,msm8953-apcs-kpss-global
+              - qcom,msm8976-apcs-kpss-global
               - qcom,msm8994-apcs-kpss-global
               - qcom,qcs404-apcs-apps-global
               - qcom,sdx55-apcs-gcc
-- 
2.39.0

