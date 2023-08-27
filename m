Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99223CA1004
	for <linux-clk@archiver.kernel.org>; Sun, 27 Aug 2023 11:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjH0LvU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Aug 2023 07:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbjH0LvA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Aug 2023 07:51:00 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBEB1B1
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:52 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50079d148aeso3519700e87.3
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137050; x=1693741850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRH0ltu/8xOeCYgi26zDqsTtGrYZ67tsC2xGcsHS4PY=;
        b=RxhZlklBSIEl9RVh6fYQFn+9GAm4251u+yLgcNDva21YfyRVnyg89P1GKiM8r3EsE7
         xNHpVp94uj9IE8WsXy1i0PWK/BdWRC/U8Z09YdZ9Jxa1O/QLsmNWX5GC6lDVETD8RH9i
         wp+7Izvl6znwQZC4zl+b2I4lJXmoBC5LMInw6cuEDY77bgGLnsl/Kea8wwYy/sWXa3sq
         hNHM/RZpB8ivOwin2pMrht71rA6fAfbGx9VX1ZGNI+CKvrZojpuD0MBwMyKA8WGDYjzm
         brAcZ7qAh2sXn2tY6yx0Pb7LFHnTeRJoHYjkhwm4J2P74t8fyKDqaxpOzZ7Oii4LoJ2v
         f30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137050; x=1693741850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRH0ltu/8xOeCYgi26zDqsTtGrYZ67tsC2xGcsHS4PY=;
        b=cM3pzWEjGVfD+bD/OOmd5U3YqhRRLrsJbJ+7O0A9Kzx18FACGYkF3tR6tBoLpUgSp7
         RnNGJHQlj+SolCKFbDTJNthc8n2xKqVkhaOasVWkgH+C1R5VPKyqPsmsOwMinMdjgzzE
         rVF5H3sMZstz0/0HjLh+ueL8YNbDPU5b/SWKs7/BcPI/kTw4tPnT7htzMyKFX2MSHiys
         Uaz1LOZoHI2iioJhPrQm6E/IHXhfwvyzzJLjX4EjZRrY5jbpWkZM3iCM8MGehPXfDpZv
         /Tkc8GEqQ61Upzwbnns5rf/m9k4Dikjzn6YXNUkgN5l0IjYDejG2pw+MSAFwCto/21fm
         w65g==
X-Gm-Message-State: AOJu0Yzsq1W5sPhYsRlDUmoILubQhXH813vfDokR4lPVXpXpk4f28W4a
        iy9bqDkgRX90SMqF21CpPBr9AQ==
X-Google-Smtp-Source: AGHT+IGf8NtA1/5vzI9NrBVDAVTtPGY5IUZYE/c+ypMVwosM5x6pFbxaoVYhp6r0hbU8e388T1CiNw==
X-Received: by 2002:ac2:5631:0:b0:500:771f:4887 with SMTP id b17-20020ac25631000000b00500771f4887mr14170938lff.55.1693137050416;
        Sun, 27 Aug 2023 04:50:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:49 -0700 (PDT)
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
Subject: [PATCH v4 19/23] ARM: dts: qcom: msm8960: declare SAW2 regulators
Date:   Sun, 27 Aug 2023 14:50:29 +0300
Message-Id: <20230827115033.935089-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
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
index f420740e068e..0ab340405784 100644
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

