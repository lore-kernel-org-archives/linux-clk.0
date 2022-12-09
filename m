Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4A0C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 00:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiLIAUa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Dec 2022 19:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiLIAU2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Dec 2022 19:20:28 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC2A92310;
        Thu,  8 Dec 2022 16:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=l+5hAcahIcnFsY9xQ4Jx9rT+Tc2PRQQClCgcO5NdpQY=; b=OMrMRPxzvM3DHnZXXrwC6dwnax
        ItlDN91IrP736ydfHjrGAqcmsLaTXwvqKv8CNrn/eNV7tjCaOW6rb2q4Jv8T4YZZonrKSRFkzRa+O
        wvalgetE49rDr6uc5n+vgI8XVuoEdUeB+eevlQlWp+gEcdOuXfBL7RuQFXRkoyr0x/ZG/15TOB2eO
        rCYuKDN7Z5Dj77qWtDIYCbolReXR0I5TMhcIBLrfPIDRQnY6P0OsMkXCPkZTSetLooEV/vcHHe80u
        Yd3vKu0g2/p0s31fQa5OsKyLkO4zEEHJnKPa+QdSJ/q/X0BZCsaKIBMrwgGtKVN+H2IrTLsXFfIWK
        gV+88ruw==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1p3R7t-007U9B-Gp; Fri, 09 Dec 2022 00:20:29 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH] clk: nomadik: correct struct name kernel-doc warning
Date:   Thu,  8 Dec 2022 16:20:16 -0800
Message-Id: <20221209002016.14776-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use the correct struct name for the kernel-doc notation to prevent
a kernel-doc warning:

clk-nomadik.c:148: warning: expecting prototype for struct clk_pll1. Prototype was for struct clk_pll instead

Fixes: ef6eb322ce57 ("clk: nomadik: implement the Nomadik clocks properly")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/clk-nomadik.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
--- a/drivers/clk/clk-nomadik.c
+++ b/drivers/clk/clk-nomadik.c
@@ -138,7 +138,7 @@ out_put:
 }
 
 /**
- * struct clk_pll1 - Nomadik PLL1 clock
+ * struct clk_pll - Nomadik PLL clock
  * @hw: corresponding clock hardware entry
  * @id: PLL instance: 1 or 2
  */
