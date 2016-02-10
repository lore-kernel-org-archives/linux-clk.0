Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Feb 2016 09:56:57 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: mask VCO bits before writing
Message-ID: <20160210175657.GF30978@codeaurora.org>
References: <1454507228-14718-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdafovzA6Ci31aX09nue77G3N2AomPoMbAT-gOTUYxtKHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACRpkdafovzA6Ci31aX09nue77G3N2AomPoMbAT-gOTUYxtKHQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/10, Linus Walleij wrote:
> On Wed, Feb 3, 2016 at 2:47 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > The Versatile syscon ICST driver OR:s the bits into place but
> > forgets to mask the previous value, making the code only work
> > if the register is zero or giving haphazard results. Mask the
> > 19 bits used by the Versatile syscon interface register.
> >
> > Regression caused and now fixed by yours truly.
> >
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: linux-clk@vger.kernel.org
> > Fixes: 179c8fb3c2a6 ("clk: versatile-icst: convert to use regmap")
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Mike/Stephen, are you picking this for fixes?
> 

Thanks, I missed this one. Applied to clk-fixes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
