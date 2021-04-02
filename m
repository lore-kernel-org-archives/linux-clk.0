Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2153EC433B4
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F032761185
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235247AbhDBU6N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235166AbhDBU6M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:12 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5721AC06178C
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id v15so9102123lfq.5
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=LfxJvu5oQgWIPry/RXcqn+XBpkXDuniAZ+HgnGoFjyS0bkRgpxsBDSbHIOVjdoCQko
         CR/lhW1MFrsN+f+toSHbaiOB3oB1PQMmgrfmmNdvZvlnUbBs73lbXaHBNtGQUqYGrH5J
         w+Gi+TpRYKRDuvf9+oLWdVeJi4xNPjS8Lmo3ZJFq/q1Xca0OaoWoAo564dnAhwiaGLAG
         DJ91/FTBy+wiNNETp1N3Pa//w4+JjFPA4myqh4nu9fFF4CL9QJnznsl83CcL7PcDp1ua
         4sBV3mpJJQN8ntsbzCwnu6RKIcwglnB+zPq5iDex8TQg7GCkviqcay2KxvKX62Jwrtfw
         ymMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=kb74AdUb4RLogU2sLNBqS0VQLNS2WqDquqwDvqanwwSiYUI252ZCGfTjrDH7zeWO16
         2dwWlqBxGJdsm7grSEUEfc40sXe/etVJl7iJYzMoyrRQAG5y+mVCQSUjFYGANz0JUKv4
         f17Iy2nwTwWJYaxoY186TJMAKB1ceIfH7Gs262BxbFObZvPm38vBURDB4Y+E/rh+S1TK
         fVz07rF1hgSNSBqbJ56NHeP3nkJ5ZYh483UZhHlBC58UzAsdjf9Y89kgpB+y9iz+JINz
         1outqOEwNYvl4nzRI8qds6NmjKUg0NZrS4JfFMZBmGVWspUTJTmfU5PEvnRUeEyDQ2gf
         UAoQ==
X-Gm-Message-State: AOAM530V39G5p0glXdQ+GtLYw48cvZEgSMTgTj46mq8rDXjKnmgd80vd
        oSRxm6E3BvXEwMWjMUkXF93iBQ==
X-Google-Smtp-Source: ABdhPJw9F39VWPvBLYLh4qijlvpbrlNQ4t6HhbIwNxkPzb/wEy+wx4Num9JOj9eA1n6DwKmQEn+NJw==
X-Received: by 2002:ac2:598e:: with SMTP id w14mr9792113lfn.622.1617397088766;
        Fri, 02 Apr 2021 13:58:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 02/16] clk: qcom: dispcc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:50 +0300
Message-Id: <20210402205804.96507-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
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

