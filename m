Return-Path: <carlo@endlessm.com>
MIME-Version: 1.0
In-Reply-To: <20170713155448.GD15146@fury>
References: <20170713094213.2775-1-carlo@caione.org> <1499940374.22624.370.camel@linux.intel.com>
 <20170713155448.GD15146@fury>
From: Carlo Caione <carlo@endlessm.com>
Date: Fri, 14 Jul 2017 10:19:03 +0200
Message-ID: <CAL9uMOE_7Ve2zKwSCZv39JrFaTbX8ry_eZ24sJg+vNXFM0TOiw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: x86: Do not gate clocks enabled by the firmware
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Carlo Caione <carlo@caione.org>,
	Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Linux Upstreaming Team <linux@endlessm.com>, Enric Balletbo Serra <eballetbo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 13, 2017 at 5:54 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Thu, Jul 13, 2017 at 01:06:14PM +0300, Andy Shevchenko wrote:
>> On Thu, 2017-07-13 at 11:42 +0200, Carlo Caione wrote:
>> > From: Carlo Caione <carlo@endlessm.com>
>> >
>> > Read the enable register to determine if the clock is already in use
>> > by
>> > the firmware. In this case avoid gating the clock.
>> >
>>
>> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> I suppose it should go via clock tree.
>>
>> > Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> > Signed-off-by: Carlo Caione <carlo@endlessm.com>
>> > ---
>> >  drivers/clk/x86/clk-pmc-atom.c | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-
>> > atom.c
>> > index 2b60577703ef..3c73d2e564ca 100644
>> > --- a/drivers/clk/x86/clk-pmc-atom.c
>> > +++ b/drivers/clk/x86/clk-pmc-atom.c
>> > @@ -185,6 +185,13 @@ static struct clk_plt *plt_clk_register(struct
>> > platform_device *pdev, int id,
>> >     pclk->reg = base + PMC_CLK_CTL_OFFSET + id *
>> > PMC_CLK_CTL_SIZE;
>> >     spin_lock_init(&pclk->lock);
>> >
>> > +   /*
>> > +    * If the clock was already enabled by the firmware mark is a
>> > critical
>
> Nit... I think this should read... "mark it as critical" ?
>
>> > +    * to avoid it being gated by the clock framework if no
>> > driver owns it
>
> owns it.

Ooops. Yeah, submitting a v3 with better spelling and your ACKs.

Thanks,

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
