Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Jun 2016 15:06:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Roman Volkov <v1ron@mail.ru>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Volkov <rvolkov@v1ros.org>,
	Tony Prisk <linux@prisktech.co.nz>,
	Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 0/2] Rework clk/vt8500 wm8650_find_pll_bits()
Message-ID: <20160601220601.GD28218@codeaurora.org>
References: <1464120473-1808-1-git-send-email-v1ron@mail.ru>
 <20160531092329.53bcacdd@v1ron-s7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20160531092329.53bcacdd@v1ron-s7>
List-ID: <linux-clk.vger.kernel.org>

On 05/31, Roman Volkov wrote:
> В Tue, 24 May 2016 23:07:51 +0300
> Roman Volkov <v1ron@mail.ru> пишет:
> 
> > From: Roman Volkov <rvolkov@v1ros.org>
> > 
> > Hi Arnd and others,
> > 
> > This patch finally removes the warnings from GCC about possibly
> > uninitialized variables 'best_div2', 'best_div1', and 'best_mul'.
> > Also one of the functions is reworked, so that the algorithm is much
> > easier. This is to continue the work started in [1].
> > 
> > This code is tested on WM8650. Also the testing app was used in
> > user-mode to check possible values and performance [2].
> > 
> > [1] https://lkml.org/lkml/2016/2/1/149
> > [2] https://github.com/v1ron/vt8500-clkrange
> > 
> > Thanks,
> > Roman Volkov (2):
> >   clk/vt8500: Rework wm8650_find_pll_bits()
> >   clk/vt8500: Fix compilation warnings
> > 
> >  drivers/clk/clk-vt8500.c | 81
> > +++++++++++++++++++++++------------------------- 1 file changed, 39
> > insertions(+), 42 deletions(-)
> > 
> 
> Hi Stephen,
> 
> Do we need this change during this merge window?
> 

The warning has been there for since before this merge window, so
if anything this is v4.8 material.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
