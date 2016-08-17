Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20160816173123.GA361@codeaurora.org>
References: <20160813015023.28221-1-sboyd@codeaurora.org> <20160813015023.28221-2-sboyd@codeaurora.org>
 <CAMuHMdU5USf7SHpg5NXJ=G-RBhX4q+5DAQBYUaMYxJk07vPMOg@mail.gmail.com> <20160816173123.GA361@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2016 22:24:52 +0200
Message-ID: <CAMuHMdWxNXb04__Je3KtDfuS6dYgUKpbZ18dtKV3tLDF3Js21g@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: fixed-rate: Remove export symbol on setup function
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Denis Efremov <yefremov.denis@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Tue, Aug 16, 2016 at 7:31 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 08/16, Geert Uytterhoeven wrote:
>> On Sat, Aug 13, 2016 at 3:50 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> > This function is only called by builtin code, but we always
>> > exported it and had marked it as __init before commit
>> > e4eda8e0654c (clk: remove exported function from __init section,
>> > 2013-01-06) removed that marking. Given that it isn't used by
>> > modules, lets unexport it and add back __init.
>> >
>> > Cc: Denis Efremov <yefremov.denis@gmail.com>
>> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>> > ---
>> >  drivers/clk/clk-fixed-rate.c | 3 +--
>> >  1 file changed, 1 insertion(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
>> > index c735272ed706..b5c46b3f8764 100644
>> > --- a/drivers/clk/clk-fixed-rate.c
>> > +++ b/drivers/clk/clk-fixed-rate.c
>> > @@ -190,11 +190,10 @@ static struct clk *_of_fixed_clk_setup(struct device_node *node)
>> >  /**
>> >   * of_fixed_clk_setup() - Setup function for simple fixed rate clock
>> >   */
>> > -void of_fixed_clk_setup(struct device_node *node)
>> > +void __init of_fixed_clk_setup(struct device_node *node)
>> >  {
>> >         _of_fixed_clk_setup(node);
>> >  }
>> > -EXPORT_SYMBOL_GPL(of_fixed_clk_setup);
>> >  CLK_OF_DECLARE(fixed_clk, "fixed-clock", of_fixed_clk_setup);
>>
>> This function is needed to instantiate clocks from DT overlays,
>> which I'm using with out-of-tree "clk: add generic driver for fixed rate clock".
>
> I think Ricardo's latest series should make that work for you
> with platform device drivers?

Thanks, I had missed that series.
Ah, that one calls _of_fixed_clk_setup() instead, which should still work.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
