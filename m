Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:36256 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1423728AbcFMPYV (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 13 Jun 2016 11:24:21 -0400
Date: Mon, 13 Jun 2016 17:24:09 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/48] clk: at91: replace usleep() by udelay() calls
Message-ID: <20160613152409.GD3240@piout.net>
References: <1465596231-21766-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1465596231-21766-2-git-send-email-alexandre.belloni@free-electrons.com>
 <11395561.bQatt85IOg@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <11395561.bQatt85IOg@wuerfel>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/06/2016 at 00:30:36 +0200, Arnd Bergmann wrote :
> On Saturday, June 11, 2016 12:03:04 AM CEST Alexandre Belloni wrote:
> > From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> > 
> > Fix the main and slow clock .prepare() implementations which used to call
> > usleep() when the scheduler wasn't ready yet.
> > 
> 
> Does this have to be called that early? It seems wasteful to always
> call udelay() here, when these are functions that are normally
> allowed to sleep.
> 

So I've tested it and something like that would work:

	if (system_state < SYSTEM_RUNNING)
		udelay(osc->startup_usec);
	else
		usleep_range(osc->startup_usec, osc->startup_usec + 1);

But I'm afraid it would be the first driver to actually do something
like that (however, it is already the only driver trying to sleep). 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
