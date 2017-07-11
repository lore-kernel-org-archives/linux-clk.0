Return-Path: <carlo@endlessm.com>
MIME-Version: 1.0
In-Reply-To: <20170711012908.GO22780@codeaurora.org>
References: <20170710203801.17496-1-carlo@caione.org> <CAFqH_51Mje4tK494JRgb=wWJNU9zu=WZ1sS482kRAvRrPpLkXQ@mail.gmail.com>
 <20170710235403.GB25390@fury> <20170711012908.GO22780@codeaurora.org>
From: Carlo Caione <carlo@endlessm.com>
Date: Tue, 11 Jul 2017 10:09:59 +0200
Message-ID: <CAL9uMOE2FAVynV-Q0Vq450igmQMMr2LfS87-izrmSZXC1a0ARQ@mail.gmail.com>
Subject: Re: [PATCH] clk: x86: Do not gate clocks enabled by the firmware
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Darren Hart <dvhart@infradead.org>, Carlo Caione <carlo@caione.org>,
	Enric Balletbo Serra <eballetbo@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Linux Upstreaming Team <linux@endlessm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 11, 2017 at 3:29 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 07/10, Darren Hart wrote:
>> On Tue, Jul 11, 2017 at 12:31:28AM +0200, Enric Balletbo Serra wrote:
>> > 2017-07-10 22:38 GMT+02:00 Carlo Caione <carlo@caione.org>:
>> > >         pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
>> > >         spin_lock_init(&pclk->lock);
>> > >
>> > > +       if (plt_clk_is_enabled(&pclk->hw))
>> > > +               init.flags |= CLK_IGNORE_UNUSED;
>
> Can you add a comment to the effect of why we're adding ignore
> unused here? That will make it clearer when reading the code a
> year from now why we're not turning these clks off by default and
> also allow us to recall why it isn't marked as a critical clk.

This is actually a good point. Probably here we want to mark the clock
as CLK_IS_CRITICAL instead of CLK_IGNORE_UNUSED.
Michael, any preference here?

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
