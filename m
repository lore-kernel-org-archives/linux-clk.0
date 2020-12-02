Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9F4C64E7C
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 16:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B743921D7A
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 16:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730629AbgLBQSc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Dec 2020 11:18:32 -0500
Received: from mailoutvs44.siol.net ([185.57.226.235]:48973 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728611AbgLBQSb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Dec 2020 11:18:31 -0500
X-Greylist: delayed 415 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Dec 2020 11:18:31 EST
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id A022E520516;
        Wed,  2 Dec 2020 17:10:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id hmIEAFM6fW50; Wed,  2 Dec 2020 17:10:54 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 50050520F6E;
        Wed,  2 Dec 2020 17:10:54 +0100 (CET)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 8F76E520516;
        Wed,  2 Dec 2020 17:10:51 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Icenowy Zheng <icenowy@aosc.xyz>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Yangtao Li <frank@allwinnertech.com>,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/8] clk: sunxi-ng: h6: Fix clock divider range on some clocks
Date:   Wed, 02 Dec 2020 17:17:03 +0100
Message-ID: <2017247.PyFJg3gf1G@kista>
In-Reply-To: <20201202135409.13683-2-andre.przywara@arm.com>
References: <20201202135409.13683-1-andre.przywara@arm.com> <20201202135409.13683-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dne sreda, 02. december 2020 ob 14:54:02 CET je Andre Przywara napisal(a):
> While comparing clocks between the H6 and H616, some of the M factor
> ranges were found to be wrong: the manual says they are only covering
> two bits [1:0], but our code had "5" in the number-of-bits field.
> 
> By writing 0xff into that register in U-Boot and via FEL, it could be
> confirmed that bits [4:2] are indeed masked off, so the manual is right.
> 
> Change to number of bits in the affected clock's description.
> 
> Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej


