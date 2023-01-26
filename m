Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C514CC61DB3
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 23:03:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbjAZXDc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 18:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233260AbjAZXDb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 18:03:31 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9344FC12
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 15:03:30 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id z194so1191077iof.10
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 15:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQXELW2Do44btByeSJJTILU+sMVZVBVp+PBgWqh0iPQ=;
        b=nJw+DUTuQVLOvRz1HyscPLmtu2IerGNqddKZ1FOVXITdFDXtG4bbvVyjK343q2XMAh
         WdJ+QzKGM53Wepv6E3ojcLezJQuvDDeXF+XurvAjhINj8MUU6Gbw1AD3sPBZxK6QCk55
         GoANUAOcWSQY6AwT2VZZ3RUynOJyLTe5cTXA4oPrA6UetAByhIFJXBwfL6NYMMkBT1vT
         Q18mN13y4idZlUrMhKJNSRRQoh/bpRGJyZ9XfDV3IBQF77KMKD1XT+S2nHAMGE2SWAhJ
         ti9RpzbOxyCmNAYwV8fca4SZHUQtCFCPCAeBplogm1hS6zCEUIUdKD/v3fZSRiiHyvgi
         5Q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQXELW2Do44btByeSJJTILU+sMVZVBVp+PBgWqh0iPQ=;
        b=HWKsFcKLdPl3z2t8lnUhUsNqw+AuAU9QHfmJLRGBC7A6rVKSfomhXDaRNtzFzkzbEV
         YXntnUKLDjA6Z2ErC1lWY6+KmRFkTF6i8JwTz4+slKRCnn4Dr21Jb1Wm3kzuftlo91JK
         XWz9+URvEOrrKWCopWI8vXxXZt86/OyxvHGGbtM0ztbJ1GsD0ytXXkOhk6iUWotKo0UE
         4fAGe+yrNFmCxQMe1155ACu0vIzboNyklKdOnfkCFdHrhRS59bAHC/BFdNno6vRzGyeH
         z+02bR6paKRmtWbglW+KswwVvttuFq3HgMqTEtelZE8i6OqftE7qF4HvmMuwmw5jNPcO
         xY6g==
X-Gm-Message-State: AFqh2kqqpOAi8zvJoEYkqT8CW8yHrQonNengZAwxQgINmrCb2sCrV05A
        MfKdsIrtXf99EwYH/0jlj498tw==
X-Google-Smtp-Source: AMrXdXvphCStfkzdhH5mxfm28KLN/HVvq8n/TNZxgZ6w6uE1XwDEsrJLYnwCwxvmH3W0q6nw92XU6Q==
X-Received: by 2002:a6b:7210:0:b0:704:d931:45ec with SMTP id n16-20020a6b7210000000b00704d93145ecmr25938852ioc.20.1674774210025;
        Thu, 26 Jan 2023 15:03:30 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id l4-20020a6bd104000000b006f8b7d869a0sm670924iob.1.2023.01.26.15.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 15:03:29 -0800 (PST)
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
Subject: [PATCH v5 1/7] dt-bindings: mailbox: qcom: add SDX55 compatible
Date:   Fri, 27 Jan 2023 01:03:13 +0200
Message-Id: <20230126230319.3977109-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
References: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The commit 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55
APCS") added SDX55 compatible string to one of clock-selection
conditions, but failed to add one to the main schema's compatible list.
Fix this omission.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 943f9472ae10..36deddca1524 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8953-apcs-kpss-global
               - qcom,msm8994-apcs-kpss-global
               - qcom,qcs404-apcs-apps-global
+              - qcom,sdx55-apcs-gcc
           - const: syscon
   reg:
     maxItems: 1
-- 
2.39.0

