Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122DDC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jun 2022 14:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382911AbiFQOra (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jun 2022 10:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382915AbiFQOr2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jun 2022 10:47:28 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9C055498
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 07:47:24 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id r24so4992021ljn.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mgNG4CqobFmIv3cjkJhZdSr5JTtKXvysIj6GWq9VnJY=;
        b=JYXz7M12Jme+KdP6HJd2GEMmPFwsgvWz4mbBuuZqUn0BzbfnBIcw3+pQSPD4WxjWwL
         WRZ4zBgsdfu1e9BYfg4ZRPp7JrJ5iNjdzPNheGV2Ec2LYYflanTtfzoxMvBErhT3dkXk
         yJxgMoOJtoAdg6huoTylV+KPztCzyv8OCsuPhOlyCVwX1YTt76JOTesWCcbjGfT0LDII
         rnPWTA6ve5h8BAxvwdxJnTry0awH2VV6DySmHnZowUkEOWfpbzq3IFV6yDQzjEy95dmQ
         pv8MI6gHCkXWp5beBQX19JHH7bCracyTlPKIYk+egsz0a9VFSjijQaTw6mejMUcmWipr
         dT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mgNG4CqobFmIv3cjkJhZdSr5JTtKXvysIj6GWq9VnJY=;
        b=r8anz+gsyY/GYy5+VNnoagoLqCYR8i9acaqtCaZc/D89W64tpV1LCdZScTrM/hI09b
         yf91WRCUTwTcQYuapz2/MINgyO4nueIoGum3YtwfJsOmYc3FvUGv7hmmPmzyklffLuNx
         5JbWQwB3Fc2xKbGcnowdIvq3iVFkclzErksi826KC2zmkyDibCVuILKmunmsHQiTbEqM
         iQp2oQbbqPqzmAKXvPvXiFh8MB6ab/F+gt1K7GdMEJZIaCzGZhBOyL25vLB1FrasgTmL
         jArOEKUI8kqr88xdNdlXcUaK3O2dnvJ9I5/0WqdtOZW/toiKcc9siyVWypjV0SCzK4H0
         ErDw==
X-Gm-Message-State: AJIora9oHns67sHc3qf9B6WGdmx2eqDZUfkrPHI0jic/zCK9QAEk/TFX
        nMr90zskKJtPKoZUVE6Sn6nyEA==
X-Google-Smtp-Source: AGRyM1vKcC9xieLk0VyIjGbVxtuu47UQXS1H89cTn6YdTS9kaPmiABFNRn1z36dXd2QDR3O3/FpaSw==
X-Received: by 2002:a2e:b8c4:0:b0:258:f008:5b75 with SMTP id s4-20020a2eb8c4000000b00258f0085b75mr5298965ljp.189.1655477243281;
        Fri, 17 Jun 2022 07:47:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5-20020a2eb165000000b002553ab60e17sm571867ljm.122.2022.06.17.07.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:47:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: qcom: msm8916: add clocks to the GCC device node
Date:   Fri, 17 Jun 2022 17:47:14 +0300
Message-Id: <20220617144714.817765-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As we are converting this platform to use DT clock bindings, add clocks
and clock-names properties to the MMCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 05472510e29d..e905415b3456 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -934,6 +934,20 @@ gcc: clock-controller@1800000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x01800000 0x80000>;
+			clocks = <&rpmcc RPM_SMD_BB_CLK1_PIN>,
+				 <&sleep_clk>,
+				 <&dsi_phy0 1>,
+				 <&dsi_phy0 0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "sleep_clk",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "ext_mclk",
+				      "ext_pri_i2s",
+				      "ext_sec_i2s";
 		};
 
 		tcsr_mutex: hwlock@1905000 {
-- 
2.35.1

