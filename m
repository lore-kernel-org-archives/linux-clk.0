Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:38737 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753721AbbKYBqm (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 24 Nov 2015 20:46:42 -0500
Received: by wmec201 with SMTP id c201so50818611wme.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2015 17:46:41 -0800 (PST)
To: Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org
Cc: alexander.sverdlin@gmail.com
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH] clk: Fix comment to clk_get_parent()
Message-ID: <565512FF.2080704@gmail.com>
Date: Wed, 25 Nov 2015 02:46:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

There is no single implementation of clk_get_parent(), which returns ERR_PTR().
Therefore, fix the comment in common header linux/clk.h, which claims otherwise.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 include/linux/clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 0df4a51..0f53683 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -387,7 +387,7 @@ int clk_set_parent(struct clk *clk, struct clk *parent);
  * @clk: clock source
  *
  * Returns struct clk corresponding to parent clock source, or
- * valid IS_ERR() condition containing errno.
+ * NULL on error.
  */
 struct clk *clk_get_parent(struct clk *clk);

