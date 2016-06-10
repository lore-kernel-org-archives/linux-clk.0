Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:64206 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751724AbcFJWcU (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 10 Jun 2016 18:32:20 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/48] clk: at91: replace usleep() by udelay() calls
Date: Sat, 11 Jun 2016 00:30:36 +0200
Message-ID: <11395561.bQatt85IOg@wuerfel>
In-Reply-To: <1465596231-21766-2-git-send-email-alexandre.belloni@free-electrons.com>
References: <1465596231-21766-1-git-send-email-alexandre.belloni@free-electrons.com> <1465596231-21766-2-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Saturday, June 11, 2016 12:03:04 AM CEST Alexandre Belloni wrote:
> From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> 
> Fix the main and slow clock .prepare() implementations which used to call
> usleep() when the scheduler wasn't ready yet.
> 

Does this have to be called that early? It seems wasteful to always
call udelay() here, when these are functions that are normally
allowed to sleep.

	Arnd

