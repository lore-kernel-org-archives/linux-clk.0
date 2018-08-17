Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:33377 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbeHQLNx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Aug 2018 07:13:53 -0400
Received: by mail-pl0-f67.google.com with SMTP id b90-v6so3386081plb.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Aug 2018 01:11:28 -0700 (PDT)
Received: from localhost.localdomain ([2402:f000:1:1501:200:5efe:a66f:53fa])
        by smtp.gmail.com with ESMTPSA id v140-v6sm1814844pgb.45.2018.08.17.01.11.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 01:11:27 -0700 (PDT)
From: Jiecheng Wu <jasonwood2031@gmail.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH] clk-wm831x.c: fix wrong return value when wm831x_reg_read() fails
Date: Fri, 17 Aug 2018 16:11:17 +0800
Message-Id: <20180817081117.15256-1-jasonwood2031@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Function wm831x_fll_is_prepared() defined in drivers/clk/clk-wm831x.c returns true when function wm831x_reg_read() fails (should return false).
---
 drivers/clk/clk-wm831x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-wm831x.c b/drivers/clk/clk-wm831x.c
index 1467695..11c2d19 100644
--- a/drivers/clk/clk-wm831x.c
+++ b/drivers/clk/clk-wm831x.c
@@ -79,7 +79,7 @@ static int wm831x_fll_is_prepared(struct clk_hw *hw)
 	if (ret < 0) {
 		dev_err(wm831x->dev, "Unable to read FLL_CONTROL_1: %d\n",
 			ret);
-		return true;
+		return false;
 	}
 
 	return (ret & WM831X_FLL_ENA) != 0;
-- 
2.6.4
