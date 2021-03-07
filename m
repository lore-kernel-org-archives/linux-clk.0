Return-Path: <SRS0=MqlC=IF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838BFC433DB
	for <linux-clk@archiver.kernel.org>; Sun,  7 Mar 2021 14:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 526B764F65
	for <linux-clk@archiver.kernel.org>; Sun,  7 Mar 2021 14:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbhCGOGu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 7 Mar 2021 09:06:50 -0500
Received: from aposti.net ([89.234.176.197]:50206 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230486AbhCGOGg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 7 Mar 2021 09:06:36 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Russell King <linux@armlinux.org.uk>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] clk: Fix doc of clk_get_parent
Date:   Sun,  7 Mar 2021 14:06:26 +0000
Message-Id: <20210307140626.22699-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On error, or when the passed parameter is NULL, the return value is NULL
and not a PTR_ERR()-encoded value.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/linux/clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..96031b5f6933 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -745,7 +745,7 @@ int clk_set_parent(struct clk *clk, struct clk *parent);
  * @clk: clock source
  *
  * Returns struct clk corresponding to parent clock source, or
- * valid IS_ERR() condition containing errno.
+ * NULL on error.
  */
 struct clk *clk_get_parent(struct clk *clk);
 
-- 
2.30.1

