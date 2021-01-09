Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E29C433DB
	for <linux-clk@archiver.kernel.org>; Sat,  9 Jan 2021 01:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0494F23AAA
	for <linux-clk@archiver.kernel.org>; Sat,  9 Jan 2021 01:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbhAIBd6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Jan 2021 20:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAIBd6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Jan 2021 20:33:58 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D1ECC061573
        for <linux-clk@vger.kernel.org>; Fri,  8 Jan 2021 17:33:17 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id o17so27383191lfg.4
        for <linux-clk@vger.kernel.org>; Fri, 08 Jan 2021 17:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TGGL7MRmQ1s/aUig13t2N3SebYQRAiSHRFEw3Tw7vUU=;
        b=oLncZA0VOxrBENvLxfad/vGxEmTu3VxjK+jyfd+6NyyR5nwksNus90IADtOC8RrNTR
         YUO9Y4wdY98wrCS5CNhD34MmfaasfdZHADXs/IqhiSQXYD4H7sWiYc3SHWdlK/W6P4m/
         06W5oHou8Z2UI4JXG5swbTNjBmQqEVj5VmV0zleiTlY2mnHjM6PgW+TwDvkttv0b32OP
         VfbDi+p9bwfIvhhxl7rXy7F3ObRoY2UCo/4D5uby1i815vulg/UaJ97Gps+B2EcDkNhY
         0o6Eoxg0vHOjKxMYHCOrP24I0/djgM1xhvLrnQA6/0lJ339Y8lsF9pNcRQFOF7nhgqzd
         0C0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TGGL7MRmQ1s/aUig13t2N3SebYQRAiSHRFEw3Tw7vUU=;
        b=rpNM/l5dXMxp7pVo0ZcC8UruVP7c9WyZ9KfNAC+SsYww2k+jad2H1M4Gnn1meYQer7
         2XcdpjgZIz6TRLg0x/nHWLGKuDOodxEqdUCYCe8ydsq6F6HIxI4QBoSYan/GwwrGXVNu
         Lqh5bDpuLUA7QCeR38CPh2VDrq17VY/1vzU5vi2znJrx2stYuV976ioQMDJu5KQ0OHhh
         HwTJfxXoM7n5DlVf8sJsW8xelm8EZLe0Cz6NYUVbEyA5td75bDeKX1RrVoqtXXQ3XUK1
         Qt8DGYz1ivKaZWgMJc9JaeBIEhHqKH6GAMqNaYfF3bJun4F9WbZ8OPVX4aQOIqiP1xtJ
         Yf+Q==
X-Gm-Message-State: AOAM531r0j2SV0cPWGS9ruUfG0ZluexdZYRed01K+1xynaQYDfAkoIj9
        X03RMJJHHz8t4iw8ApajkS57eg==
X-Google-Smtp-Source: ABdhPJzAMB93IMXBMOBoiJnM0QcT6vQEB+xhIfti9AgxWh8qIdTppfGZXZ2vPNHA/02c29JDd5RGzg==
X-Received: by 2002:ac2:5e6e:: with SMTP id a14mr2607645lfr.127.1610155996160;
        Fri, 08 Jan 2021 17:33:16 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.99])
        by smtp.gmail.com with ESMTPSA id j23sm2197084lfh.194.2021.01.08.17.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 17:33:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sm250: Use floor ops for sdcc clks
Date:   Sat,  9 Jan 2021 04:33:14 +0300
Message-Id: <20210109013314.3443134-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Followup to the commits 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use floor
ops for sdcc clks") and 6d37a8d19283 ("clk: qcom: gcc-sc7180: Use floor ops
for sdcc clks"). Use floor ops for sdcc clocks on sm8250.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver
for SM8250")
---
 drivers/clk/qcom/gcc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 86381ea8e37f..8e79d0077b55 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -724,7 +724,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_4,
 		.num_parents = 5,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
@@ -747,7 +747,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_data = gcc_parent_data_0,
 		.num_parents = 3,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
-- 
2.29.2

