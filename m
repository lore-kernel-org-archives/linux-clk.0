Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DBAC0015E
	for <linux-clk@archiver.kernel.org>; Sun, 25 Jun 2023 20:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjFYU0U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Jun 2023 16:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjFYU0R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Jun 2023 16:26:17 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0599910C2
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:08 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b46d270ea1so36348051fa.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724767; x=1690316767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77d+d36KDkZJ6tRGLwEY2Ux3Xp+jyLxcEE3RlyjNnBw=;
        b=MJGUwU4csWft8gwY9EJC4GHGrYyX/vKLSqxL3D927k67Pwk3efZvimrtJgIoXQYd8M
         vBtGc6DejbION5Nl/fKaRox3bZ+Hop0MolxyeyerNtTS5aEGwh9VSklf9uvl1QV4exQn
         Q2W3i0EfINlMMMNrUJ5HMtfg+/Zossia5RowRM+Zrl/S/jCmVQIuLgjLmr6Bn4c+yo6Q
         bk0yoOTZtOyfzK8MDnARqlNdZHrO+UJukQbrIRneJ26h2tyY50L2/l4tVNGmV/5cjfc+
         D1lQDtHRMTKh5/X/OB6OBYKxyy5J0hyw1n3LD2PC3Z8IAYaQDj5pUJoBQIdEA7nsjMa6
         It3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724767; x=1690316767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77d+d36KDkZJ6tRGLwEY2Ux3Xp+jyLxcEE3RlyjNnBw=;
        b=i+dqCdJkEDnx/Oytbn9DgoCZ7LpU1StYxVEZ85RO9I6klnXT7g81Se8EpvLwk673kG
         v94dR/H9dQj8SqguiEuViPwOTY2kDJATT9rshiFFUpG/PDPTw5aTnqRblm4spHC0VjCU
         pn2yxT+aLW7EHIIrvb7Pg0pNbyd5aqTJmIbTakkknB38FKyhJ8S3xIwt7WCQ/hQrXrgM
         1koLsCyYOsmu0rHlLMY0TNhgnUjmfCfgY9Kz51p7tf67MxI4bIjeViJj4c8UHG/ivhS8
         EaPqU8xVwAYNPYU7DWeUpwo7pXS/yvW5P+ZeRMrCakSjnH1sY2nR3Wi2uB6AN0GL9LJ9
         Ie9g==
X-Gm-Message-State: AC+VfDz+bwBQsqthHZCbenOkS4DSjM37WFCMEncwVrRwiz4vYWWE6Ed0
        hY7opC3mikXg+cdM8BaWe6JJtAnZYo1BoxSNv/0=
X-Google-Smtp-Source: ACHHUZ6UOX37vIQM2BQ6tIOcTtFsFUySwM68LzB8NeMFXoHNq8Fk5PRtssY25xmAChM3kT5Sdujpfg==
X-Received: by 2002:a2e:740e:0:b0:2b5:86e4:558e with SMTP id p14-20020a2e740e000000b002b586e4558emr8355931ljc.38.1687724767234;
        Sun, 25 Jun 2023 13:26:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:26:06 -0700 (PDT)
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
Subject: [PATCH v2 20/26] ARM: dts: qcom: apq8064-asus-nexus7-flo: constraint cpufreq regulators
Date:   Sun, 25 Jun 2023 23:25:41 +0300
Message-Id: <20230625202547.174647-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add additional constraints to the CPUfreq-related regulators, it is
better be safe than sorry there.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index c57c27cd8a20..9f5d72727356 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -218,9 +218,9 @@ s1 {
 			bias-pull-down;
 		};
 
-		/* msm otg HSUSB_VDDCX */
+		/* msm otg HSUSB_VDDCX and VDD_DIG */
 		s3 {
-			regulator-min-microvolt = <500000>;
+			regulator-min-microvolt = <950000>;
 			regulator-max-microvolt = <1150000>;
 			qcom,switch-mode-frequency = <4800000>;
 		};
@@ -301,6 +301,12 @@ l23 {
 			bias-pull-down;
 		};
 
+		/* VDD_MEM */
+		l24 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1150000>;
+		};
+
 		/*
 		 * tabla2x-slim-CDC_VDDA_A_1P2V
 		 * tabla2x-slim-VDDD_CDC_D
@@ -329,8 +335,12 @@ lvs6 {
 		/*
 		 * mipi_dsi.1-dsi1_vddio
 		 * pil_riva-pll_vdd
+		 * HFPLL regulator
 		 */
 		lvs7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-boot-on;
 			bias-pull-down;
 		};
 	};
-- 
2.39.2

