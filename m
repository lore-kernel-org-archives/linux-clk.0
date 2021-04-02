Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC6CC433ED
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8071361103
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233901AbhDBCVO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 22:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbhDBCVO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 22:21:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6020C06178C
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 19:21:13 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a1so4290783ljp.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 19:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=QTaFiJRQbCVJJ9dQLfeMfYbH0nCa4mbMXnIL4qoof9LMzWvHSlIl9mSHV30N+UafzM
         z1U+D4j3EDE6hG3QquLvBCQ4/n5k/7OmXb0IVHQDaaMtzhCGQmJwI3Sdqrd0U5oxBuX9
         9GjRz10R5ybDEIlNxJ6aj72gK0bUSTFx1ap0urbzvcggJYpyUMNBHEqYJZTJ8qXE96ys
         Y9hjRM8rkFqxd0pbm5MIoftLR+NPckIIgoKnpCVep7+HWSBbCHXyjwmV5O4bLbR6oZF/
         6eJ18PXHRo9tfllaBKZccMDqoZwjf+kvsvaIX1U/HfwihOU88teITipV3iNyC8dok51b
         /SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=JtsdpQmhiaedZCMjD7or6pjP+FUq7aEUXaRpNan4XD8tbRco6oRprBWKi3sgLXfKHD
         ELS0Qv1e7ElowcB61AoViUGxLXLymwgdCeePbNy7+fU6siTdSmFmQUVT1fwhYz2d94PT
         iM3YbAJvJc4TgfycEG9N5w1vc0DP6UYa4f3CSzEksTAkvqrHJBmaXyEPpwh84ltstn+d
         oTc1iB4SMmIirYq/eOD/pWGXaVpj4rwm9R+A/Sas0TLz48sOojS52LN/FXXScy7KisfZ
         s79Xp30fHYOh4pC82f6cy1gpElRbsOAE76454zviTM0boWzRtabiFVzMhvBUaIsVc3qg
         lmWw==
X-Gm-Message-State: AOAM530CpAZ4a/QzA/9SeDwdJAMYNl+h/L5pF1Ku9OrqlYkD38kd6PNU
        NTfc7prp3fDQUVtW6z3Gx4eypA==
X-Google-Smtp-Source: ABdhPJxrCp1kau3v9Rp2skqP5Itrx/DAKV59+25eQ4T+gSoNWoo9IlVXUGYPf4NQL3CJsnM6o2VqhA==
X-Received: by 2002:a2e:720c:: with SMTP id n12mr7091293ljc.67.1617330072268;
        Thu, 01 Apr 2021 19:21:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 02/16] clk: qcom: dispcc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:20:54 +0300
Message-Id: <20210402022108.4183114-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 588575e1169d..86275814e055 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -21,23 +21,15 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DISP_CC_PLL1_OUT_EVEN,
 	P_DISP_CC_PLL1_OUT_MAIN,
 	P_DP_PHY_PLL_LINK_CLK,
 	P_DP_PHY_PLL_VCO_DIV_CLK,
-	P_DPTX1_PHY_PLL_LINK_CLK,
-	P_DPTX1_PHY_PLL_VCO_DIV_CLK,
-	P_DPTX2_PHY_PLL_LINK_CLK,
-	P_DPTX2_PHY_PLL_VCO_DIV_CLK,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
 	P_DSI1_PHY_PLL_OUT_BYTECLK,
 	P_DSI1_PHY_PLL_OUT_DSICLK,
-	P_EDP_PHY_PLL_LINK_CLK,
-	P_EDP_PHY_PLL_VCO_DIV_CLK,
 };
 
 static struct pll_vco vco_table[] = {
-- 
2.30.2

