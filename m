Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DA6C4338F
	for <linux-clk@archiver.kernel.org>; Sat, 31 Jul 2021 13:30:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6CEC61040
	for <linux-clk@archiver.kernel.org>; Sat, 31 Jul 2021 13:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbhGaNa6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 31 Jul 2021 09:30:58 -0400
Received: from smtpbg128.qq.com ([106.55.201.39]:56836 "EHLO smtpbg587.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232211AbhGaNa5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 31 Jul 2021 09:30:57 -0400
X-Greylist: delayed 494 seconds by postgrey-1.27 at vger.kernel.org; Sat, 31 Jul 2021 09:30:57 EDT
X-QQ-mid: bizesmtp48t1627737750t6rk1zvp
Received: from ficus.lan (unknown [171.223.99.141])
        by esmtp6.qq.com (ESMTP) with 
        id ; Sat, 31 Jul 2021 21:22:29 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: OE6UcXCtsg1QFXTvla4hIX74f28bCKMkTmzAGhG7zd6xyGFE5zEhbXQ4eSWZ4
        KXqi170W5oXlMT9is9ukLCJm8zMt6eAjZ7PYrmGwocC+25G67bMkudhT0zQuzGk0ogdBuSd
        iV0t1CBKteSESA1MZD8khP9cF8Jc12F7zmjICpjPHxoesWvGrosqBkQWdhJ8xDm3Dc/nxLd
        wzzyZNxSvMyWodhecSd9kBp7dvprjFJ/p8u0BW9rvKuF1eA9SqVuutbeNUz5DQ7YJivymnG
        oDne0oBUsvQfasqFVWiYEGttyALr9vRDHX/OBZOofL/QlmiLbwo/tQUpjqRzFui9iyMncjr
        8wpoIDznR6bgX5S3aA=
X-QQ-GoodBg: 0
From:   Jason Wang <wangborong@cdjrlc.com>
To:     sboyd@kernel.org
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] clk: palmas: Add a missing SPDX license header
Date:   Sat, 31 Jul 2021 21:22:26 +0800
Message-Id: <20210731132226.424853-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam5
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the missing SPDX license header to drivers/clk/clk-palmas.c.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/clk/clk-palmas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index e41a3a9f7528..84dcb1aca4a5 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Clock driver for Palmas device.
  *
-- 
2.32.0

