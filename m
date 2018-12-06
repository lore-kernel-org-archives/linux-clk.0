Return-Path: <SRS0=15nu=OP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C91FC64EB1
	for <linux-clk@archiver.kernel.org>; Thu,  6 Dec 2018 21:59:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 266B7214C1
	for <linux-clk@archiver.kernel.org>; Thu,  6 Dec 2018 21:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544133560;
	bh=sGMx72k4x9vDwEhsJ6vaPW/CS32e3I8ReoI5Vp4e4bE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=bNwQnyirbbZ7QblFDH1jGZgAE3ZeJyxn5c7jT+KTWzFwLLOi4qySB8eMaxgMuH0mM
	 ymczxh2SRIDNYEdN6d1Ew5RPM2DK5XUG4jAYSjSKqWyBEcacqc0lvx2faAVSmvPLO7
	 woZ3ShIvpIY4QI6rM1qFnjfi97kCxv2soWyCm6EQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 266B7214C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbeLFV7B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Dec 2018 16:59:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:60090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726108AbeLFV7B (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:01 -0500
Received: from mail.kernel.org (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BD972151B;
        Thu,  6 Dec 2018 21:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544133541;
        bh=sGMx72k4x9vDwEhsJ6vaPW/CS32e3I8ReoI5Vp4e4bE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WB9bJG39lH4JgA4ZAeVMlvVxjsCUwFyiMvo8c6kyfdScK0f7uH4O5sRpBxbgg6MA/
         B6IgytuLpCRiIqzWkVl001nopqa5fbHC4iL3g7KUveNwSlAhvFeC2E397oZ0oCHbZ6
         H7+E7mt0ExsKyG5dxKz5gWCjb+iuwkQSzYe6+cNg=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 6/8] clk: versatile: sp810: Remove usage of CLK_IS_BASIC
Date:   Thu,  6 Dec 2018 13:58:56 -0800
Message-Id: <20181206215858.3880-7-sboyd@kernel.org>
X-Mailer: git-send-email 2.20.0.rc2.403.gdbc3b29805-goog
In-Reply-To: <20181206215858.3880-1-sboyd@kernel.org>
References: <20181206215858.3880-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This flag doesn't look to be used by any code, just set in the clk init
structure and then never tested again. Remove it from this driver as it
doesn't provide any benefit.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/versatile/clk-sp810.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index 1fe1e8d970cf..c2b6bb814742 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -111,7 +111,7 @@ static void __init clk_sp810_of_setup(struct device_node *node)
 
 	init.name = name;
 	init.ops = &clk_sp810_timerclken_ops;
-	init.flags = CLK_IS_BASIC;
+	init.flags = 0;
 	init.parent_names = parent_names;
 	init.num_parents = num;
 
-- 
Sent by a computer through tubes

