Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701C4C4743D
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 02:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5017A6128A
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 02:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhFICct (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Jun 2021 22:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhFICct (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Jun 2021 22:32:49 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68162C061574
        for <linux-clk@vger.kernel.org>; Tue,  8 Jun 2021 19:30:40 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id k11so20720661qkk.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Jun 2021 19:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+z22K7cJoTfII0wjMzy+SPaF3NKWYN2M9CZgeLR5zms=;
        b=BKmXVQWTjHB2QWFXKDRwLKowO0o4ik8S3RamZyscSljtvVhOtG5sUjq1bbC9btwN5/
         yZWpar+E+oBsBs3WauDZHSOHZ6O32WvvyLvCTyyrihk/SMDRHlFFlVAcYtGeMNjqkgCG
         Y8xwrLig0Pk1+/HGbwAHZN2m7GgXxpcLHnzgAiQUj/vnEPgvGFy9uBKsmNimmcwAiGSg
         itO0KQ+JK3uyeIgv/G+8VBpjXWUlfoC7+woObbwBhcrs3DEhCUO8Iwr4ziYnf1NKG0Ew
         NGQWwWoKiMVTj0HW4lirUgVKtSLxGgLVlIuUIXkHRUqKX4zCnrpS53jK1/sAYVo+Ee9D
         C1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+z22K7cJoTfII0wjMzy+SPaF3NKWYN2M9CZgeLR5zms=;
        b=m6VhQnLM0m3xb5C8Jv5EJPMPoYAr42SCTvSjQ0b9ne9bSLhupg2NXBndYscdAVH0P9
         9i3UIXcQN5Yt24ST9F8dBMv2N/sDvNw0T6oeWsG2D1TwRBo2kcIteEvoKVp58WfRv672
         opVzX6MvA31yLkpigKo3YNrytwoFg7Ve5hPimfpVc2Ue19LItC0c9yUDDzQD71DamWnv
         9FdkltinSx/ju8h7Z3DpW6epcwHrAhRWDYMq9bt+oeby3Z2zQMsL+Rg7Pzd0Y6dU3weJ
         RJNkBMEtqN4GE7Sa+gXjcTEJaAFYga2sY2dxP9WAJ2vPm9I3e62QTavK3vi83TyzVrl5
         X/hA==
X-Gm-Message-State: AOAM5333tSLeBksVGIyyuqxpux7xrt28f2pu83V2YYJLAs61tJibzKr4
        J2KNP0CfyHt5lix7rFJtPZ05cQ==
X-Google-Smtp-Source: ABdhPJz2g+nBQFafQ5Ceao0dQXXJmQLwCSRZnYw1kdhpdxgJU8Ea/m3zpyB7RtospbzBHSCYeZ3gCw==
X-Received: by 2002:a37:a70d:: with SMTP id q13mr17280596qke.295.1623205839654;
        Tue, 08 Jun 2021 19:30:39 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id o12sm13083568qki.44.2021.06.08.19.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 19:30:39 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] clk: qcom: clk-alpha-pll: fix CAL_L write in alpha_pll_fabia_prepare
Date:   Tue,  8 Jun 2021 22:28:52 -0400
Message-Id: <20210609022852.4151-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Caught this when looking at alpha-pll code. Untested but it is clear that
this was intended to write to PLL_CAL_L_VAL and not PLL_ALPHA_VAL.

Fixes: 691865bad627 ("clk: qcom: clk-alpha-pll: Add support for Fabia PLL calibration")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 94b53c7db2f7f..eaedcceb766f9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1255,7 +1255,7 @@ static int alpha_pll_fabia_prepare(struct clk_hw *hw)
 		return ret;
 
 	/* Setup PLL for calibration frequency */
-	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), cal_l);
+	regmap_write(pll->clkr.regmap, PLL_CAL_L_VAL(pll), cal_l);
 
 	/* Bringup the PLL at calibration frequency */
 	ret = clk_alpha_pll_enable(hw);
-- 
2.26.1

