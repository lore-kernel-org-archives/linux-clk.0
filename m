Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5534AC43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 04:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B924207FC
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 04:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567745919;
	bh=zvy0GlP/XHjEuOF/F5T+o2/beVvliDTkHocl2QsHJ3k=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=v79+O2hW15WaJoTLo9HtZuWPwRmFJkaOKdqRFE+FHAWiC09i0tV9XKP97KAuADagr
	 2MxNHrSdZhm4XPUZ4P/ZYk4ezYdDOV0HUECv4EhSkk7dZa+XQz7ECFJpetbgdOwPSk
	 xfBGTPlGHPTTQoOqU4GdaCqNPaS0z+fN8vsizOM8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbfIFE6e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 00:58:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:40504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbfIFE6e (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 00:58:34 -0400
Received: from localhost.localdomain (unknown [223.226.32.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0185207FC;
        Fri,  6 Sep 2019 04:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567745914;
        bh=zvy0GlP/XHjEuOF/F5T+o2/beVvliDTkHocl2QsHJ3k=;
        h=From:To:Cc:Subject:Date:From;
        b=KVGNyYYGrvTmwGhJkMLriGQ05SwusBSDnYO01GzhuMgtRm/v/+7IVre9R3h8pJwEK
         ynnk4hsd/OQDBLP2vNchDR0kbXfdp+hzSbG+A6f/0MWw3QZwEYtaWKs3C/+ba3fB7h
         RxHLiOd4HoIcBdEGfYSAWpMKPVprgs8qQOx1k6w8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-qcs404: Use floor ops for sdcc clks
Date:   Fri,  6 Sep 2019 10:26:59 +0530
Message-Id: <20190906045659.20621-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the gcc qcs404 clock driver to use floor ops for sdcc clocks. As
disuccsed in [1] it is good idea to use floor ops for sdcc clocks as we
dont want the clock rates to do round up.

[1]: https://lore.kernel.org/linux-arm-msm/20190830195142.103564-1-swboyd@chromium.org/

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index e12c04c09a6a..bd32212f37e6 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -1057,7 +1057,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 		.name = "sdcc1_apps_clk_src",
 		.parent_names = gcc_parent_names_13,
 		.num_parents = 5,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
@@ -1103,7 +1103,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_parent_names_14,
 		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
-- 
2.20.1

