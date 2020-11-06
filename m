Return-Path: <SRS0=zIv1=EM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21930C2D0A3
	for <linux-clk@archiver.kernel.org>; Fri,  6 Nov 2020 09:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7B2620A8B
	for <linux-clk@archiver.kernel.org>; Fri,  6 Nov 2020 09:47:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="VvXDXVUe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgKFJrJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Nov 2020 04:47:09 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:60425 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbgKFJrH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Nov 2020 04:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1604656026; x=1636192026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=jpoo8lswkA0HTqIME8fJoefP6IOmvgmdgVpF/Ams+UA=;
  b=VvXDXVUenQCxmXko5innt/1vG08pBgHLNZSe3c+J3oixNlbn1grkSmSF
   XSIYRULoTjBrv5j99aqh7lfSo1HdnXwGmZTeJrptsXZ8SxoUhn+8Ii5qr
   5duev4APECqUgTtTVI2eK7MhpZyINlCUUZGzEm8fFYfeyJ30GSi8ycEvo
   pwy3lrgCjs+tMooLkuCLGf4xmU1zUqlN5NzLBMaC+zcDBrx0UCXNNVKXc
   fT08OXc63p1OkqbWmBI9yTdnTd7bg5wjyG+1b7pYP5d47UUW1d2ibC4v+
   +/cpC67Uw1sr0S3HPh/5inlPX4mnLpa0NcNd9WIo06Fhdp4bRSpZ2ifHH
   A==;
IronPort-SDR: orh4IzbvH8+Z32NLqmAEYhBzLmWibX8zV7E7eVSn6NmRbwAwSWaVnoMfFNFa18nL+kccwSKi4n
 u9ep4bfxKjGguu8zMhcJ52IKLwMM5KQ4KrYDkm1fhgryJrHgGgUsfaotRXP0DaLEfQxy6RTnST
 wHds/woHpJDFYeHhPG2IlhzHjLVF4rFZa2Pa87eVHNmOc/J1knoIAv5NwAkn02jG+1m4iooXua
 +50aYong8zmXiNVAe33aRxeNw6GA50ZABNruaXnclA1tBwfOZYvdgdvq0h9lYscxcMTuHp5TRj
 eCk=
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; 
   d="scan'208";a="32680448"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Nov 2020 02:47:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 6 Nov 2020 02:47:04 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 6 Nov 2020 02:46:59 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>
CC:     <eugen.hristev@microchip.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v4 05/11] clk: at91: sama7g5: add 5th divisor for mck0 layout and characteristics
Date:   Fri, 6 Nov 2020 11:46:22 +0200
Message-ID: <1604655988-353-6-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604655988-353-1-git-send-email-claudiu.beznea@microchip.com>
References: <1604655988-353-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

This SoC has the 5th divisor for the mck0 master clock.
Adapt the characteristics accordingly.

Reported-by: Mihai Sain <mihai.sain@microchip.com>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/sama7g5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index d3c3469d47d9..d685e22b2014 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -775,13 +775,13 @@ static const struct clk_pll_characteristics pll_characteristics = {
 /* MCK0 characteristics. */
 static const struct clk_master_characteristics mck0_characteristics = {
 	.output = { .min = 140000000, .max = 200000000 },
-	.divisors = { 1, 2, 4, 3 },
+	.divisors = { 1, 2, 4, 3, 5 },
 	.have_div3_pres = 1,
 };
 
 /* MCK0 layout. */
 static const struct clk_master_layout mck0_layout = {
-	.mask = 0x373,
+	.mask = 0x773,
 	.pres_shift = 4,
 	.offset = 0x28,
 };
-- 
2.7.4

