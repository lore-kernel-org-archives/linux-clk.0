Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180512143038.30447-1-heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 Heiko Stuebner <heiko@sntech.de>
References: <20180512143038.30447-1-heiko@sntech.de>
Message-ID: <152640342836.34267.18008728966241252616@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: rockchip: remove deprecated gate-clk code and dt-binding
Date: Tue, 15 May 2018 09:57:08 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Heiko Stuebner (2018-05-12 07:30:38)
> Initially we tried modeling clocks via the devicetree before switching
> to clocks declared in the clock drivers and only exporting specific
> ids to the devicetree.
> =

> As the old code was in the kernel for 1-2 releases when the new mode
> of operation was added we kept it for backwards compatibility.
> =

> That deprecation notice is in the binding since july 2014, so nearly
> 4 years now and I think it's time to drop the old cruft.
> =

> Especially as at the time using the mainline kernel on Rockchip devices
> was not really possible, except for experiments on the really old socs of
> the rk3066 + rk3188 line, so there shouldn't be any devicetrees still
> around that rely on that code.
> =

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Alright, let's see how things go.

Acked-by: Stephen Boyd <sboyd@kernel.org>
