Return-Path: <sboyd@codeaurora.org>
Date: Tue, 2 Feb 2016 11:47:13 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Tony Prisk <linux@prisktech.co.nz>, Roman Volkov <v1ron@mail.ru>
Subject: Re: [PATCH] clk: vt8500: don't return possibly uninitialized data
Message-ID: <20160202194713.GN4848@codeaurora.org>
References: <4790407.6zgSQCdsSB@wuerfel>
 <20160202011545.GG4848@codeaurora.org>
 <2210116.QsPesySkh0@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2210116.QsPesySkh0@wuerfel>
List-ID: <linux-clk.vger.kernel.org>

On 02/02, Arnd Bergmann wrote:
> On Monday 01 February 2016 17:15:45 Stephen Boyd wrote:
> 
> I see what you mean now. I checked different gcc versions, and with my patch I get
> the warnings for 4.6 through 4.9, but not for 5.x.
> 
> In general, I tried to only address warnings I still see with newer gcc version,
> as they are better about false positives. Do you think it's ok to take the
> patch as is then? Otherwise we probably have to add fake initializations which
> would shut up the warnings but not help with the code quality.
> 

Sure. I was hoping something could be done to restructure the
code to make it easier for the compiler to figure out the
variables would be initialized. But you're the one who's sending
the patch to silence them so if you're satisfied I'm not going to
spend too much time on this.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
