Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBC4CA100B
	for <linux-clk@archiver.kernel.org>; Sun, 27 Aug 2023 11:51:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjH0LvV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Aug 2023 07:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjH0LvC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Aug 2023 07:51:02 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AABD1BF
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:55 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bbad32bc79so34575831fa.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137054; x=1693741854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iFr5ykSW5K/n9AH6BnSCA7flwWQ6QIykUQHsbJGtbs=;
        b=ef2gEVG/82XfG0mQrkVAAmk+eVc0NES2QamcfKNnCe/G+DSeRCe5NTwjoITMyTJScN
         L6FfeR4M3K9jC/nwVhPbzg7WVLI9MC8nR4QulC+GhBdfhdIzMT4zfWcMJXl3NpyR9uDf
         jMPsVMQpnVz1zB2cUffBSMQk67RHAVGOVVppiEToaKqM/BAeCuyjLH4atdY6kEecaeyl
         jZGE8lgICQrBeBPRZ/5T6TrN0BjGbehi0t8iaMFi44CfbTPvxzKk1GZDZ8v3ShhhfBIN
         7p6xiwds5Rjd4WnMbjWBQ0OY8HypUPkinAhrr+mmy+02JRf8WvfMGZTlLL4tG6XlqHjq
         EgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137054; x=1693741854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iFr5ykSW5K/n9AH6BnSCA7flwWQ6QIykUQHsbJGtbs=;
        b=Obayhny2P5d4sNVbivTwkUKQ+mHzPgAsl8lFKme5zIATp5aspTTpwT5FqFQT85u7S2
         J5oZlNkpZ3DSoBeyiEy4HKZp3avDexy+jmVgZzJ/dx/0ak0NnNCw485B1GZuO4C482c7
         kA2bR5P6KkC1Q+OnR5RpxmomDbYk9hwBk3T3gNGfzbwoPSwH7vh6onnhp7DlOJmKjHQy
         /Xt4VM+UFP4sSLKeW5gmf4T02cmJrhc/OQhePFSAeZOGFRhB+XFeUspQGV6YDJ3cU4A8
         Q5O0b1Etc5IeUJogjcKEFFQ3f7xHVcJIhwTSZ39xA3RwNqzGJD7fNp1cMipH7asitelL
         sjbQ==
X-Gm-Message-State: AOJu0YyytA0VdPVjXP1OZLVo+PawdHReeTBvzZDzKjs9G+dabtKrVybM
        pKMa3qrdPdvEVfUJVmEcpnUruQ==
X-Google-Smtp-Source: AGHT+IFPncuxEc70hypPWOq9OKWCCPeTxvJl6mRRrmle+JQxUrnM6ogihzRMYLvrTliBMvOHP3qLeQ==
X-Received: by 2002:a05:6512:470:b0:500:aec8:cac1 with SMTP id x16-20020a056512047000b00500aec8cac1mr3026380lfd.26.1693137046513;
        Sun, 27 Aug 2023 04:50:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:46 -0700 (PDT)
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
Subject: [PATCH v4 14/23] ARM: dts: qcom: apq8064: declare SAW2 regulators
Date:   Sun, 27 Aug 2023 14:50:24 +0300
Message-Id: <20230827115033.935089-15-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 2f94d26fc792..ba7d5ef8de17 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -368,25 +368,41 @@ acc3: clock-controller@20b8000 {
 		saw0: power-manager@2089000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw0_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw1: power-manager@2099000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw1_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw2: power-manager@20a9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020a9000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw2_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw3: power-manager@20b9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020b9000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw3_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		sps_sic_non_secure: sps-sic-non-secure@12100000 {
-- 
2.39.2

