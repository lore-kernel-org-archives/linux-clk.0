Return-Path: <SRS0=/Rha=4C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7287DC3B1A1
	for <linux-clk@archiver.kernel.org>; Fri, 14 Feb 2020 17:32:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D28A2168B
	for <linux-clk@archiver.kernel.org>; Fri, 14 Feb 2020 17:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581701579;
	bh=9ua/guR1mxyD2PxnyswtbApfsZTNnJhfiDmUW4Mgjjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=I17AAT+29bsIn5BOBJUe2kTigP2o2hwMORs1xgNgp3FqbIC/aOEem2XGe/NvIAhjo
	 /SVm5NP8QPKWRQfccsJVIDRtePTngZRDIF361bO66CpPj7+5/Qlw77Ngs+awIP0bxV
	 +PFfh5hn+fpwlpgR3q/O+uzTpBejpzplAW+SjoEc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390481AbgBNQGj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Feb 2020 11:06:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:57168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390153AbgBNQGj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Feb 2020 11:06:39 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E071F222C2;
        Fri, 14 Feb 2020 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581696398;
        bh=9ua/guR1mxyD2PxnyswtbApfsZTNnJhfiDmUW4Mgjjk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nf1rXeZhSNnGg+xZMBCLN11yG1Q0ECPr0ONSUvttljRt/o7h9LWbr7Gc2q0dlu//M
         gqIl4KrT/3wcZVLku6NLo4NLbJXIN1sGf/8f6TFSNUvDyYQZsL21GBGj8vzTLB4NBW
         r3ZDLikOrwG8o7DI+L9P19O81IHS8n8tY0bXSB5o=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 223/459] clk: actually call the clock init before any other callback of the clock
Date:   Fri, 14 Feb 2020 10:57:53 -0500
Message-Id: <20200214160149.11681-223-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit f6fa75ca912be6021335de63a32aa4d295f3c524 ]

 __clk_init_parent() will call the .get_parent() callback of the clock
 so .init() must run before.

Fixes: 541debae0adf ("clk: call the clock init() callback before any other ops callback")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lkml.kernel.org/r/20190924123954.31561-2-jbrunet@baylibre.com
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/clk.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 67f592fa083ab..b0344a1a03704 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3320,6 +3320,21 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
+	/*
+	 * optional platform-specific magic
+	 *
+	 * The .init callback is not used by any of the basic clock types, but
+	 * exists for weird hardware that must perform initialization magic.
+	 * Please consider other ways of solving initialization problems before
+	 * using this callback, as its use is discouraged.
+	 *
+	 * If it exist, this callback should called before any other callback of
+	 * the clock
+	 */
+	if (core->ops->init)
+		core->ops->init(core->hw);
+
+
 	core->parent = __clk_init_parent(core);
 
 	/*
@@ -3344,17 +3359,6 @@ static int __clk_core_init(struct clk_core *core)
 		core->orphan = true;
 	}
 
-	/*
-	 * optional platform-specific magic
-	 *
-	 * The .init callback is not used by any of the basic clock types, but
-	 * exists for weird hardware that must perform initialization magic.
-	 * Please consider other ways of solving initialization problems before
-	 * using this callback, as its use is discouraged.
-	 */
-	if (core->ops->init)
-		core->ops->init(core->hw);
-
 	/*
 	 * Set clk's accuracy.  The preferred method is to use
 	 * .recalc_accuracy. For simple clocks and lazy developers the default
-- 
2.20.1

