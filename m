Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33055 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751580AbdENU3F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 May 2017 16:29:05 -0400
Received: by mail-wm0-f66.google.com with SMTP id y10so23862076wmh.0
        for <linux-clk@vger.kernel.org>; Sun, 14 May 2017 13:29:04 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        trivial@kernel.org
Subject: [PATCH] clk: Fix comment to clk_get_parent
Date: Sun, 14 May 2017 22:28:25 +0200
Message-Id: <20170514202825.20389-1-alexander.sverdlin@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

There is no single implementation of clk_get_parent, which returns ERR_PTR().
Therefore, fix the comment in common header linux/clk.h, which claims otherwise.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 include/linux/clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 024cd07870d0..93b1857085fa 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -417,7 +417,7 @@ int clk_set_parent(struct clk *clk, struct clk *parent);
  * @clk: clock source
  *
  * Returns struct clk corresponding to parent clock source, or
- * valid IS_ERR() condition containing errno.
+ * NULL on error.
  */
 struct clk *clk_get_parent(struct clk *clk);
 
-- 
2.12.2

