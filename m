Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1705995.CL2pqRBHZb@diego>
References: <1705995.CL2pqRBHZb@diego>
Date: Fri, 18 Dec 2015 14:40:21 -0800
Message-ID: <CAD=FV=XRS3-euKmOzaUd_bL+W=f-FD2tB2gZBsQxBioLBEs23w@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: only enter pll slow-mode directly before
 reboots on rk3288
From: Doug Anderson <dianders@chromium.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@collabora.com>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Chris Zhong <zyw@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Heiko,

On Fri, Dec 18, 2015 at 10:33 AM, Heiko St=C3=BCbner
<heiko.stuebner@collabora.com> wrote:
> As commit 1d33929e2a2b ("clk: rockchip: switch PLLs to slow mode before
> reboot for rk3288") states, switching the PLLs to slow-mode is only
> necessary when rebooting using the soft-reset done through the CRU.
>
> The dwc2 controllers used create really big number of interrupts in
> special constellations involving usb-hubs and their number is so high,
> it can even overwhelm the interrupt handler if the cpu-speed os to low.
>
> Right now the PLLs are put into slow-mode in a shutdown syscore_ops
> callback which means it happens on all reboots (not only the soft-reset
> ones) and even on poweroff actions.
>
> This can result in the system not powering off and getting stuck instead,
> so we should move the slow-mode change nearer to the actual reboot action=
.
>
> For this we introduce the possiblity to also set a callback that gets
> called from the restart-handler directly prior to restarting the system
> and move the shutdown-callback to this new option.
>
> With this the slow-mode switch is done only on the necessary reboots
> and also has a smaller possibility of causing artifacts.
>
> Fixes: 1d33929e2a2b ("clk: rockchip: switch PLLs to slow mode before rebo=
ot for rk3288")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@collabora.com>
> ---
>  drivers/clk/rockchip/clk-rk3036.c | 2 +-
>  drivers/clk/rockchip/clk-rk3188.c | 2 +-
>  drivers/clk/rockchip/clk-rk3228.c | 2 +-
>  drivers/clk/rockchip/clk-rk3288.c | 4 ++--
>  drivers/clk/rockchip/clk-rk3368.c | 2 +-
>  drivers/clk/rockchip/clk.c        | 7 ++++++-
>  drivers/clk/rockchip/clk.h        | 2 +-
>  7 files changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
