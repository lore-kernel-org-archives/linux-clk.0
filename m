Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1463164937-91089-1-git-send-email-briannorris@chromium.org>
References: <1463164937-91089-1-git-send-email-briannorris@chromium.org>
Date: Fri, 13 May 2016 12:43:25 -0700
Message-ID: <CAD=FV=UjPy-n-53nhxr7yC1t1j+eD6pRt0_i5_6hhY=Rnz6xsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: mark rk3399 GIC clocks as critical
From: Doug Anderson <dianders@chromium.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, Xing Zheng <zhengxing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Brian,

On Fri, May 13, 2016 at 11:42 AM, Brian Norris <briannorris@chromium.org> wrote:
> We never want to kill the GIC.
>
> Noticed when making other clock fixups, and seeing the newly-constructed
> clock tree try to disable cpll, where we had this parent structure:
>
>   aclk_gic <------\
>                   |--- aclk_gic_pre <-- cpll <-- pll_cpll
>   aclk_gic_noc <--/
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  drivers/clk/rockchip/clk-rk3399.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
