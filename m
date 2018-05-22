Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 22 May 2018 17:33:13 -0500
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org,
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH] clk: rockchip: remove deprecated gate-clk code and
 dt-binding
Message-ID: <20180522223313.GA12580@rob-hp-laptop>
References: <20180512143038.30447-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180512143038.30447-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 12, 2018 at 04:30:38PM +0200, Heiko Stuebner wrote:
> Initially we tried modeling clocks via the devicetree before switching
> to clocks declared in the clock drivers and only exporting specific
> ids to the devicetree.
> 
> As the old code was in the kernel for 1-2 releases when the new mode
> of operation was added we kept it for backwards compatibility.
> 
> That deprecation notice is in the binding since july 2014, so nearly
> 4 years now and I think it's time to drop the old cruft.
> 
> Especially as at the time using the mainline kernel on Rockchip devices
> was not really possible, except for experiments on the really old socs of
> the rk3066 + rk3188 line, so there shouldn't be any devicetrees still
> around that rely on that code.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../devicetree/bindings/clock/rockchip.txt    | 77 ---------------
>  drivers/clk/rockchip/Makefile                 |  1 -
>  drivers/clk/rockchip/clk-rockchip.c           | 98 -------------------
>  3 files changed, 176 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/rockchip.txt
>  delete mode 100644 drivers/clk/rockchip/clk-rockchip.c

Reviewed-by: Rob Herring <robh@kernel.org>
