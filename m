Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561A3ECAAA1
	for <linux-clk@archiver.kernel.org>; Wed,  7 Sep 2022 02:13:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiIGCNQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Sep 2022 22:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiIGCNP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Sep 2022 22:13:15 -0400
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E188A6CA;
        Tue,  6 Sep 2022 19:13:14 -0700 (PDT)
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id BBU00010;
        Wed, 07 Sep 2022 10:13:10 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201619.home.langchao.com (10.100.2.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 10:13:11 +0800
From:   Deming Wang <wangdeming@inspur.com>
To:     <david@lechnology.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <nsekhar@ti.com>
CC:     <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Deming Wang <wangdeming@inspur.com>
Subject: [PATCH] clk: davinci: Fix spelling typo in comment.
Date:   Tue, 6 Sep 2022 09:27:30 -0400
Message-ID: <20220906132730.3977-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.200.104.82]
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201619.home.langchao.com (10.100.2.19)
tUid:   2022907101310cd91f230c681606fd029c6306301c4e5
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Modify the maxiumum to maximum.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 drivers/clk/davinci/pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index 082206676e73..f862f5e2b3fc 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -98,7 +98,7 @@
  * @hw: clk_hw for the pll
  * @base: Base memory address
  * @pllm_min: The minimum allowable PLLM[PLLM] value
- * @pllm_max: The maxiumum allowable PLLM[PLLM] value
+ * @pllm_max: The maximum allowable PLLM[PLLM] value
  * @pllm_mask: Bitmask for PLLM[PLLM] value
  */
 struct davinci_pll_clk {

base-commit: 840126e36e8ff272cb63158646433fa1324533d9
-- 
2.27.0

