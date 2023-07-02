Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC30C001DD
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 17:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjGBRnj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbjGBRnO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 13:43:14 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BBAE6A
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 10:43:11 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso58392581fa.0
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319790; x=1690911790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6xlLRk1fYN/CIBfPLrvf0p37P9WFmKE4yFn7ZJ/dKo=;
        b=pTQafm5Oj7ccSGVOVbnjW9wwbqZXwPWtKv+vOeoB++pPbZefHB8IsGDXyMg1CYdi/q
         vjcQea/na+3n/UGnRiFmQaoAYWLDBQyegWnQBfwS00p9U4DphA870o7mQNLlT5d8Xrd4
         01VNVw0xrl7LokKnrPyr+T6Fzl4rcqmu8m8EcO1lFHdykqzTx7eXgPe6w5VrcxhAJ+3g
         2bzeMtckFppvLadCuPr9RzJ6wnXEhTpCMFWO9R+S0/gUcukdgCNll7ZL4JbSO6hgusvK
         prtBaSPMMEwVidneD162uUMzt8ITDMcZb+yH5zGo4pCKoi44nUcxE0+Meu90KVAcZwIc
         r5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319790; x=1690911790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6xlLRk1fYN/CIBfPLrvf0p37P9WFmKE4yFn7ZJ/dKo=;
        b=G+dEZSrXiqfJ9TxHgzdhJhu3yM+CNZvMTV/AzI/u6IpQnbrKrrpb98vxfNpNkyu6f1
         Jgum04WxmJ/GpkX+T5spaXpq7SrMuwGPeZ12xwmq+c1couEBd8y2uSyff4MbG1GB0sIO
         J6VlfsF+geei323i7UxfYu5MSWzmKB4+mX5uzWAiIgAc7k/sR0Y1GzdbPAmioT7Bi+QU
         tfNtlV5Nr0r3eRnXJ+NM2cMED+cqZjsldJ8A+AcVrgOYwD4W1jLKQkEa545Ga8CBf2YX
         wy8m+tmplSH9lER3CjZjZJno6HKrsn1Mte3v66s8s9Ty/nSEYMIW7R9T73PbgI6jq77F
         lWCg==
X-Gm-Message-State: ABy/qLZxgWL800zlD5DKREdJI8pDDIYkc+0dIy1QdkDxujidfXsVBJsU
        Dz0WJW32os26cWnEgZoBtqt8bA==
X-Google-Smtp-Source: APBJJlGzUSqA8cgtTpQxgCces82GHZbYjOw4Td6m506DLn9qHglWl/yrBewQzk0QEhjY8H/aWqaiYg==
X-Received: by 2002:a2e:3a09:0:b0:2b5:8a21:5627 with SMTP id h9-20020a2e3a09000000b002b58a215627mr5172699lja.51.1688319790072;
        Sun, 02 Jul 2023 10:43:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:43:09 -0700 (PDT)
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
Subject: [PATCH v3 24/28] ARM: dts: qcom: msm8960: declare SAW2 regulators
Date:   Sun,  2 Jul 2023 20:42:42 +0300
Message-Id: <20230702174246.121656-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SAW2 (SPM and AVS Wrapper) among other things is yet another way to
handle CPU-related PMIC regulators. Provide a way to control voltage of
these regulators.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index b25cd58003e2..ba82b6ab899e 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -223,13 +223,21 @@ acc1: clock-controller@2098000 {
 		saw0: regulator@2089000 {
 			compatible = "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw0_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw1: regulator@2099000 {
 			compatible = "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw1_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		gsbi5: gsbi@16400000 {
-- 
2.39.2

