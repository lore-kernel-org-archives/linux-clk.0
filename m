Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:37578 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbeHQEqP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Aug 2018 00:46:15 -0400
Received: by mail-pl0-f68.google.com with SMTP id d5-v6so2955888pll.4
        for <linux-clk@vger.kernel.org>; Thu, 16 Aug 2018 18:44:52 -0700 (PDT)
Received: from localhost.localdomain ([2402:f000:1:1501:200:5efe:a66f:53fa])
        by smtp.gmail.com with ESMTPSA id s16-v6sm724627pfd.0.2018.08.16.18.44.50
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 18:44:51 -0700 (PDT)
From: Jiecheng Wu <jasonwood2031@gmail.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH] clk-pxa.c: fix missing return value check of kzalloc()
Date: Fri, 17 Aug 2018 09:44:36 +0800
Message-Id: <20180817014436.6104-1-jasonwood2031@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Function clk_pxa_cken_init() defined in drivers/clk/pxa/clk-pxa.c calls kzalloc() to allocate memory for struct pxa_clk which is dereferenced immediately. As kzalloc() may return NULL when OOM happens, this code piece may cause NULL pointer dereference bug.
---
 drivers/clk/pxa/clk-pxa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index b80dc9d..97485a5 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -105,6 +105,8 @@ int __init clk_pxa_cken_init(const struct desc_clk_cken *clks, int nb_clks)
 
 	for (i = 0; i < nb_clks; i++) {
 		pxa_clk = kzalloc(sizeof(*pxa_clk), GFP_KERNEL);
+		if (!pxa_clk)
+			return ERR_PTR(-ENOMEM);
 		pxa_clk->is_in_low_power = clks[i].is_in_low_power;
 		pxa_clk->lp = clks[i].lp;
 		pxa_clk->hp = clks[i].hp;
-- 
2.6.4
