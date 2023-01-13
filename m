Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8140FC61DB3
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 15:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjAMPJ2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 10:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjAMPH5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 10:07:57 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D2891505
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:59:03 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ud5so52963979ejc.4
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XU/dHO8DVmGPpqkb7r01X1pAdFG84fFdf1WtxGiiHvQ=;
        b=ARnoDLgerC10W1udjRPEt/GqBBzqwMsZyw7cRxy9pAmrdaWhWipPNrxDp8DBWRpYG+
         Iea+vxk4XoiUXFG//j9I13kfV+No6IlbMzurvbDOSa8gJIJ7jVIhkQwtRNZC2GtD/WQl
         79tRkeKdEqvkoIvDjk7Eg6qqOwqxqDhh3dkJHf/2TMxpGesmbtrczYR68uFVNXqOd7Mg
         9vvQ/zaF+WdZCC567si2DOhLTihqGrCKEIJ/GpoR+zyrxB4HLBzDz28JUWXMonFTufTi
         tzrEcMZoHzRylV3/dN2XRl+t+JSa6Mg/8+Cn18L2q7Lqr8VfmriCR0tI1KaRlhtW1+L0
         nZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XU/dHO8DVmGPpqkb7r01X1pAdFG84fFdf1WtxGiiHvQ=;
        b=e4wcCCErbBSN1rtLoCKeOTa8Kaa7968U6xjM62VydnYlj7XeY9JSeojWsdbNaBxyvC
         Snbj66tNdAKdpRR19z2aQYm7dGouRAMk6KvwWo469ISNeXEjFEzGtoO8he2EFxpENRMk
         wDrIFr/IY10b939WLQkpatY4u/Nimdn5Hx20N/9tIkXrAAsfixPhrlCzq1mYib3t6pJZ
         LVyL8jQX5hEfOxD/XzHMZlgLCOuJYrMqB/OglEKehM0xSUX1m8wP1OEQQGwaUyynkFEQ
         hupAVrfeg6jBE9C5aVNRLLkmbT3/QPg4NRrQ8N0kmNg+wxMQAyiWS2mbNfimlE8xUfHB
         XWgQ==
X-Gm-Message-State: AFqh2kpyAy5qTj6UYS8VTADr2SL/n0kaabtxdIQBlmzCGhYnurfgPNb2
        idkZ39g64rhMkvrtN80kYFBKvw==
X-Google-Smtp-Source: AMrXdXvQMbq4TsL6YlyMhhJSIvA4tsjszzryU1CY+N0v6fsjTiGu3umfQ6d6YPAX7S+tZ+ikL7UVbw==
X-Received: by 2002:a17:906:2813:b0:7c0:f9ef:23a2 with SMTP id r19-20020a170906281300b007c0f9ef23a2mr84066794ejc.30.1673621942178;
        Fri, 13 Jan 2023 06:59:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f1-20020a17090631c100b007aea1dc1840sm8621468ejf.111.2023.01.13.06.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:59:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: clock: qcom,a53pll: drop operating-points-v2
Date:   Fri, 13 Jan 2023 15:58:59 +0100
Message-Id: <20230113145859.82868-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CPU PLL clock node does not use OPP tables (neither driver).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 525ebaa93c85..6bf70af948d7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -35,8 +35,6 @@ properties:
     items:
       - const: xo
 
-  operating-points-v2: true
-
 required:
   - compatible
   - reg
-- 
2.34.1

