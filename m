Return-Path: <SRS0=WVnq=BD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD7DC433DF
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE02C20767
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595582453;
	bh=z6KaWQSZ7QeZf1kfppTh7DDaINQdH0yeqKjHERT0Ilo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=CDqkqoiom7AtP/07VhYh1g54/Py/Vb6Wiq50uDUlQLjqwNgaA4vrP1GQCZ7j0g8bj
	 nCR+552B4aDnREaGEsuWKBWx43/jo1wSV+YGq2mJJEKMXrzC6AkAjjy5dYsJsMuyth
	 9tvRsk8Muc346pujpPGUrgr07akqddBOCoJFSzOM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgGXJUt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jul 2020 05:20:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:51028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727972AbgGXJUs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 24 Jul 2020 05:20:48 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A14C2063A;
        Fri, 24 Jul 2020 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595582448;
        bh=z6KaWQSZ7QeZf1kfppTh7DDaINQdH0yeqKjHERT0Ilo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=A7OIlIjyAmf5mPY4hEWjGB3NN16KUGfdCw7e6VhkoAEOYDOdSFOMbH4H8WWsFE64A
         TugD7R60jl5m9NglZsnoBYqtsh5CKJdTYSFprBxxWYWREc+hqLYm4/Rv+d4zT1pN7k
         K9yEUSoPUPA6dhv9mBWME2iUyqCPKqkN3NRbQW00=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595403506-8209-4-git-send-email-claudiu.beznea@microchip.com>
References: <1595403506-8209-1-git-send-email-claudiu.beznea@microchip.com> <1595403506-8209-4-git-send-email-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 03/18] clk: at91: clk-sam9x60-pll: fix mul mask
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Fri, 24 Jul 2020 02:20:48 -0700
Message-ID: <159558244801.3847286.15569839312740074372@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2020-07-22 00:38:11)
> According to datasheet mul mask is on bits 31..24.
>=20
> Fixes: a436c2a447e59 ("clk: at91: add sam9x60 PLL driver")
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next
