Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02269CCA481
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 21:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbiFSV0D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 17:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234783AbiFSV0B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 17:26:01 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B1BAE41
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:26:00 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id c4so14365254lfj.12
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mgNG4CqobFmIv3cjkJhZdSr5JTtKXvysIj6GWq9VnJY=;
        b=s0KMIc9+Eo29Hz94u3DVPWl2jKS80lBkD8M/KQwfulYJr4wZ1gTlTic8LGYD4Sf/Y0
         qia8qqXA5OQtAM5XOPg/SPXG9diNxiC84BJBZtXohpKmbUkdu9mkUhty9qNiwkkBRD5R
         AT33yH33Enn9lXpowLmQnA3WOcZpoSH17oYEHGhvGKF9NxIf4HmZaD7pyPXGsFrXPl+e
         JZ2O/SMUnIwlOJucMRxu3C84X/QaefBlD31fzSuRXseOu7TZjWMCWUPXy2uMkq7r1Wri
         r2fOOgIqvvxcPcTZi7u+GqDBcCWNPV3LjdnFJh2eR5Qge0lN8bI7/OzAlUqrjM10WloO
         Knkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mgNG4CqobFmIv3cjkJhZdSr5JTtKXvysIj6GWq9VnJY=;
        b=f7DS9j6EMKQllRl03K9Q50aO22WVuy/9rjnvcUWsWR6kPXCMsq9n6ZjaJ07XaUUXq0
         MNeGvMmdS7RTvGEhB0dwFROVRIi4ppBcn+xrmWG8HyWmeDzGmlOkcCXIVAC3Sjq1P+/U
         dn5R/PLzAf5oMbuPLxge+jE3H9NhnJidJOCUV/kE+OrGufOYb+OOAWuZv9VsQzlymaxd
         YDYOX2Jgc7lWrYChC+c842gSF8b4DLRdqzLP7SmO6QBCJUbzU3blfY7a83J070H9AU7r
         bi1ePJAY1N9nmqnrhStI3jvXlsF2OQqYVhqQKDQlxacYSsR7np8hofeWi2xNxW8b/A7c
         qJFw==
X-Gm-Message-State: AJIora/6sBrwKSqQOnUfvidacv2E2fMynh/+kpPq1kpNsjzFBLFWIEeP
        ZgAl23gkxqVfKpVVsE/S+a9ARw==
X-Google-Smtp-Source: AGRyM1sLUaSI2w7lpsyGmFlTdfSL2NBxf81GzHNNJ1hv2G64VYnhNsg8z3XZmoVAmDXrJCpEgtTkEw==
X-Received: by 2002:a05:6512:11c3:b0:479:5b9d:6174 with SMTP id h3-20020a05651211c300b004795b9d6174mr12029377lfr.75.1655673958820;
        Sun, 19 Jun 2022 14:25:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u3-20020ac258c3000000b00478de10cf5esm626866lfo.247.2022.06.19.14.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:25:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 7/7] arm64: dts: qcom: msm8916: add clocks to the GCC device node
Date:   Mon, 20 Jun 2022 00:25:49 +0300
Message-Id: <20220619212549.1240891-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
References: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
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

