Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AA3C05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 16:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjBQQEY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 11:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjBQQEX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 11:04:23 -0500
X-Greylist: delayed 451 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Feb 2023 08:04:22 PST
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A1B2768E75
        for <linux-clk@vger.kernel.org>; Fri, 17 Feb 2023 08:04:22 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id T35cpSuxkFOC9T35cp2ZIu; Fri, 17 Feb 2023 16:56:01 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 17 Feb 2023 16:56:01 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-clk@vger.kernel.org
Subject: [PATCH] clk: Reorder fields in 'struct clk_fractional_divider'
Date:   Fri, 17 Feb 2023 16:55:55 +0100
Message-Id: <d1874eb8848d5f97f87337011188640a1463a666.1676649335.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Group some variables based on their sizes to reduce hole and avoid padding.
On x86_64, this shrinks the size of 'struct clk_fractional_divider'
from 72 to 64 bytes.

It saves a few bytes of memory when the structure is kzalloc()'ed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Using pahole

Before:
======
struct clk_fractional_divider {
	struct clk_hw              hw;                   /*     0    24 */
	void *                     reg;                  /*    24     8 */
	u8                         mshift;               /*    32     1 */
	u8                         mwidth;               /*    33     1 */

	/* XXX 2 bytes hole, try to pack */

	u32                        mmask;                /*    36     4 */
	u8                         nshift;               /*    40     1 */
	u8                         nwidth;               /*    41     1 */

	/* XXX 2 bytes hole, try to pack */

	u32                        nmask;                /*    44     4 */
	u8                         flags;                /*    48     1 */

	/* XXX 7 bytes hole, try to pack */

	void                       (*approximation)(struct clk_hw *, long unsigned int, long unsigned int *, long unsigned int *, long unsigned int *); /*    56     8 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	spinlock_t *               lock;                 /*    64     8 */

	/* size: 72, cachelines: 2, members: 11 */
	/* sum members: 61, holes: 3, sum holes: 11 */
	/* last cacheline: 8 bytes */
};


After:
=====
struct clk_fractional_divider {
	struct clk_hw              hw;                   /*     0    24 */
	void *                     reg;                  /*    24     8 */
	u8                         flags;                /*    32     1 */
	u8                         mshift;               /*    33     1 */
	u8                         mwidth;               /*    34     1 */

	/* XXX 1 byte hole, try to pack */

	u32                        mmask;                /*    36     4 */
	u8                         nshift;               /*    40     1 */
	u8                         nwidth;               /*    41     1 */

	/* XXX 2 bytes hole, try to pack */

	u32                        nmask;                /*    44     4 */
	void                       (*approximation)(struct clk_hw *, long unsigned int, long unsigned int *, long unsigned int *, long unsigned int *); /*    48     8 */
	spinlock_t *               lock;                 /*    56     8 */

	/* size: 64, cachelines: 1, members: 11 */
	/* sum members: 61, holes: 2, sum holes: 3 */
};
---
 include/linux/clk-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index cf1adfeaf257..8cec844f5dde 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1134,13 +1134,13 @@ struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
 struct clk_fractional_divider {
 	struct clk_hw	hw;
 	void __iomem	*reg;
+	u8		flags;
 	u8		mshift;
 	u8		mwidth;
 	u32		mmask;
 	u8		nshift;
 	u8		nwidth;
 	u32		nmask;
-	u8		flags;
 	void		(*approximation)(struct clk_hw *hw,
 				unsigned long rate, unsigned long *parent_rate,
 				unsigned long *m, unsigned long *n);
-- 
2.34.1

