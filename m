Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E90C18E72
	for <linux-clk@archiver.kernel.org>; Sun, 25 Jun 2023 20:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbjFYU0Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Jun 2023 16:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbjFYU0V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Jun 2023 16:26:21 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F37E54
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:10 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f96d680399so3180300e87.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724769; x=1690316769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x8ZUoWpxa9r1cAw/Urm1Fq8ospvaA77mmKnj58hx+A=;
        b=lkhqRRhaId1+fbUnNm8uMIjIIeodv/0pwGqmfPIll+FGFZPjIPD4zB3v/ZkkRNHxrL
         ut8mxWqb8nwiMJ52OWmyXx9p0opqy/I0cj7g02zq0i60qmruBvk2V2DAS1G62rJg0Mt9
         Cfa/juZPY/drDVUEkNHVjG4GOPb47bYWOpqNiqwxzIFKpGhXvglBA0kBy+INLzmsOvJV
         OAnJWJCyxHk0xtbckgVdPRxXr2qz3Au6yja5K67p3IZ0zvzoDe1lFfjuqm0j2nk1ZcUu
         PqOFnAV4LWTW9mhD+e3+/9VoTRScOqZ9nc1KA7Vzk2iMXeUdAX5unLvc/6yAFaCrRh9p
         /A+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724769; x=1690316769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7x8ZUoWpxa9r1cAw/Urm1Fq8ospvaA77mmKnj58hx+A=;
        b=QCT2a7uv2Bmznra7nagnwxHcmWQVCqjWahs4odqZ25aF61SF1tjvLOiA7ZQsi6V16G
         czxBHBVshkNBtSnzFHsfNsOPhgy4Fv7ryHjjvQNZlDK5t7r1Ib491N2BmuBYjWsyEoUT
         VxncT+D2jX1sxftPfOPdWh5pamZnny0VLQnMvRpjPbR1inzg53Kj2MKkC8dIBBDXtPbJ
         izXgJ9JXCYcDfSZvHn5csLYKjyYlIcqxlsVT4OscyJcqkJa49aQfusY2GqDzUFCH80/p
         h2Ojo2E1k4l28qncDq63yyVXwXgAjB0B2eYjUruIRrnETLVlykQnUBKFfqTHS5Y8z3Lg
         exVg==
X-Gm-Message-State: AC+VfDzXLcQmBlRdHZ6zdxtAczh8gvBa5r1K27UQXqkOhbvtWnTQu5zr
        4krPoSMG+k2OfFE7SGAYS2TOYg==
X-Google-Smtp-Source: ACHHUZ5XjeASG5nUB0DbX/IzMVaJHVKgs5sHkFrYuBE2nlr+YdkMA9u4/K8F3fEDH+ZGO0xR/zNH1A==
X-Received: by 2002:a05:6512:32d3:b0:4f9:6528:fb1e with SMTP id f19-20020a05651232d300b004f96528fb1emr8150780lfg.51.1687724768852;
        Sun, 25 Jun 2023 13:26:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:26:08 -0700 (PDT)
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
Subject: [PATCH v2 22/26] ARM: dts: qcom: msm8960: declare SAW2 regulators
Date:   Sun, 25 Jun 2023 23:25:43 +0300
Message-Id: <20230625202547.174647-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SAW2 (SPM and AVS Wrapper) among other things is yet another way to
handle CPU-related PMIC regulators. Provide a way to control voltage of
these regulators.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fa2013388d99..50a5d87e9851 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -227,13 +227,21 @@ acc1: clock-controller@2098000 {
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

