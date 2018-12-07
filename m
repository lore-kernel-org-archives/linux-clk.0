Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3936DC07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 05:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1F2020837
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 05:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544161114;
	bh=GBfanwZfl8foUS9TUYAyKlZFPkYGJu6/014LFNKRqoI=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=WgzpSYo8eTgMWSqykU4uxUR87K0ravVhRuF39GGVLvFdksMMo8dXPKVWd5x7vjfo2
	 PE6BGian/NAmIGbpLf1w+NpsMp2hYwAcSJW633hz7XOGFc++Tum8XZExclM7DpwLrT
	 FQ1dLNw2KLw/yoGqXmtn9l2tZbCXQ67JpZYbjOhs=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1F2020837
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbeLGFid (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 00:38:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:48554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbeLGFid (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Dec 2018 00:38:33 -0500
Received: from localhost.localdomain (unknown [106.201.124.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36BE120837;
        Fri,  7 Dec 2018 05:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544161112;
        bh=GBfanwZfl8foUS9TUYAyKlZFPkYGJu6/014LFNKRqoI=;
        h=From:To:Cc:Subject:Date:From;
        b=Usum7LxesDrAAa6Rq1rRpw4D5b+LDu5IhtOgU3YspzD3B6iBdVNPRQeP/NrCZ4HNe
         rS3a9BC7dCaiFI9UXJFqiiLlhgQ4lGLRw8l9c+9c9wSiX/yypf54v7839yite3NbGN
         0y2rzrJggZHXIkJ5yj5I0ESuvHaLMsw0JhkboG6Y=
From:   Vinod Koul <vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] clk: qcom: Fix gpll0_out_main parent
Date:   Fri,  7 Dec 2018 11:07:49 +0530
Message-Id: <20181207053749.24872-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

gpll0_out_main parent is cxo so fix it.

Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index ef1b267cb058..64da032bb9ed 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -297,7 +297,7 @@ static struct clk_alpha_pll gpll0_out_main = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_out_main",
 			.parent_names = (const char *[])
-					{ "gpll0_sleep_clk_src" },
+					{ "cxo" },
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
-- 
2.19.2

