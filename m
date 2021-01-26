Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DCDC433E9
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:11:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FACD2311B
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390185AbhAZNLF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391943AbhAZMsh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:48:37 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB5AC0698E0
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:01 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id u14so2627550wmq.4
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4mll2lpwENE608kX1kOhep+FnuspDxHBBTIWjYWHVv4=;
        b=pN4lfLmmVBgLX1q2BKk4RyuM8nfGi0iSK2p5oFzqbwR48oc2/k0GoyukN3ekRynO06
         FKaAaAsWyotTSplcMwQPMAZVfJizyGQiOJBMk0yYcAymhgu9N2ZSbUSh6qjy288ou0pc
         HqtayVh1cyMBIbzfiBYPHmvVjr9IdO/PtWWdjNpPkVFE2CynLfawGQEBle+vluHgUEPi
         XIkSyDlNFtRmGLri4EMRNLpm0jF2EqbuLb6EDwAkGFdlQ5TAMlRTr4lVHYp6w+0UpvW3
         IMv+nTm9wowh7LVp4WikScVxnNSItGlVg6V+ACms+OKjBP2oRnEDQeXLGZ596/KJomrY
         KMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4mll2lpwENE608kX1kOhep+FnuspDxHBBTIWjYWHVv4=;
        b=uXtjdF4myhZ2G15fKwAHRd9izH4ZrLEo6FNOdZ2bRO3rJNMeTais6qRRMNff9L9U2/
         oyBz3RoDC2GRSx2KSwAPQs1NwaL5nemOxQDe7/Cl9AEPuz9ZZQv/tbjdsTlEM80RjJST
         k3RM0PApBCmVFkvNWMQIAyF19taZkHnbFHFW2J5DokgunI27ixbuAhygFpriW0mqsuwn
         I6qcble70RgbesMHoGKHsZLFlaLaY/WdsIiXgJIvRBPtai8GpotJovMJs+eltWrIUDjL
         6uNvkCub2PbNKC6aDj8HNNIIT9RPdyMNGXY3vm2He7IA/pnIHPhL0WkA1aiYMtqYFTzI
         Simw==
X-Gm-Message-State: AOAM533uG0IGS6crIS/2wE9r6ia7jnmApQOzwuRx3Bn3T5If/RdFyByc
        Gptl6eEOvxyZZc/AS2sJ+4ooTQ==
X-Google-Smtp-Source: ABdhPJwsLKoq02G2opNkx2KyZBjwCJrT1QWUMlzjgyZlIH/qv0W5suRHKqypiyBgXWhP7zNqj62Grg==
X-Received: by 2002:a05:600c:1911:: with SMTP id j17mr4552481wmq.63.1611665159968;
        Tue, 26 Jan 2021 04:45:59 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:59 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 13/21] clk: qcom: gcc-ipq4019: Remove unused variable 'ret'
Date:   Tue, 26 Jan 2021 12:45:32 +0000
Message-Id: <20210126124540.3320214-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/qcom/gcc-ipq4019.c: In function ‘clk_cpu_div_set_rate’:
 drivers/clk/qcom/gcc-ipq4019.c:1279:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index ef5137fd50f3f..8abad4032de71 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1276,16 +1276,15 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_fepll *pll = to_clk_fepll(hw);
 	const struct freq_tbl *f;
 	u32 mask;
-	int ret;
 
 	f = qcom_find_freq(pll->freq_tbl, rate);
 	if (!f)
 		return -EINVAL;
 
 	mask = (BIT(pll->cdiv.width) - 1) << pll->cdiv.shift;
-	ret = regmap_update_bits(pll->cdiv.clkr.regmap,
-				 pll->cdiv.reg, mask,
-				 f->pre_div << pll->cdiv.shift);
+	regmap_update_bits(pll->cdiv.clkr.regmap,
+			   pll->cdiv.reg, mask,
+			   f->pre_div << pll->cdiv.shift);
 	/*
 	 * There is no status bit which can be checked for successful CPU
 	 * divider update operation so using delay for the same.
-- 
2.25.1

