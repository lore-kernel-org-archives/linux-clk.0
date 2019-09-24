Return-Path: <SRS0=sOJR=XT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69807C4320D
	for <linux-clk@archiver.kernel.org>; Tue, 24 Sep 2019 16:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DBDD2054F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Sep 2019 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569344165;
	bh=SOE6ACuDJrpTLEalUwUdaGYcVNC0GWFqk/MsVyT7T58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=kYUpjUAHH4rh3Z54ZPOma13WF1BfQ7dcpMmQ5wS3RCsTkjEHc8InjPjF6xJLVJUn4
	 5Z3TcNgqmksdDRku7CHxBEcnuxfqf7ss+fBJqiaOCqBQnzqMGgfHr3HrVqyYoooEeY
	 ABrEC4D1TYQ1C+MNKkvzSP+Wrs/xf42fy0mN8AFA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410705AbfIXQuN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Sep 2019 12:50:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:42934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392032AbfIXQuM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Sep 2019 12:50:12 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84EC421D82;
        Tue, 24 Sep 2019 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569343811;
        bh=SOE6ACuDJrpTLEalUwUdaGYcVNC0GWFqk/MsVyT7T58=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m2mXba77NlIUbUaDAdGJ0iGW2iKuYhD/VZqIYgffUFwfNXMyYYLwZlhqyy5JgfGdu
         S/e1F1aji4nETjM+QcIPuRyrsyCk+wp8BMyFaveB8Lnlg81/1avezZui4PlzOoK9R8
         UDtnADgGoHNz0ZD3gYCDG/47aOx06rGoMbI7vqX8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 40/50] clk: qcom: gcc-sdm845: Use floor ops for sdcc clks
Date:   Tue, 24 Sep 2019 12:48:37 -0400
Message-Id: <20190924164847.27780-40-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164847.27780-1-sashal@kernel.org>
References: <20190924164847.27780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

[ Upstream commit 5e4b7e82d497580bc430576c4c9bce157dd72512 ]

Some MMC cards fail to enumerate properly when inserted into an MMC slot
on sdm845 devices. This is because the clk ops for qcom clks round the
frequency up to the nearest rate instead of down to the nearest rate.
For example, the MMC driver requests a frequency of 52MHz from
clk_set_rate() but the qcom implementation for these clks rounds 52MHz
up to the next supported frequency of 100MHz. The MMC driver could be
modified to request clk rate ranges but for now we can fix this in the
clk driver by changing the rounding policy for this clk to be round down
instead of round up.

Fixes: 06391eddb60a ("clk: qcom: Add Global Clock controller (GCC) driver for SDM845")
Reported-by: Douglas Anderson <dianders@chromium.org>
Cc: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lkml.kernel.org/r/20190830195142.103564-1-swboyd@chromium.org
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 3bf11a6200942..ada3e4aeb38f9 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -647,7 +647,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_names = gcc_parent_names_10,
 		.num_parents = 5,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
@@ -671,7 +671,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
 		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
-- 
2.20.1

