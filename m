Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1EDC83F23
	for <linux-clk@archiver.kernel.org>; Sun, 27 Aug 2023 11:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjH0LvR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Aug 2023 07:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjH0Lu4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Aug 2023 07:50:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773EACD5
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4ff93a7f230so2761853e87.1
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137046; x=1693741846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+5JyGg/RVsbvystfdqTjelqQjEsUcHgseGOGd0sd2A=;
        b=aSTNedRj9jCe9y3t0hQnZaMJKHOiM0JuipUnX25XmiichKI6Tfjv9PE7skbef6vDa+
         xWwqvtfP2znXpUE2t5x1T4/rxfpUnayLBxI1+aiKgCrwSTxPGH/8SgXxP5DqLW9F0WkT
         FrBZJk+sDiO66q1XRPkDEJzrFcwSNW5QsxQBKAy+HLC5if2hmeb/zlst432oX0I20Ioi
         bKqNGSjXccv/c4lTuC1NfTacWyfd0Ezj/DnvBnl9jSQUDu7IOfcdrNtXlQikfpOdMdju
         PfJ4p0ddG5blYbqPPXo94o67P+4FoSKjKjRleq2WMP8WPOphB5qAwmeSBCbBNXL3yCfR
         K5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137046; x=1693741846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+5JyGg/RVsbvystfdqTjelqQjEsUcHgseGOGd0sd2A=;
        b=hYO+0XsrOPD6XCNQV8bfSX+bEu5+pdGOXKQr1gy2ThHCnBLEE38v7notOhnunOn33u
         wejt8XYfuO//7QHmOMEPZmgayonHKn6bjCXTRd6CZMZ1RzUSITj89LZ/QMBjZYd5SDJO
         SMXm76hpkqwL9LIAt/Sl45ONKs6/rBdMup6v58cyuvpSX2ELrg3DlA+KY0Kkf3QwSmai
         mGu3LX+eUqd1+ZaRYMgxFDG3wThoUAWhzIyzUkPTwJ7JKFKHeVi26iF4AJGSj1kxSHJH
         CeJ5LLJxdCHJTLKF+3/wSFj7D3m/88cTVTfJyN2IICcFuvSkPy7eeH8GB0zIh/Grp9Kj
         TffQ==
X-Gm-Message-State: AOJu0Yw2d1RcKidW4RIle7BOKxzSOlaKSjXSwBR5GI1VV1xU+Rtnf2i/
        3gtylkCtVigq15QwvUPnPUz1Cg==
X-Google-Smtp-Source: AGHT+IERPpheMJF2+A8ACb1ozqTwHyIWBqnIUx7wppUVgi9tjaJj72nweT2g1EdhwLJ0NbJZJNpCOQ==
X-Received: by 2002:a05:6512:3d01:b0:500:a6c1:d8e0 with SMTP id d1-20020a0565123d0100b00500a6c1d8e0mr2395379lfv.22.1693137045746;
        Sun, 27 Aug 2023 04:50:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:45 -0700 (PDT)
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
Subject: [PATCH v4 13/23] ARM: dts: qcom: apq8064: rename SAW nodes to power-manager
Date:   Sun, 27 Aug 2023 14:50:23 +0300
Message-Id: <20230827115033.935089-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Per the power-domain.yaml, the power-controller node name is reserved
for power-domain providers. Rename SAW2 nodes to 'power-manager', the
name which is suggested by qcom,spm.yaml

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5b7d2c6f0ce9..2f94d26fc792 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -365,25 +365,25 @@ acc3: clock-controller@20b8000 {
 			#clock-cells = <0>;
 		};
 
-		saw0: power-controller@2089000 {
+		saw0: power-manager@2089000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw1: power-controller@2099000 {
+		saw1: power-manager@2099000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw2: power-controller@20a9000 {
+		saw2: power-manager@20a9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020a9000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw3: power-controller@20b9000 {
+		saw3: power-manager@20b9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020b9000 0x1000>, <0x02009000 0x1000>;
 			regulator;
-- 
2.39.2

