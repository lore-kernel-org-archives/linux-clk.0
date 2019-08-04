Return-Path: <SRS0=tmg9=WA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBB1C433FF
	for <linux-clk@archiver.kernel.org>; Sun,  4 Aug 2019 16:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC0D52086D
	for <linux-clk@archiver.kernel.org>; Sun,  4 Aug 2019 16:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tbVTBZFx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfHDQ2i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Aug 2019 12:28:38 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40190 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDQ2i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Aug 2019 12:28:38 -0400
Received: by mail-pl1-f196.google.com with SMTP id a93so35435665pla.7
        for <linux-clk@vger.kernel.org>; Sun, 04 Aug 2019 09:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IG2IjwZHK0Ptfc1mP6HUukSkG9ms4gEWIqgeJEd5j6Q=;
        b=tbVTBZFxt5RO3JKEH10p7iE8nGVKz/pzRNEqG0TbhItNCSrI5Kf4jB61JWW0D1zTbj
         lsDw6iA3U6CFXgNNRdYL/2o582kbzWwe4sITYHzPAuA6+ni8maQF0s9YaSXUeUl81+pG
         +hhCX9hpWvwKBEwFgOV4om4OrTTuISjQ+TXRZwVellLzJf67Hf8bE8qi6PJ4JojHQcJj
         6CXv948XwDwenThwv9HryYXoh9/dJVCP+HvkniNefKQsIan7bWU07H8kb7BNFDgLO9Ar
         F9sc2glPGujVMgHcEXsezNKfsiwtK/T1WTTExqIOWCB9yMjm2rErE4TJL87SXM7OyeTX
         RWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IG2IjwZHK0Ptfc1mP6HUukSkG9ms4gEWIqgeJEd5j6Q=;
        b=bWOgQfPtjLRrJLujEb714eazsk/gkj0Ctaq3RQLxzjPq2r8mcx+C2BVKJvIpj5f0fU
         WGxU0Fn2kIlx4tN+S7hY+3TQEaFLe138CJl0s4WPpuOuSSsm+jCEyqUDjuSNo9AlY3Gw
         ufv5WTKeCtlRuf9cWpCRqWLjHdLa38cCGfmOnHyaXIMgZH9Mq9n2lPRMCm1gJW94DAZX
         ALZsqdTSIE2NjtkVSzFsJZV9VglYFYSSF6fjyEC3p4zYePPP8xa06cSy00DMCM2Wutol
         tZKCfiFDZuHk7/PZdcBTOTcaNbPG4LBj/Oc/tdGdnNH7jFUwN4JKMlr/agq5FlH8KnZK
         hhAg==
X-Gm-Message-State: APjAAAXJoZhaxBL0w03VC0qwhy6NSg53qaxSDscrCiQ63wkLyu8HVfpG
        TlkwLTk3GgJrJrGreiX7J8ku/873MLo=
X-Google-Smtp-Source: APXvYqytKlylOAn/Lr8nQvLxpRJRmEN6QJwzKjjw+bjfeqEqzXKvUYJddd2u0JsA174M4B3yGVKcqg==
X-Received: by 2002:a17:902:82c4:: with SMTP id u4mr140638453plz.196.1564936117493;
        Sun, 04 Aug 2019 09:28:37 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id g18sm127504844pgm.9.2019.08.04.09.28.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 09:28:37 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     david@lechnology.com, nsekhar@ti.com, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] clk: davinci: pll: Add of_node_put() in of_davinci_pll_init()
Date:   Sun,  4 Aug 2019 21:58:24 +0530
Message-Id: <20190804162824.6338-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The variable child in the function of_davinci_pll_init takes the value
of of_get_child_by_name, which gets a node but does not put it. If child
is not put before the function returns it may cause a memory leak. Hence
put child before two return statements.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/clk/davinci/pll.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index 1c99e992d638..1ac11b6a47a3 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -778,12 +778,15 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 		int i;
 
 		clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
-		if (!clk_data)
+		if (!clk_data) {
+			of_node_put(child);
 			return -ENOMEM;
+		}
 
 		clks = kmalloc_array(n_clks, sizeof(*clks), GFP_KERNEL);
 		if (!clks) {
 			kfree(clk_data);
+			of_node_put(child);
 			return -ENOMEM;
 		}
 
-- 
2.19.1

