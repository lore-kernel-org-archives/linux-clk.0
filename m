Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD73C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 11:24:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 527502184E
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 11:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="pigx0JnH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbeLRLYG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 06:24:06 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:60342 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726430AbeLRLYG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Dec 2018 06:24:06 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 43Jwbx1D9Dz1f;
        Tue, 18 Dec 2018 12:22:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1545132157; bh=LoiL0Ir2qotlSd4J6F6YKsc3OqiC7BOqc1ue5iQ2gtE=;
        h=Date:From:Subject:To:Cc:From;
        b=pigx0JnHuPz++WuMHysiiZ1dS2MvSSSmGKgcey1ScdcVrvpBh4iA/HeNXwNMKWuf/
         qPUdwpnvqaBE0tJoibJjrF4g5X45awcaL+J8Wftbknp8FaW7cnn8DkRrBqFUYdDS+x
         hJ9N+gUwAmSNTGqmAbEs1MWFxhQxY0ttY/1Uf+ODhOKYnul7gaTGSHepC5NReqHkii
         WxaeLtLwIabHn+XtqasNf9I59FXHiyp37gJGGpDqBj8N58Qfv59vTVoXtXJ4PhEmqC
         gUQoPnuSlUrJdUMFPheAYn6e9fX++WV36GSB6qkru5c4HjGXnQKreYWgg2TlV/Z3GO
         I1NY4/MdDm9Tg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.2 at mail
Date:   Tue, 18 Dec 2018 12:24:03 +0100
Message-Id: <1-28c5791f73370d0aa8cbb57af796b61de2b21238.1545131728.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [RESEND PATCH v3] clk: at91: enable AUDIOPLL as source for PCKx on SAMA5D2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Datasheet for SAMA5D2x mentions 6 sources for PCKx, the last being AUDIOPLL.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

---
 v2: rebased for 4.20-rc7
 v3: rewritten for 4.21
---
 drivers/clk/at91/sama5d2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index d69ad96fe988..ade063622531 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -241,13 +241,14 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
 	parent_names[4] = "mck";
+	parent_names[5] = "audiopll_pmcck";
 	for (i = 0; i < 3; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, 5, i,
+						    parent_names, 6, i,
 						    &at91sam9x5_programmable_layout);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.19.2

