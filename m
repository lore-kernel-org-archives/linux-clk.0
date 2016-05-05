Return-Path: <tomeu.vizoso@collabora.com>
Subject: Re: [RFC PATCH 0/3] clk: attempt to keep requested rate on parent
 changes
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com,
 sboyd@codeaurora.org
References: <1462206982-10444-1-git-send-email-heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 zhengxing@rock-chips.com, zhangqing@rock-chips.com,
 Doug Anderson <dianders@google.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <572B4AF8.6070509@collabora.com>
Date: Thu, 5 May 2016 15:30:32 +0200
MIME-Version: 1.0
In-Reply-To: <1462206982-10444-1-git-send-email-heiko@sntech.de>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/02/2016 06:36 PM, Heiko Stuebner wrote:
> I remember reading about people discussing that problem in the past, but
> haven't been able to find another approach to it yet [or I'm just blind
> as happens to often].
> 
> Our problem is the following clock structure:
> 
> [anotherPLL]
>     |
>     ------ [div] ----- dclk_vop
>     |
> [   vpll   ] --------- hdmi_phy
> 
> 
> We need to set the vpll dynamically but still want to retain

Guess something is missing here?

> The other option that comes to mind, would be to have a clock-notifier,
> in the drm driver, but calling clk_set_rate from their looks like it
> shouldn't work due to the prepare mutex already being held.
> 
> 
> The whole thing is labeled RFC because while it works for us and solves
> the problem, I'm not sure if I'm overlooking some important aspect or
> am interferring with some other planned approach for that issue.

I like this approach very much and wonder in what cases it wouldn't be
desirable to re-try to achieve the requested rate after a change in an
ancestor clock.

Besides that, do you know already if it would solve the conflicts
described by Doug in the thread below?

http://thread.gmane.org/gmane.linux.kernel/1820653/focus=3298

Thanks,

Tomeu




> Heiko Stuebner (3):
>   clk: fix inconsistent use of req_rate
>   clk: adjust clocks to their requested rate after parent changes
>   clk: rockchip: make rk3399 vop dclks keep their rate on parent rate changes
> 
>  drivers/clk/clk.c                 | 37 +++++++++++++++++++++++++++++--------
>  drivers/clk/rockchip/clk-rk3399.c |  4 ++--
>  include/linux/clk-provider.h      |  1 +
>  3 files changed, 32 insertions(+), 10 deletions(-)
> 
