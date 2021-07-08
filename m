Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F7AC07E96
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jul 2021 08:16:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E34961CE8
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jul 2021 08:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhGHITV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jul 2021 04:19:21 -0400
Received: from m12-17.163.com ([220.181.12.17]:51249 "EHLO m12-17.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231192AbhGHITU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Jul 2021 04:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kcYGs
        PzfsZlyhcUFg4rflfnBWa3H0eyFNFoxec1S+6Y=; b=nQvc5tUTjGH1OLSZ7UR5y
        gMc82rXcFAj3n804Cvcs10BmbjupCPkgNOWDRF9Mp6wuUNVarvktX3g13BTbCIp4
        23BRtd0shZIxy7c7khwRHiVGjFZv1C6YFp8/hJd/YzDPO4DzEHdIJ2RiLz09Acjx
        QaXqBPpimjgGVRMc/CEBm8=
Received: from localhost (unknown [116.21.252.58])
        by smtp13 (Coremail) with SMTP id EcCowADX1o4ytOZg7j2u_g--.6376S2;
        Thu, 08 Jul 2021 16:15:46 +0800 (CST)
From:   Rudy Lo <luhuadong@163.com>
Cc:     luhuadong@163.com, Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx8: Unified initcall function
Date:   Thu,  8 Jul 2021 16:15:42 +0800
Message-Id: <20210708081543.186820-1-luhuadong@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowADX1o4ytOZg7j2u_g--.6376S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFy5tFWDKFWkur18JryxXwb_yoW5GF15pF
        4UGrW7Ar18WF4xZ3ZrAr4UZFyYya42qa4j9Fy7A34F9395AFyDWF10qa48Zr1DJr45Wr1f
        t34jvr4I9F4avr7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTGQgUUUUU=
X-Originating-IP: [116.21.252.58]
X-CM-SenderInfo: 5oxk3tpgrqwqqrwthudrp/xtbByRnJx11vlH8TcgAAsm
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It is better to use builtin_platform_driver initcall for clk driver
rather then module_platform_driver, refer to clk-imx8qxp.c file.

Signed-off-by: Rudy Lo <luhuadong@163.com>
---
 drivers/clk/imx/clk-imx8mm.c | 2 +-
 drivers/clk/imx/clk-imx8mn.c | 2 +-
 drivers/clk/imx/clk-imx8mp.c | 2 +-
 drivers/clk/imx/clk-imx8mq.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index f1919fafb124..fa20b08e64f1 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -654,7 +654,7 @@ static struct platform_driver imx8mm_clk_driver = {
 		.of_match_table = imx8mm_clk_of_match,
 	},
 };
-module_platform_driver(imx8mm_clk_driver);
+builtin_platform_driver(imx8mm_clk_driver);
 
 MODULE_AUTHOR("Bai Ping <ping.bai@nxp.com>");
 MODULE_DESCRIPTION("NXP i.MX8MM clock driver");
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 88f6630cd472..67b9ded112e4 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -605,7 +605,7 @@ static struct platform_driver imx8mn_clk_driver = {
 		.of_match_table = imx8mn_clk_of_match,
 	},
 };
-module_platform_driver(imx8mn_clk_driver);
+builtin_platform_driver(imx8mn_clk_driver);
 
 MODULE_AUTHOR("Anson Huang <Anson.Huang@nxp.com>");
 MODULE_DESCRIPTION("NXP i.MX8MN clock driver");
diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 12837304545d..cdb40e61cef0 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -735,7 +735,7 @@ static struct platform_driver imx8mp_clk_driver = {
 		.of_match_table = imx8mp_clk_of_match,
 	},
 };
-module_platform_driver(imx8mp_clk_driver);
+builtin_platform_driver(imx8mp_clk_driver);
 
 MODULE_AUTHOR("Anson Huang <Anson.Huang@nxp.com>");
 MODULE_DESCRIPTION("NXP i.MX8MP clock driver");
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index c491bc9c61ce..54f17de30935 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -630,7 +630,7 @@ static struct platform_driver imx8mq_clk_driver = {
 		.of_match_table = imx8mq_clk_of_match,
 	},
 };
-module_platform_driver(imx8mq_clk_driver);
+builtin_platform_driver(imx8mq_clk_driver);
 
 MODULE_AUTHOR("Abel Vesa <abel.vesa@nxp.com>");
 MODULE_DESCRIPTION("NXP i.MX8MQ clock driver");
-- 
2.25.1


