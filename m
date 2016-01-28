Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:50014 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932638AbcA1MdR (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jan 2016 07:33:17 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Russell King <linux@arm.linux.org.uk>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] ARM: Use generic clkdev.h header
Date: Thu, 28 Jan 2016 13:32:45 +0100
Message-ID: <6141409.WI4q6BtOxa@wuerfel>
In-Reply-To: <1453932702-6930-1-git-send-email-sboyd@codeaurora.org>
References: <1453932702-6930-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wednesday 27 January 2016 14:11:42 Stephen Boyd wrote:
> Get rid of the clkdev.h file in the ARM port and use the generic
> one because we've gotten rid of all the machine specific
> mach/clkdev.h files.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> 

Ah, nice! I had not even noticed it was the last one.

The file is still also referenced by arch/arm/plat-versatile/clock.c,
but we don't build that file any more and should remove it as well.

	Arnd
