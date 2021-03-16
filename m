Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE44BC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 16 Mar 2021 03:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6816864F5D
	for <linux-clk@archiver.kernel.org>; Tue, 16 Mar 2021 03:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbhCPDIN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Mar 2021 23:08:13 -0400
Received: from mail-m974.mail.163.com ([123.126.97.4]:33626 "EHLO
        mail-m974.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbhCPDHm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Mar 2021 23:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=5Cgu6xM3YdOMKirkPw
        q9NSp31nECUIkTOvEBQfTDJEo=; b=JfxrvrMw511eVt8qWJN9Bhyqo/kSHyz7FW
        IHecq2QSnm7WrJnnW8QFnfBOqGGZ1Helyh94zr89O9gzlhViRXOmxSeOajtOaEx/
        E7i609huXKw6piqB9jADtJ3HHn6USB/x5iX5NG74CYY5jid8SxTC2dnj/aM9umag
        VsjOVXIo8=
Received: from bf-rmnj-02.ccdomain.com (unknown [218.94.48.178])
        by smtp4 (Coremail) with SMTP id HNxpCgAHJCHZIFBgqOpIEg--.1073S2;
        Tue, 16 Mar 2021 11:07:11 +0800 (CST)
From:   Jian Dong <dj0227@163.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com
Cc:     huyue2@yulong.com, linux-clk@vger.kernel.org,
        dongjian <dongjian@yulong.com>
Subject: [PATCH] clk: at91: clk-programmable: remove redundant value check of best_rate
Date:   Tue, 16 Mar 2021 11:07:25 +0800
Message-Id: <1615864045-182813-1-git-send-email-dj0227@163.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: HNxpCgAHJCHZIFBgqOpIEg--.1073S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1DJF17ArW3tFyrCry8Xwb_yoWDGFg_ur
        y3Xr1kJryF9w4jyF1qq3WayrWq9a4DZrnruF9Iv39xKry8Xws8WFZ29ws0kr17CF4DCr90
        gwnrK3Wj9ryUZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0_9N7UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/1tbiqB9X3Vc7T8E8tQAAsW
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: dongjian <dongjian@yulong.com>

for best_rate's initial value is -EINVAL, if get tmp_rate belongs to
[0, req-rate] at first time, then best_rate will be updated to a positive
value, the value check will never run;
if never get the tmp_rate belongs to [0, req-rate], then first cycle will
end when parent get NULL, the best_rate value check also will never run.
So, the value check is redundant.

Signed-off-by: dongjian <dongjian@yulong.com>
---
 drivers/clk/at91/clk-programmable.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index fcf8f6a..5daf361e 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -87,9 +87,6 @@ static int clk_programmable_determine_rate(struct clk_hw *hw,
 			req->best_parent_rate = parent_rate;
 			req->best_parent_hw = parent;
 		}
-
-		if (!best_rate)
-			break;
 	}
 
 	if (best_rate < 0)
-- 
1.9.1

