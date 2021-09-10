Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FABAC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 10 Sep 2021 00:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8E65611C3
	for <linux-clk@archiver.kernel.org>; Fri, 10 Sep 2021 00:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242362AbhIJAqx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Sep 2021 20:46:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:49002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234520AbhIJAXf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 9 Sep 2021 20:23:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23BC2611BF;
        Fri, 10 Sep 2021 00:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631233344;
        bh=GqVvT05583abG+0Qx/af1oRJAEOMJ06DGhSO6ySIx4g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jWXIGWoUp9+GVmgqirkqtoezW+15ZBdOPwtqlbfIQWi31J45Saifa5elP5l1H/bim
         wFtTHO0RAYdCPJNxm+rgyReWM+II1AxE9ca0w4J65B6mU6YMFTY/pC5UH4hrahPBpZ
         ERov0QbVGc11LH75RleAc0hX+ueWaT54VSvod/n6l2KbdQlZD0/pMVw6JzUD6dp3Bz
         fsmGGKxSyJsiGxaEJvpkfdlo5WIg8QYLeIJ7dfUoN+tck6dbV7Xw3OsSX0HpCS5orw
         er0rPy2QCSopDLIt+vH0EahTQpJoZ5k6ALKPzgGAM3L34zW9Z4P3Bcm084k8ECJiw8
         o0moweVKtCLvw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 31/37] clk: zynqmp: Fix a memory leak
Date:   Thu,  9 Sep 2021 20:21:36 -0400
Message-Id: <20210910002143.175731-31-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002143.175731-1-sashal@kernel.org>
References: <20210910002143.175731-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

[ Upstream commit e7296d16ef7be11a6001be9bd89906ef55ab2405 ]

Fix a memory leak of mux.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Link: https://lore.kernel.org/r/20210818065929.12835-3-shubhrajyoti.datta@xilinx.com
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/zynqmp/clk-mux-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/zynqmp/clk-mux-zynqmp.c b/drivers/clk/zynqmp/clk-mux-zynqmp.c
index 0af8f74c5fa5..d6a00e4074e2 100644
--- a/drivers/clk/zynqmp/clk-mux-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-mux-zynqmp.c
@@ -132,7 +132,7 @@ struct clk_hw *zynqmp_clk_register_mux(const char *name, u32 clk_id,
 	hw = &mux->hw;
 	ret = clk_hw_register(NULL, hw);
 	if (ret) {
-		kfree(hw);
+		kfree(mux);
 		hw = ERR_PTR(ret);
 	}
 
-- 
2.30.2

