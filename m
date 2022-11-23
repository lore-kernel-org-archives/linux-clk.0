Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7436CC4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 14:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236185AbiKWOUr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 09:20:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237882AbiKWOUg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 09:20:36 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86E7663CD
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:20:29 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id n3so13044941wrp.5
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nwk9ZDzj4f3oCxgYA9516gm4S6RtG9ILhUbfQ8JxHU=;
        b=L+3PEVfkzTMurgF1Pq7oMkWjcR9izDlB4cs8rfzSJsWA4NIpZfxFU5gWxxrODnks2x
         vW3ThKxGMiknEPCrm3CdvJNiVafl9fe+GAgniVVOc56UJl36U5RV57H1hLuRkhIPdy82
         jaQwNJ2A8jEKjVMaqxejUPuS6YhQr8kY27BsXQguKDpXcO/vx7HEF7t2kBf+ozDxnDCP
         qludLvDXwOFBVs5E0EcnJfCNARS+BoZkE60kuNMEQx+zMx2Z6+bQnA4aoNvgbRViGoph
         wfH/CWlp+IfOhzHWwVP7iox97ddvJIpwx9M4G3hKUwRG/w1J2HfeLl7slH2sASkMMzQi
         L9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nwk9ZDzj4f3oCxgYA9516gm4S6RtG9ILhUbfQ8JxHU=;
        b=rrSQtrLESgq4lrrvJdypvTYIGsooh4mcBJHz7FEa5tAWYnQIecDUeAOnw45nDQqtkO
         /chvDafYGHDKFijQkLpmHFFuvbIhwlLdfpUHk76hEdkV+rhZeWrC55d6GrYC5ympRKD8
         0bB6elkJPjs/dRz1qZZvp2fkw4JHZDi13VPDldRPH5JIhZTmBHtmDgPVoThTfSm9sgTf
         +8vrP8Fb5W4sBjM9gtQ/tWeWBqsLN1oK9ZhdrGwBLP3adC/mYb/iZiyuwndFHIS1Sdjl
         XMmGPHl76nVOP/Rn1C4Rbl1IxpE1v8sKjv8qwEmQ0AgUtEiKNk4PsI3FxZoZNlgzaTxL
         XOhQ==
X-Gm-Message-State: ANoB5pnmViafUdLr99jG1Tn2k+dKvKWc7R6tdWaFwmOXWrFcfw1vAuAP
        W73qEoUV3nvt018WAA2n7elFSQ==
X-Google-Smtp-Source: AA0mqf6iufSGN8Siv1QRRTblUjizIyXG9xaOU3+bcfaQifjisr+JO/GIClkcMtgfMBEhRnIOQER1MQ==
X-Received: by 2002:adf:f3d0:0:b0:241:f721:3ba2 with SMTP id g16-20020adff3d0000000b00241f7213ba2mr921857wrp.681.1669213228394;
        Wed, 23 Nov 2022 06:20:28 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b003cfd58409desm2837438wmq.13.2022.11.23.06.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:20:27 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 6/9] dt-bindings: clock: Add RPMHCC for SM8550
Date:   Wed, 23 Nov 2022 16:20:06 +0200
Message-Id: <20221123142009.594781-7-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123142009.594781-1-abel.vesa@linaro.org>
References: <20221123142009.594781-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings and update documentation for clock rpmh driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes since v1:
 * dropped redundant "bindings" from subject
 * added Krzysztof's R-b tag

 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 437a34b930e3..d465dd691107 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
       - qcom,sm8450-rpmh-clk
+      - qcom,sm8550-rpmh-clk
 
   clocks:
     maxItems: 1
-- 
2.34.1

