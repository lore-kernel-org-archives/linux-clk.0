Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2345BC83F10
	for <linux-clk@archiver.kernel.org>; Thu, 31 Aug 2023 12:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjHaMhq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Aug 2023 08:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjHaMhp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2023 08:37:45 -0400
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012C11A4
        for <linux-clk@vger.kernel.org>; Thu, 31 Aug 2023 05:37:41 -0700 (PDT)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.tkos.co.il (Postfix) with ESMTPS id 668D1440E97;
        Thu, 31 Aug 2023 15:36:53 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1693485413;
        bh=u9PDMOSsSGf5H56JEkNiTBDH9/HwDRDbJZivDGYpiIM=;
        h=From:To:Cc:Subject:Date:From;
        b=scfIhosNxAGeBxKqeSheoAFnbNY2f9tIOB5IRuxS14y8znd2ROlyR6GFUCRkr6Xzp
         zx1OoMSuXFfJz42oi5rp7SvfDpVZKOw9y/E5xm35BmkXRhcF+ExQ6o1oWXp8wd8lEY
         Cr/C+XBF0r0xH2h+io9ufeYSy+cE+88mN/V4QgQiqAXMSYnOnhuwFCSl2h3OicNqWB
         nAwuf0k+SopqsQnPee0i3SegTYSkzq5DsfBgT/1ec0e7SeThkxm1/NnD3pMn6rDMoZ
         TS81R1sScVU4Oyjg9othEOE4Mtsm2XJYa8rRIxti47SRMfOSmiCaL1YuGAkRR0VpSh
         kldyhDG/50niw==
From:   Baruch Siach <baruch@tkos.co.il>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2] clk: gate: fix comment typo and grammar
Date:   Thu, 31 Aug 2023 15:36:55 +0300
Message-Id: <d47978a09dd0320f9929a19fa3e829608a02b224.1693485415.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change ouput -> output.

While at it change also grammatically incorrect "it's" to "its".

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:

  Add a grammar fix

  Add commit description (Abel Vesa)
---
 drivers/clk/clk-gate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 64283807600b..68e585a02fd9 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -15,7 +15,7 @@
 #include <linux/string.h>
 
 /**
- * DOC: basic gatable clock which can gate and ungate it's ouput
+ * DOC: basic gatable clock which can gate and ungate its output
  *
  * Traits of this clock:
  * prepare - clk_(un)prepare only ensures parent is (un)prepared
-- 
2.40.1

