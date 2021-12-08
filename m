Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED10C43217
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 02:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239212AbhLHCZq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Dec 2021 21:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhLHCZq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Dec 2021 21:25:46 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A2AC061574
        for <linux-clk@vger.kernel.org>; Tue,  7 Dec 2021 18:22:15 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id n12so2617112lfe.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Dec 2021 18:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A28NpQx62660xbFHsS7Y/NYN52Y6d2zHm3km6spqAcA=;
        b=QPXHGIt8s6JpN2l+y92i2DtbE5YWNEE7wdCxJD8uZEdSkcavIRwIB8A7MVyna+238J
         HVE9gsBqyTvCBp8FOUWHoV6ZZURiFCGomh4k5HLK87H9STNtKYdMqQ8ewc1cG4W3iAO6
         SQ5fm1eltzIXWHCSP+UYvD4E9WXYhZEqBzUS6XbsUrbt0J7bf2Bjf5k1MCWBMuGTf1uK
         dTbmIHjF+hfDFaefgxb9nZL7cQraJ1MlOXAecGo0dfPnZNsQL9I9rDr3V5CgwitGcvxO
         Dk4NGEK2IwXwcGKLHb+MxAMXJfLMKlxL/BqolAoGx6Mfv3REIfYQRVxmGcGKCkuN/xQN
         KbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A28NpQx62660xbFHsS7Y/NYN52Y6d2zHm3km6spqAcA=;
        b=chWZKzDYc3mvMdAhspeahVTUo+37zjkBi7jI3WdqtoeiMmH49Z+ePJ0lxmtckYiUfk
         ionS70jUQNXeXv97CXNp7nvfTikdFfydy1G+LJ2mwqIVTdHpqU7QHI1/w0807ofJv/nQ
         dIPXMxvmvvBtNKyNmrdhKEVKtMt66qCsgfThcWoEzEsLFiesI8W2b6arSpsIqwKpNCKy
         f5+v+fvSGwMnUfYpM4lqz3Nk8PH5R4ym9VrOwRJMySBxkC35QJfSblZe0tiQbt8cvgD5
         8pFvAwhJtQb8LZuWSabzIbMSF00cMW5Ui0dK7gadju0l7+ZHWdorVIFzMfUZ8tgylUuz
         HUzA==
X-Gm-Message-State: AOAM530JWNeOfvJnWB2v5v6lFY3FD9Gz+jw4sx3uHXvRbsI/M7N/oOee
        3i6OxU0ICuN14OlvcnTGOEuw7g==
X-Google-Smtp-Source: ABdhPJwRZLhfImT9L33P6rokXze202juMqSpTINL7c5tiOVS8y1pBSxs9z9lTujsbSbxUx1KKVGfJw==
X-Received: by 2002:a05:6512:22d3:: with SMTP id g19mr43589323lfu.404.1638930133558;
        Tue, 07 Dec 2021 18:22:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o22sm114111lfu.274.2021.12.07.18.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 18:22:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: dispcc-sdm845: park disp_cc_mdss_mdp_clk_src
Date:   Wed,  8 Dec 2021 05:22:10 +0300
Message-Id: <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
was enabled by the bootloader, part it to the TCXO clock source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sdm845.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 735adfefc379..f2afbba7bc72 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
 
 	clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
+	/* Park disp_cc_mdss_mdp_clk_src */
+	clk_rcg2_park_safely(regmap, 0x2088, 0);
+
 	/* Enable hardware clock gating for DSI and MDP clocks */
 	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
 
-- 
2.33.0

