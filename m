Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4486C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 07:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 952CA613DB
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 07:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244554AbhI2HQT convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Sep 2021 03:16:19 -0400
Received: from mail.shanghaitech.edu.cn ([119.78.254.11]:6504 "EHLO
        mail.shanghaitech.edu.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244486AbhI2HQS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Sep 2021 03:16:18 -0400
X-Greylist: delayed 924 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 Sep 2021 03:16:18 EDT
Received: from [10.15.44.215] by mail.shanghaitech.edu.cn with MESSAGESEC ESMTP id 480409677184998;
        Wed, 29 Sep 2021 14:58:48 +0800 (CST)
Received: from DESKTOP-FOJ6ELG.localdomain (10.15.44.220) by
 smtp.shanghaitech.edu.cn (10.15.44.215) with Microsoft SMTP Server (TLS) id
 14.3.399.0; Wed, 29 Sep 2021 14:58:48 +0800
From:   Mianhan Liu <liumh1@shanghaitech.edu.cn>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-actions@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Mianhan Liu <liumh1@shanghaitech.edu.cn>
Subject: [PATCH -next] clk/actions/owl-factor.c: remove superfluous headers
Date:   Wed, 29 Sep 2021 14:58:24 +0800
Message-ID: <20210929065824.23691-1-liumh1@shanghaitech.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain
X-Originating-IP: [10.15.44.220]
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

owl-factor.c hasn't use any macro or function declared in linux/slab.h.
Thus, these files can be removed from owl-factor.c safely without
affecting the compilation of the ./drivers/clk module

Signed-off-by: Mianhan Liu <liumh1@shanghaitech.edu.cn>

---
 drivers/clk/actions/owl-factor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/actions/owl-factor.c b/drivers/clk/actions/owl-factor.c
index f15e2621f..64f316cf7 100644
--- a/drivers/clk/actions/owl-factor.c
+++ b/drivers/clk/actions/owl-factor.c
@@ -10,7 +10,6 @@
 
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/slab.h>
 
 #include "owl-factor.h"
 
-- 
2.25.1


