Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH] clk: rockchip: remove deprecated gate-clk code and dt-binding
Date: Wed, 23 May 2018 13:20:34 +0200
Message-ID: <4588886.sEysoKttEW@diego>
In-Reply-To: <20180512143038.30447-1-heiko@sntech.de>
References: <20180512143038.30447-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Samstag, 12. Mai 2018, 16:30:38 CEST schrieb Heiko Stuebner:
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

applied to my Rockchip clock-tree with the 2 received tags.
