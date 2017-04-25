Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from elvis.franken.de ([193.175.24.41]:55113 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1428724AbdDYNhW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Apr 2017 09:37:22 -0400
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Tue, 25 Apr 2017 14:30:07 +0200
Subject: [PATCH] Fix returns of some CLK API calls, if !CONFIG_HAVE_CLOCK
To: linux@armlinux.org.uk, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Message-Id: <20170425125547.865FB508DA7@solo.franken.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

If CONFIG_HAVE_CLOCK is not set, return values of clk_get(),
devm_clk_get(), devm_get_clk_from_child(), clk_get_parent()
and clk_get_sys() are wrong. According to spec these functions
should either return a pointer to a struct clk or a valid IS_ERR
condition. NULL is neither, so returning ERR_PTR(-ENODEV) makes
more sense.

Without this change serial console on SNI RM400 machines (MIPS arch)
is broken, because sccnxp driver doesn't get a valid clock rate.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 include/linux/clk.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index e9d36b3..b844a65 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -442,18 +442,18 @@ struct clk *clk_get_sys(const char *dev_id, const char *con_id);
 
 static inline struct clk *clk_get(struct device *dev, const char *id)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 
 static inline struct clk *devm_clk_get(struct device *dev, const char *id)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 
 static inline struct clk *devm_get_clk_from_child(struct device *dev,
 				struct device_node *np, const char *con_id)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 
 static inline void clk_put(struct clk *clk) {}
@@ -494,12 +494,12 @@ static inline int clk_set_parent(struct clk *clk, struct clk *parent)
 
 static inline struct clk *clk_get_parent(struct clk *clk)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 
 static inline struct clk *clk_get_sys(const char *dev_id, const char *con_id)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 #endif
 
-- 
2.1.4

