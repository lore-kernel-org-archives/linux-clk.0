Return-Path: <SRS0=QcJy=QS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB819C169C4
	for <linux-clk@archiver.kernel.org>; Mon, 11 Feb 2019 07:40:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEFEF2084D
	for <linux-clk@archiver.kernel.org>; Mon, 11 Feb 2019 07:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549870817;
	bh=Ledhq4vfy+28Vy2ZO4XGF0xdR84uxJUp/3eZNbAY2nQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=zHpWiJv4v1737OSQ3LG8pGs+Y14SzrXuBlXU+3e7gAPHzQiPjbY+VhRTDFqdRAHCO
	 udYcNqtYK8vdnn0WMSBkX1mH2g2blNFYa0z40IguuHnRhESCMvyXpsrHcum+S2h09H
	 aGOsqoOfvxAOqpSyK10us5Hj6AI0gyONiXexUlWc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbfBKHkR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Feb 2019 02:40:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:57440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726847AbfBKHkR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 11 Feb 2019 02:40:17 -0500
Received: from localhost.localdomain (unknown [117.99.91.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6428B2084D;
        Mon, 11 Feb 2019 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549870816;
        bh=Ledhq4vfy+28Vy2ZO4XGF0xdR84uxJUp/3eZNbAY2nQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KV5FfCtm8Q4yBbLVr1URQ0hzLQu2baqVeOSIEwp9igPQeUwhXOf+HdSlbmHWxXEke
         RbD8+un4yQURrHBqDwuUHDpQ9HvGm5Fn9XRcudnNkMDyfPbdTo0tgt3cFkZ+Ohy3mO
         FlHxwR7IBy+svsVozjpDkesHFcG6EUgXO3swXhNk=
From:   Vinod Koul <vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 3/3] clk: qcom: gcc-qcs404: Add cfg_offset for blsp1_uart3 clock
Date:   Mon, 11 Feb 2019 13:09:28 +0530
Message-Id: <20190211073928.20456-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211073928.20456-1-vkoul@kernel.org>
References: <20190211073928.20456-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

The CFG/M/N/D registers are at an offset of 0x20 from the CMD register
only for blsp1_uart3 clock, so add it for uart3 only.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes in v2:
	Update changelog to indicate that uart3 alone suffers from this

 drivers/clk/qcom/gcc-qcs404.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index a7b2fe0fe505..5a62f64ada93 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -678,6 +678,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.cmd_rcgr = 0x4014,
 	.mnd_width = 16,
 	.hid_width = 5,
+	.cfg_off = 0x20,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_blsp1_uart0_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
-- 
2.20.1

