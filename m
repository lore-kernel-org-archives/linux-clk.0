Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56856C433E2
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:12:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EF2661A36
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCYLLy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbhCYLLu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:50 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D71C061761
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o126so1974906lfa.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=YhAG7IPza9vaR9CXXUH17mLsK70DFY0GFMODIBefki0c0Rcb1jIyvjeomJDqaTUYy5
         GWsxCFTM9DDP6y9LAoyQb3KQ4blLFHMRPGRWWBQUbza/Gc7ZFSadjHD1OKzhMMB6OkzW
         /qWxomsUc23TlBhrtrX7XBkU0dTbG6g5T6UqSOhd2eUJ1rYz/d1bc+zyAW4NXHUeOzj5
         2B9lC2mdy6f3PuHmPvQyDLsWXzBNnjX/XEdNIhM5as6AvTmfw586PDg63pmgAGA5V9gp
         SdvxY6YSb3OQyJj6Vsk9fFSKoDwoc3713BK73IKAlql7Gn8EwAg0hWxXUwFHldfYUlRH
         nGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=TTXoi1QKHKTiSoPCzosjTiS25FY44jVxMy0R9ENw86GoHygjGDgErU/YePFmgyhRUb
         x9cdMn0eUoVm4WJPafheFB3uZXBSu7lAc+SDCcsGKmI7FtqzSs17KOQNtUtR8F3OcVor
         4nrFX3MCsa8tKhwQn7Db6EKCFk7FwKXelTX0RDoMcQFLO6tl5NB6v0J+HNM9/XKm0rQl
         dFS/x7CEIdq3X8YBJdNcdAhXa0P/dYIKpLP3dF6xBUWcJDUl/yx459MIt8H2OgAsYV7x
         FqEQuVGqSp/p3/eKflJYz6H5UHONZhratWdOzLX2E9Ox6RRVVqGcTfBjUkY48VY9VNg1
         XEBA==
X-Gm-Message-State: AOAM5329DpuFKlR+1ch93jTYlsdzCP19TYBnphS6pYj5xZOSFmgQlBQu
        uMP7aaB64xEWLA80bX8+A0MBAA==
X-Google-Smtp-Source: ABdhPJzIQWpEkNMwMuzAm8dUXBnZy7ukmXakm61sE2rGvQdO+v9b3Ig6qpzkZDg3okc79je0e85APw==
X-Received: by 2002:a19:dc0b:: with SMTP id t11mr4841551lfg.233.1616670708660;
        Thu, 25 Mar 2021 04:11:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 02/15] clk: qcom: dispcc-sm8250: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:31 +0300
Message-Id: <20210325111144.2852594-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
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

