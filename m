Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Roman Volkov <v1ron@mail.ru>, Tony Prisk <linux@prisktech.co.nz>, Andrzej Hajda <a.hajda@samsung.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: vt8500: don't return possibly uninitialized data
Date: Tue, 02 Feb 2016 21:00:29 +0100
Message-ID: <2326140.nrZ9Ej2PSt@wuerfel>
In-Reply-To: <20160202194713.GN4848@codeaurora.org>
References: <4790407.6zgSQCdsSB@wuerfel> <2210116.QsPesySkh0@wuerfel> <20160202194713.GN4848@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Tuesday 02 February 2016 11:47:13 Stephen Boyd wrote:
> On 02/02, Arnd Bergmann wrote:
> > On Monday 01 February 2016 17:15:45 Stephen Boyd wrote:
> > 
> > I see what you mean now. I checked different gcc versions, and with my patch I get
> > the warnings for 4.6 through 4.9, but not for 5.x.
> > 
> > In general, I tried to only address warnings I still see with newer gcc version,
> > as they are better about false positives. Do you think it's ok to take the
> > patch as is then? Otherwise we probably have to add fake initializations which
> > would shut up the warnings but not help with the code quality.
> > 
> 
> Sure. I was hoping something could be done to restructure the
> code to make it easier for the compiler to figure out the
> variables would be initialized. But you're the one who's sending
> the patch to silence them so if you're satisfied I'm not going to
> spend too much time on this.
> 

Ok, thanks!

Note that this one patch was for a real bug involving undefined
behavior that is now fixed.

	Arnd
