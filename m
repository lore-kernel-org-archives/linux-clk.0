Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B038C433F4
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 595AB619A4
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236586AbhCXPUR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236581AbhCXPTj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 11:19:39 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08C3C0617A7
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:24 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u10so30711006lju.7
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uOwO8iANW7saI2yo/rKV3plq3B/8JH8KOWGKGoDTU2M=;
        b=HSrTD8Xdjt+QEKCvw5WgkS71Vcl/EUopfIf3Af5r8fWOFz5Cym7/FQ+BFQIbmz8GFm
         cx296qZIIxdNR+2dlViqrjUNR3z6Ny7uz1sRisaFEpwEZL36NaNh6HQVdamNVdDzYEXF
         Ou2rzif4QfT4B4Dw22StjRHcQzPJCR0NSZ/TGTarLcPlvTEBDDQMnVdHqagDh51mfDBR
         KK3H86b9Dp5r4fZnexUoHrDBp9KArCKfj+sDZhBejAl5NfoNc/VLLZOQgKWcwV+xE/58
         Y0bOgbHVSax9IPD4RGuNie0gL1y/QMv60SLXAj9nKUyvgapz5z+gUlaJKH9llFBMXT2h
         Pvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uOwO8iANW7saI2yo/rKV3plq3B/8JH8KOWGKGoDTU2M=;
        b=nakrhdVvDhL2GjMu9g5nO+padwCt4vL6Urnql4uBWUrWguVC+SNx4BAxff6/3GzTh1
         m4Rt9juQ7X0Oty0YAPo34Mlj5LAh8wJYzqSDh6upvkT5iLT8J8ZpW9jFNyQvJuZjQOuW
         zXGTvay+WwurtCWE1+JjZNDLodM5naLr26uTI6U7QNucZqB+9nvtJ5wPgXTGuSeb7K+6
         EX+uSUVELgimA1DE4GSio40cX8gFLKDAU+N94TNyd04iK6EKOlnY72m2tcXKS6K5gAjn
         g1Ljib4p0T3f+GT7g1SvLBiVA/sPWglLuHgnzSb7GTQNmDden4aTtdX1a1lfeSOT/b9E
         ivwQ==
X-Gm-Message-State: AOAM531dnBax7JzWmRaCmKPIDNlhtXkI6kS23cJqumO3gAqFZVCvZGZm
        ouVFdYD2S2Xgd9/2Ba7ILaDdkg==
X-Google-Smtp-Source: ABdhPJxJPE/lsidWG4sbxqSE0fAKJ8DVwJ4yZRMkgFbAdV1HDkewtc2cAtHfGeQhL7IK39T6JBQWAA==
X-Received: by 2002:a2e:b6c7:: with SMTP id m7mr2386715ljo.241.1616599163322;
        Wed, 24 Mar 2021 08:19:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 12/28] arm64: dts: qcom: sdm845: assign DSI clock source parents
Date:   Wed, 24 Mar 2021 18:18:30 +0300
Message-Id: <20210324151846.2774204-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bcf888381f14..8e0c5dfbd639 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4115,6 +4115,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4181,6 +4184,9 @@ dsi1: dsi@ae96000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
-- 
2.30.2

