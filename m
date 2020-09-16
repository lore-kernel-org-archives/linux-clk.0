Return-Path: <SRS0=aoxw=CZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0CBC433E2
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 17:19:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E76DB223E8
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 17:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600276780;
	bh=emKeJfqvDoedmaV7D7ybSVhoskDg33Cwui711fLeBAc=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=ELb/aZI+bQ4UiLGHJaOhJR+yXtBp6XDmtVdHTYZaFoxJ9MBMUwQRGSqbws4OhfqxF
	 arlULJ23TkyqQ0HbLNT/MzWaoYL8DJor57mMZxkKwZF0tw2aitxRvAbOPIfOVPAiup
	 oW12ICFuuXEtpOmMllOcjhqtcgS+X+9Ti3k0jzSo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgIPRTh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Sep 2020 13:19:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:33728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726808AbgIPRN6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Sep 2020 13:13:58 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2145722583;
        Wed, 16 Sep 2020 16:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273068;
        bh=emKeJfqvDoedmaV7D7ybSVhoskDg33Cwui711fLeBAc=;
        h=From:To:Cc:Subject:Date:From;
        b=yMqF+IBxrPF4V/UNukCr3rPJT9I0mnggrGWVW7znhkNMLFXKgAFcU4K3du0FqwdvG
         3sDkU4zNmmdOuyEj/s8wNseVmpMuKU8aSj2lJj8f9E2CSMJ+VwBi3ce+d3C77ooOrk
         OBggc710uJBnD9XqRq252XevLaXDyG3SGB424/Rs=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, Heiko Stuebner <heiko@sntech.de>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/6] clk: at91: drop unused at91sam9g45_pcr_layout
Date:   Wed, 16 Sep 2020 18:17:35 +0200
Message-Id: <20200916161740.14173-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The at91sam9g45_pcr_layout is not used so drop it to fix build warning:

  drivers/clk/at91/at91sam9g45.c:49:36: warning:
    'at91sam9g45_pcr_layout' defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/clk/at91/at91sam9g45.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index c88ee20bee31..cb4a406ed15d 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -46,13 +46,6 @@ static const struct {
 	{ .n = "pck1",  .p = "prog1",    .id = 9 },
 };
 
-static const struct clk_pcr_layout at91sam9g45_pcr_layout = {
-	.offset = 0x10c,
-	.cmd = BIT(12),
-	.pid_mask = GENMASK(5, 0),
-	.div_mask = GENMASK(17, 16),
-};
-
 struct pck {
 	char *n;
 	u8 id;
-- 
2.17.1

