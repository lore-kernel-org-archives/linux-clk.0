Return-Path: <SRS0=QWvG=PP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E537C43387
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jan 2019 13:52:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF0542089F
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jan 2019 13:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbfAGNwV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Jan 2019 08:52:21 -0500
Received: from www1102.sakura.ne.jp ([219.94.129.142]:36057 "EHLO
        www1102.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbfAGNwV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Jan 2019 08:52:21 -0500
X-Greylist: delayed 1830 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Jan 2019 08:52:20 EST
Received: from fsav305.sakura.ne.jp (fsav305.sakura.ne.jp [153.120.85.136])
        by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x07DLdVp000356;
        Mon, 7 Jan 2019 22:21:39 +0900 (JST)
        (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav305.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav305.sakura.ne.jp);
 Mon, 07 Jan 2019 22:21:39 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav305.sakura.ne.jp)
Received: from localhost.localdomain (183.38.232.153.ap.dti.ne.jp [153.232.38.183])
        (authenticated bits=0)
        by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x07DLY0H000344
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Mon, 7 Jan 2019 22:21:39 +0900 (JST)
        (envelope-from katsuhiro@katsuster.net)
From:   Katsuhiro Suzuki <katsuhiro@katsuster.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: [PATCH] clk: fractional-divider: check parent rate only for general approximation
Date:   Mon,  7 Jan 2019 22:21:24 +0900
Message-Id: <20190107132124.27788-1-katsuhiro@katsuster.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Custom approximation of fractional-divider may not need parent clock
rate checking. For example Rockchip SoCs work fine using grand parent
clock rate evne if target rate is greater than parent.

This patch removes parent clock rate check from custom approximation.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
---
 drivers/clk/clk-fractional-divider.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 545dceec0bbf..b0fc5509e0ff 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -79,13 +79,17 @@ static long clk_fd_round_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long m, n;
 	u64 ret;
 
-	if (!rate || rate >= *parent_rate)
+	if (!rate)
 		return *parent_rate;
 
-	if (fd->approximation)
+	if (fd->approximation) {
 		fd->approximation(hw, rate, parent_rate, &m, &n);
-	else
+	} else {
+		if (rate >= *parent_rate)
+			return *parent_rate;
+
 		clk_fd_general_approximation(hw, rate, parent_rate, &m, &n);
+	}
 
 	ret = (u64)*parent_rate * m;
 	do_div(ret, n);
-- 
2.20.1

