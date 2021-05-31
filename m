Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7C0C47096
	for <linux-clk@archiver.kernel.org>; Mon, 31 May 2021 17:36:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0E6E611CB
	for <linux-clk@archiver.kernel.org>; Mon, 31 May 2021 17:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233276AbhEaRiR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 May 2021 13:38:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:42628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233271AbhEaRh5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 31 May 2021 13:37:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 323D461285;
        Mon, 31 May 2021 17:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622482564;
        bh=LuPsBIFhxgd/n8nHsszgAmLqq7folE7IErl+jaDcRN8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=irRA9xPCYi1dYhMgMdKAWdz2kuDpfBS4m/ORrdhswdJPt2yGUtAgNAPLjnmF6fsQa
         bRXXdUBFg9Hwr5fB2u5cg22LI1Nw6JwfH1271lEFxDJhM/YJtUzp+ES+uMUMxIhI75
         45weX9Kp0RoEULGmEkXwjuaxmvvk2qvG/smNatXYzFqpnHpeF4zHOxaS4EGYsvd/6y
         O2oKUNp/LbG4AAeK4NEIUqUvz7lUyd2utZjuI7YHJVEAo2CpgjggmHKYI4Fv2+elku
         u4aFirCoVIPK5BFnSBmbfdBUSIc6Ko2gN51lsiTY06osgnMOmGGmeLKhnMOflHgbxC
         DSCdJeTlQ09Hg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 7/7] clkdev: remove unused clkdev_alloc() interfaces
Date:   Mon, 31 May 2021 19:34:29 +0200
Message-Id: <20210531173429.2467403-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210531173429.2467403-1-arnd@kernel.org>
References: <20210531173429.2467403-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The last user of clkdev_alloc() and clkdev_hw_alloc() was
removed last year, so everything now calls clkdev_create()
and clkdev_hw_create() instead.

Removing the unused functions lets the compiler optimize
the remaining ones slightly better.

Fixes: e5006671acc7 ("clk: versatile: Drop the legacy IM-PD1 clock code")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/clkdev.c   | 28 ----------------------------
 include/linux/clkdev.h |  5 -----
 2 files changed, 33 deletions(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 0f2e3fcf0f19..67f601a41023 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -190,34 +190,6 @@ vclkdev_create(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
 	return cl;
 }
 
-struct clk_lookup * __ref
-clkdev_alloc(struct clk *clk, const char *con_id, const char *dev_fmt, ...)
-{
-	struct clk_lookup *cl;
-	va_list ap;
-
-	va_start(ap, dev_fmt);
-	cl = vclkdev_alloc(__clk_get_hw(clk), con_id, dev_fmt, ap);
-	va_end(ap);
-
-	return cl;
-}
-EXPORT_SYMBOL(clkdev_alloc);
-
-struct clk_lookup *
-clkdev_hw_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt, ...)
-{
-	struct clk_lookup *cl;
-	va_list ap;
-
-	va_start(ap, dev_fmt);
-	cl = vclkdev_alloc(hw, con_id, dev_fmt, ap);
-	va_end(ap);
-
-	return cl;
-}
-EXPORT_SYMBOL(clkdev_hw_alloc);
-
 /**
  * clkdev_create - allocate and add a clkdev lookup structure
  * @clk: struct clk to associate with all clk_lookups
diff --git a/include/linux/clkdev.h b/include/linux/clkdev.h
index fd06b2780a22..8a8423eb8e9a 100644
--- a/include/linux/clkdev.h
+++ b/include/linux/clkdev.h
@@ -30,11 +30,6 @@ struct clk_lookup {
 		.clk = c,	\
 	}
 
-struct clk_lookup *clkdev_alloc(struct clk *clk, const char *con_id,
-	const char *dev_fmt, ...) __printf(3, 4);
-struct clk_lookup *clkdev_hw_alloc(struct clk_hw *hw, const char *con_id,
-	const char *dev_fmt, ...) __printf(3, 4);
-
 void clkdev_add(struct clk_lookup *cl);
 void clkdev_drop(struct clk_lookup *cl);
 
-- 
2.29.2

