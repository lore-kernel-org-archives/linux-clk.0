Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2EEC433E8
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E92A361A26
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhCYLMa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhCYLLy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:54 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40B6C061763
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id q29so1923548lfb.4
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iyvnBZlTNurXEyCrPSOLE64/hPUHT0EpxducBu8pG7s=;
        b=vj4HF4WPq83nTWgkeiGisKU0N3svXeU0b2L+kM/Dsaky/K3b80bp5oDM2wHXN0Qi5P
         jUcRn/VJLXRxhlY19jgfxzZ2ptkM38wY1TGg6v187djmLMR2ZVV91CfS9bzR0zHp4Eif
         pEUVSXwdPnNK/bqqJGabc8jgoTUou78SavrWsCGJbRd4QCuyMDP2S1ofz6DEbzaHGGSj
         dC4L65FjIYQeMNwAAo91uJv1tvXc32VvAjifH/4KAr+d8+667JPn39ifnOjBle/6f98Y
         lz2SjQ0JE3jxFb0DbEb9Rm7hH76OiSPpnxNGfBDvzpUrtHt3Iw0dUx6/Er/SytCkPvrm
         zcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iyvnBZlTNurXEyCrPSOLE64/hPUHT0EpxducBu8pG7s=;
        b=AUBYFdqvGepicClNG5TLYDrpWYqll9zCizR+N4t5nVMvZRHpSzGbX5JhslyrgtoJCZ
         6SztUQqnbO0KEXT0HpERa9jOMfeOJOR8D6NdAGXpLBtqNlSDeWxK1QI2H982vQxUrun8
         6Y0MWLRPiKYZLFMnxQvrtNZNrY3IFiwDcpi0P262+MnpGM0kir4p4zCINfangmGrUvAL
         9ZFPI56gp5RG8atSbU1wiEAZI1Yc+gb92X8V+v4a/laDYXaUZ+5g6HaItRDwVzbuzfQT
         UCWlI9IKk22+8GpqmyWIgFXn0uuXZLQyG8zXnSFH2gQvSBedQbinYIuqlZ5LibzQngr6
         q6Lw==
X-Gm-Message-State: AOAM5318Otop9b8rIXlNb1SPpCofkTrbGqjuU5hQ2UBqDPuubggNTlDG
        Zs1Ow9Kg3NYaFaYxzdoexXf2rg==
X-Google-Smtp-Source: ABdhPJyrIdu+tHoIKq/e7mIfgGeC0T9HSqxRAafs2bnkhj2FL9iJz7wjtDm+QqlttWrfuD/iYlYuJw==
X-Received: by 2002:a05:6512:3a83:: with SMTP id q3mr4738587lfu.460.1616670711552;
        Thu, 25 Mar 2021 04:11:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 06/15] clk: qcom: videocc-sc7180: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:35 +0300
Message-Id: <20210325111144.2852594-7-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sc7180.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 276e5ecd4840..f5d04791a3cd 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -19,8 +19,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL0_OUT_ODD,
-- 
2.30.2

