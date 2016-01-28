Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:61886 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750732AbcA1WIa (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jan 2016 17:08:30 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Russell King <linux@arm.linux.org.uk>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [PATCH] ARM: Use generic clkdev.h header
Date: Thu, 28 Jan 2016 23:07:58 +0100
Message-ID: <7387260.8XnD1ditcY@wuerfel>
In-Reply-To: <20160128201238.GN12841@codeaurora.org>
References: <1453932702-6930-1-git-send-email-sboyd@codeaurora.org> <6141409.WI4q6BtOxa@wuerfel> <20160128201238.GN12841@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thursday 28 January 2016 12:12:38 Stephen Boyd wrote:
> From: Stephen Boyd <sboyd@codeaurora.org>
> Subject: [PATCH] ARM: plat-versatile: Remove unused clock.c file
> 
> This file isn't compiled anymore because PLAT_VERSATILE_CLOCK is
> never selected. Remove the file and the config.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  arch/arm/plat-versatile/Kconfig  |  3 --
>  arch/arm/plat-versatile/Makefile |  1 -
>  arch/arm/plat-versatile/clock.c  | 74 ----------------------------------------
>  3 files changed, 78 deletions(-)
>  delete mode 100644 arch/arm/plat-versatile/clock.c
> 

Looks good, I've added it to my todo list for arm-soc in 4.6.

I think Linus Walleij has some related work pending, so I'll 
let him Ack this patch or pick it up in his tree if he prefers.

Acked-by: Arnd Bergmann <arnd@arndb.de>

	Arnd
