Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:43641 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751388AbcFNQS2 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 14 Jun 2016 12:18:28 -0400
Date: Tue, 14 Jun 2016 18:18:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Afzal Mohammed <afzal.mohd.ma@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	linux-kernel@vger.kernel.org,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/48] clk: at91: replace usleep() by udelay() calls
Message-ID: <20160614181820.1b817ed3@bbrezillon>
In-Reply-To: <20160614160517.GA2490@afzalpc>
References: <1465596231-21766-1-git-send-email-alexandre.belloni@free-electrons.com>
	<1465596231-21766-2-git-send-email-alexandre.belloni@free-electrons.com>
	<11395561.bQatt85IOg@wuerfel>
	<20160613152409.GD3240@piout.net>
	<20160614160517.GA2490@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, 14 Jun 2016 21:35:17 +0530
Afzal Mohammed <afzal.mohd.ma@gmail.com> wrote:

> Hi,
> 
> On Mon, Jun 13, 2016 at 05:24:09PM +0200, Alexandre Belloni wrote:
> > On 11/06/2016 at 00:30:36 +0200, Arnd Bergmann wrote :  
> 
> > > Does this have to be called that early? It seems wasteful to always
> > > call udelay() here, when these are functions that are normally
> > > allowed to sleep.  
> 
> > So I've tested it and something like that would work:
> > 
> > 	if (system_state < SYSTEM_RUNNING)
> > 		udelay(osc->startup_usec);
> > 	else
> > 		usleep_range(osc->startup_usec, osc->startup_usec + 1);
> > 
> > But I'm afraid it would be the first driver to actually do something
> > like that (however, it is already the only driver trying to sleep).   
> 
> tglx has suggested to modify clock core to handle a somewhat similar
> kind of scenario (probably should work here too) and avoid driver
> changes,
> 
> http://lkml.kernel.org/r/alpine.DEB.2.11.1606061448010.28031@nanos

Oh, interesting. Definitely a better solution than this custom check.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
