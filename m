Return-Path: <SRS0=aoxw=CZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0A6C433E2
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 20:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE13221941
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 20:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600288224;
	bh=rDklET3URHRDBZEvF6OLfVutgrEE+P7xngbDw3ovJPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=deq/iTuL8PuB6wJ0gtRd0y8JJu7xw2jly5lnkqfMlvEW/EA4vDybyELCAq0OLuLzE
	 elQacYBnOv6I+CQfIr4rAcGMoOWxdMrBGgwrwgXGklLkyz7igchDdXONlVblDjdwcM
	 UerzW7nQzZwLt/1zOLr1+rE20h8KOScKIGJ1Mqh0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbgIPUaS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:30:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:33730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbgIPRM6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Sep 2020 13:12:58 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D510222596;
        Wed, 16 Sep 2020 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273084;
        bh=rDklET3URHRDBZEvF6OLfVutgrEE+P7xngbDw3ovJPk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c2qzRyizp/VEct8ssgms7hbJXVwjVImM85Q7xFsmmmORaJJoUfwUgoBGEFqi0by2T
         G5IZj2iDxNypoGC+dc+C7hgmzL2KBMi2fi4175i+oyaRfPHYbrPLSGxuuLOR8gaieR
         ArI/ZIcqrnWAWOtZotaHfvbhZ+dh7bfZdpN9lSwo=
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
Subject: [PATCH 5/6] clk: si5341: drop unused 'err' variable
Date:   Wed, 16 Sep 2020 18:17:39 +0200
Message-Id: <20200916161740.14173-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916161740.14173-1-krzk@kernel.org>
References: <20200916161740.14173-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

'err' is assigned but never read:

  /drivers/clk/clk-si5341.c: In function ‘si5341_output_get_parent’:
  drivers/clk/clk-si5341.c:886:6: warning: variable ‘err’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk-si5341.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 3d7acab9d280..e0446e66fa64 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -883,11 +883,9 @@ static int si5341_output_set_parent(struct clk_hw *hw, u8 index)
 static u8 si5341_output_get_parent(struct clk_hw *hw)
 {
 	struct clk_si5341_output *output = to_clk_si5341_output(hw);
-	int err;
 	u32 val;
 
-	err = regmap_read(output->data->regmap,
-			SI5341_OUT_MUX_SEL(output), &val);
+	regmap_read(output->data->regmap, SI5341_OUT_MUX_SEL(output), &val);
 
 	return val & 0x7;
 }
-- 
2.17.1

