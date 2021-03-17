Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F49C2BB4C
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 14:41:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BE7064F50
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 14:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhCQOlC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 10:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbhCQOky (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 10:40:54 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0637C06174A
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:53 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id s13so2603141lfb.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UAQa/+HPZGb9w4gbaD2aOLSU7WxeXPAw6Cdwe97w/Q4=;
        b=eXP/TledxAPTdTLVmvjWNrnuZ/q0OFDG8H8Gqxj0LKAqVsIpvu5tTqTIgswDK3CeS0
         JWDh9i/7xcJi3WcsKO/Tlly97uR125Ij5vcDkA3bTqdgv2HHcVGvyDYlKZLOC4thwk7Q
         UpKymK7LwNVk9U2XQM4tBKconFpeO8znWGb7iTxgc/lPPDH7U8LYareV88zndg+UAwnv
         UYCxmNTVmvb5F9KfQ7LCvpGlyFyQJLBSwVuI39YvhjVqPqnth0tmnMlKFhiDMqllriGY
         j1cbGp/4XM/2T1BmXPbL5nDwPsyjsvEIgqjoTkZ0f3KIDIW+nQShkGozV3lXxoT6Fr4W
         3Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UAQa/+HPZGb9w4gbaD2aOLSU7WxeXPAw6Cdwe97w/Q4=;
        b=SZZYrYkSOMiS0S1XFBNgWTCiWDqBPoBQk783IIoRdHSVYkZJ062MkgEPsZ1dqudgNa
         zZrxTOb5cJ+69FAY1m2DmgxFhZPiauFnpyuDn42qZcbcpEmr+LcKnc/Pnr6BS7kmJ18n
         lTd2pGLw00usiH+EFX14htr1Xf+3gI2n0ttQL7oLmWh4P8kyT/B9+wh4L7+SQihUl+rG
         MGgmkK4iO8gIhAX4ncCEhMIMfyMEnYrNiYUMr+nxPHWe7ERMvICyqTtJhGy1QfoSXahk
         dRrQ4JNiVVfM3mbfOL5H1G83uZmEarJRboOTe77L+esh746ZmyYqV9fkiYIhvgnR3ZdT
         20Bg==
X-Gm-Message-State: AOAM533jhj5h7yav20gE9K9MP7NLs2gkZYQKPN6fvH1+vr1++2fs9dsI
        ujXix/f5yDZq1UB6YSIs+Ex52w==
X-Google-Smtp-Source: ABdhPJw4euHwBGmi07h52o4jzm1u82sY8Mak58T89zORmZtairSuAVrS4Ctn8CvJZPTrJNViVGwA8A==
X-Received: by 2002:ac2:5e6a:: with SMTP id a10mr2559303lfr.181.1615992052285;
        Wed, 17 Mar 2021 07:40:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 10/26] arm64: dts: qcom: sdm845: assign DSI clock source parents
Date:   Wed, 17 Mar 2021 17:40:23 +0300
Message-Id: <20210317144039.556409-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
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
index 454f794af547..2166549382c1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4113,6 +4113,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4179,6 +4182,9 @@ dsi1: dsi@ae96000 {
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

