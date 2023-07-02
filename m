Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3711C001E0
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 17:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjGBRuw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjGBRuv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 13:50:51 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6A7E66
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 10:50:48 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so5827957e87.3
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 10:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688320247; x=1690912247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy09Ud9yIKr2AD6oCCkzQftGXcApmZOlk4F4PzrOzkQ=;
        b=qf6bQlvu+X4t1s7SNpdHOTeAiXl3d0m2BzqbFCUP6nnzLj4XdsQS417ahnFbtHNHnv
         2oacuwRNDxZwU6Qd2nP2qUI8L1x9vgqRSjdh/Sr8QqztBBnA1iqoq0WCevMY70C/X6SB
         lyI1a432fsjwgq/doPLfv9fqBvhrXeR1RVH1P68a3aM93ftVKfTP99dn380YXfO7lsVu
         CAyOFGhLtLWcxFUGyv45ozppt1BSO2pJbyfq8TKMLrgwqPoCJEw41c9mHjpcJO8dyOak
         jCSqPVQbXOMaDkP+ZqJuYL1GtOwoR96UGZX1Jcd8aDfna1WCgftjMtrJO7CP0vA481te
         vJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688320247; x=1690912247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy09Ud9yIKr2AD6oCCkzQftGXcApmZOlk4F4PzrOzkQ=;
        b=SMzDZ0OIB0b0o366hoF3cDYbhQ9nTIWmCCaH+tIL13heIgOW5HqpIL6qi2nWV54U4V
         f3Zs9mgedi3DIyH0+FDLRuEb98C6LiqZ1yvNusP/Wu5CLF5QZWIy2b9UocNtK/rMr4qx
         C+SMTmgn1IUgQ9EtDe0sUle86gpKf7l8TmqP7smTrP/h+mB2LMUx+Mx1SvVXb55M6NbN
         qVb5UkfQ2UtM+c4dnuBfAgfA8CJT46zinz7J5E1HsxaRnFGd4SDABPNmWYKWtXlAK5Al
         u3ZicygArh3izB0724NDmVVky5RTkka7072nD93bIPcsCwNkHA/s1PBs+/SBYGrLBsuX
         BtvA==
X-Gm-Message-State: ABy/qLba851mpbN/cHwfTVasHvu8oeVYFKnqIXpCP74VYibn7MnyiyNM
        viS2AdJdGENge3ds1L/H+HkwsA==
X-Google-Smtp-Source: APBJJlEIez/j04ndZ+AAM08YlJA0Kf6p24z1WYVdIzR/FQeQGtQ3v0FWV8YTRcMBbGKqeODAr5mmVA==
X-Received: by 2002:a05:6512:3242:b0:4f8:6b82:56c4 with SMTP id c2-20020a056512324200b004f86b8256c4mr4642616lfr.33.1688320247228;
        Sun, 02 Jul 2023 10:50:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac24c81000000b004fb759964a9sm3354130lfl.168.2023.07.02.10.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:50:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [RFC PATCH 1/8] dt-bindings: nvmem: qfprom: add compatible for MSM8960
Date:   Sun,  2 Jul 2023 20:50:38 +0300
Message-Id: <20230702175045.122041-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
References: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the QFPROM compatible for MSM8960.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 6cd4682a167d..d8d0423e8fee 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,ipq8074-qfprom
           - qcom,ipq9574-qfprom
           - qcom,msm8916-qfprom
+          - qcom,msm8960-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom
-- 
2.39.2

