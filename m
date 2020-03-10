Return-Path: <SRS0=pXcS=43=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6429CC10F27
	for <linux-clk@archiver.kernel.org>; Tue, 10 Mar 2020 13:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43F7A21D7E
	for <linux-clk@archiver.kernel.org>; Tue, 10 Mar 2020 13:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgCJNzK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Mar 2020 09:55:10 -0400
Received: from mga11.intel.com ([192.55.52.93]:1647 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726316AbgCJNzK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Mar 2020 09:55:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 06:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; 
   d="scan'208";a="443171684"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2020 06:55:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D7525193; Tue, 10 Mar 2020 15:55:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] clk: Fix trivia typo in comment exlusive => exclusive
Date:   Tue, 10 Mar 2020 15:55:07 +0200
Message-Id: <20200310135507.87959-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix trivia typo in comment exlusive => exclusive.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f122e9911b57..39c59f063aa0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -774,7 +774,7 @@ static void clk_core_rate_restore_protect(struct clk_core *core, int count)
  * clk_rate_exclusive_get - get exclusivity over the clk rate control
  * @clk: the clk over which the exclusity of rate control is requested
  *
- * clk_rate_exlusive_get() begins a critical section during which a clock
+ * clk_rate_exclusive_get() begins a critical section during which a clock
  * consumer cannot tolerate any other consumer making any operation on the
  * clock which could result in a rate change or rate glitch. Exclusive clocks
  * cannot have their rate changed, either directly or indirectly due to changes
-- 
2.25.1

