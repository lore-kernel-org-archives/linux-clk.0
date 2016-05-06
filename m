Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1462206982-10444-3-git-send-email-heiko@sntech.de>
References: <1462206982-10444-1-git-send-email-heiko@sntech.de>
	<1462206982-10444-3-git-send-email-heiko@sntech.de>
Date: Thu, 5 May 2016 17:35:03 -0700
Message-ID: <CAD=FV=X6at49s-8Wh3+RnLwNQr5RqDMvfJJF+TwvuhnurmQk1w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] clk: adjust clocks to their requested rate after
 parent changes
From: Doug Anderson <dianders@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Xing Zheng <zhengxing@rock-chips.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	zhangqing <zhangqing@rock-chips.com>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Heiko,

On Mon, May 2, 2016 at 9:36 AM, Heiko Stuebner <heiko@sntech.de> wrote:
> Given a hirarchy of clk1 -> [div] -> clk2, when the rate of clk1 gets
> changed, clk2 changes as well as the divider stays the same. There may
> be cases where a user of clk2 needs it at a specific rate, so clk2
> needs to be readjusted for the changed rate of clk1.
>
> So if a rate was requested for the clock, and its rate changed during
> the underlying rate-change, with this change the clock framework now
> tries to readjust the rate back to/near the requested one.
>
> The whole process is protected by a new clock-flag to not force this
> behaviour change onto every clock defined in the ccf.

I'm not an expert on CCF details, but presumably you need to be really
careful here.  Is there any way you could get an infinite loop here
where you ping-pong between two people trying to control their parent
clock?  Right now I see mutual recursion between
clk_core_set_rate_nolock() and clk_change_rate() and no base case.

Specifically if there's a path (because of CLK_SET_RATE_PARENT) where
setting a clock rate on "clk2" in your example can cause a rate change
of "clk1" I worry that we'll be in trouble.  Maybe a requirement of
your patch is that no such path exists?  ...or maybe something in the
code prevents this...


> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/clk/clk.c            | 13 +++++++++++--
>  include/linux/clk-provider.h |  1 +
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 65e0aad..22be369 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1410,6 +1410,9 @@ static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
>         return fail_clk;
>  }
>
> +static int clk_core_set_rate_nolock(struct clk_core *core,
> +                                   unsigned long req_rate);
> +
>  /*
>   * walk down a subtree and set the new rates notifying the rate
>   * change on the way
> @@ -1494,6 +1497,12 @@ static void clk_change_rate(struct clk_core *core)
>         /* handle the new child who might not be in core->children yet */
>         if (core->new_child)
>                 clk_change_rate(core->new_child);
> +
> +       /* handle a changed clock that needs to readjust its rate */
> +       if (core->flags & CLK_KEEP_REQ_RATE && core->req_rate
> +                                           && core->new_rate != old_rate
> +                                           && core->new_rate != core->req_rate)
> +               clk_core_set_rate_nolock(core, core->req_rate);

I guess we don't care about errors here?

...maybe (?) we could ignore errors if we validated this rate change
with PRE_RATE_CHANGE before attempting to change the parent clock, but
I don't see the code doing this unless I missed it.


>  }
>
>  static int clk_core_set_rate_nolock(struct clk_core *core,
> @@ -1529,11 +1538,11 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
>                 return -EBUSY;
>         }
>
> +       core->req_rate = req_rate;
> +
>         /* change the rates */
>         clk_change_rate(top);
>
> -       core->req_rate = req_rate;
> -
>         return ret;
>  }
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 0c72204..06f189e 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -33,6 +33,7 @@
>  #define CLK_RECALC_NEW_RATES   BIT(9) /* recalc rates after notifications */
>  #define CLK_SET_RATE_UNGATE    BIT(10) /* clock needs to run to set rate */
>  #define CLK_IS_CRITICAL                BIT(11) /* do not gate, ever */
> +#define CLK_KEEP_REQ_RATE      BIT(12) /* keep reqrate on parent rate change */

s/reqrate/req_rate/
