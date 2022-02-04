Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0096C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  4 Feb 2022 06:24:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242877AbiBDGYJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Feb 2022 01:24:09 -0500
Received: from aposti.net ([89.234.176.197]:40396 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234257AbiBDGYJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Feb 2022 01:24:09 -0500
Date:   Fri, 04 Feb 2022 06:23:59 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/1] clk: jz4725b: fix mmc0 clock gating
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org
Message-Id: <ZFOR6R.SY2BLN8DYNHG3@crapouillou.net>
In-Reply-To: <20220204052641.538970-1-lis8215@gmail.com>
References: <20220204052641.538970-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Siarhei,

Le ven., févr. 4 2022 at 08:26:40 +0300, Siarhei Volkau 
<lis8215@gmail.com> a écrit :
> The mmc0 clock gate bit was mistakenly assigned to "i2s" clock.
> You can find that the same bit is assigned to "mmc0" too.
> It leads to mmc0 hang for a long time after any sound activity
> also it  prevented PM_SLEEP to work properly.
> I guess it was introduced by copy-paste from jz4740 driver
> where it is really controls I2S clock gate.

This is useful information, please use the same text in the commit 
message.

However... My JZ4725B programming manual does say that the MMC0 clock 
is gated with bit 6, and the I2S clock has no gating bit.

Where did you find this info?

Cheers,
-Paul

> 
> Siarhei Volkau (1):
>   clk: jz4725b: fix mmc0 clock gating
> 
>  drivers/clk/ingenic/jz4725b-cgu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> --
> 2.35.1
> 


