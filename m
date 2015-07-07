Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 7 Jul 2015 19:17:21 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] clk: at91: Silence warnings and cleanup __init usage
Message-ID: <20150707171721.GL3127@piout.net>
References: <1436211105-10491-1-git-send-email-sboyd@codeaurora.org>
 <20150706203811.GC3127@piout.net>
 <20150706213759.GC20866@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150706213759.GC20866@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/07/2015 at 14:37:59 -0700, Stephen Boyd wrote :
> 
> Ok I can fix the alignment at the same time.
> 

Thanks :)

> ---8<---
> From: Stephen Boyd <sboyd@codeaurora.org>
> Subject: [PATCH] clk: at91: Silence warnings and cleanup __init usage
> 
> Remove useless ifdefs around function prototypes to silence the
> following sparse warnings when the configs aren't enabled.
> 
> drivers/clk/at91/clk-h32mx.c:95:13: warning: symbol
> 'of_sama5d4_clk_h32mx_setup' was not declared. Should it be
> static?
> drivers/clk/at91/clk-utmi.c:159:13: warning: symbol
> 'of_at91sam9x5_clk_utmi_setup' was not declared. Should it be
> static?
> 
> Plus, using __init in function prototypes doesn't do anything, so
> just drop it throughout this file.
> 
> Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
