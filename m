Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <7060610.CC2Q1RMG2L@phil>
References: <7060610.CC2Q1RMG2L@phil>
Date: Mon, 24 Aug 2015 16:03:23 -0700
Message-ID: <CAD=FV=UG_QkU0W5tpb3Y7zxuq6X7dtQmC4m5_j9vMtJgjdiquQ@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: register pll mux before pll itself
From: Doug Anderson <dianders@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Heiko

On Wed, Aug 19, 2015 at 6:06 AM, Heiko Stuebner <heiko@sntech.de> wrote:
> The structure is xin24m -> pll -> pll-mux (xin24m,pll,xin32k). The pll
> does have an init callback to make sure the boot-selected frequency is
> using the expected pll settings and resets the same frequency using
> the values provided in the driver if necessary.
>
> The setting itself also involves remuxing the pll-mux temporarily to
> the xin24m source to let the new pll rate settle. Until now this worked
> flawlessly, even when it had the flaw of accessing the mux settings
> before the mux actually got registered.
>
> With the recent clock-core conversions this flaw became apparent in
> null pointer dereference in
> [<c03fc400>] (clk_hw_get_num_parents) from [<c0400df0>] (clk_mux_get_parent+0x14/0xc8)
> [<c0400ddc>] (clk_mux_get_parent) from [<c040246c>] (rockchip_rk3066_pll_set_rate+0xd8/0x320)
>
> So to fix that, simply register the pll-mux before the pll, so that
> it will be fully initialized when the pll clock executes its init-
> callback and possibly touches the pll-mux clock.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> This only surfaced with the clk_core changes for 4.3, so should
> probably just go on top.
>
>  drivers/clk/rockchip/clk-pll.c | 63 +++++++++++++++++++++---------------------
>  1 file changed, 32 insertions(+), 31 deletions(-)

Fixes boot crash on rk3288-veyron-jerry on next-20150824.  It'd be
super great to get this landed somewhere so that we can boot linuxnext
again.  :)

Tested-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
