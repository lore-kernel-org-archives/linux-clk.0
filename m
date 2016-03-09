Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] clk: rockchip: add more mux parameters for new pll sources
Date: Wed, 09 Mar 2016 17:50:17 +0100
Message-ID: <6921896.5phntn5YJn@diego>
In-Reply-To: <1457491027-30936-4-git-send-email-zhengxing@rock-chips.com>
References: <1457491027-30936-1-git-send-email-zhengxing@rock-chips.com> <1457491027-30936-4-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 9. M=E4rz 2016, 10:37:03 schrieb Xing Zheng:
> Thers are only two parent PLLs that APLL and GPLL for core on the
> previous SoCs (RK3066/RK3188/RK3288/RK3368). Hence, we set fixed
> GPLL as alternate parent when core is switching freq.
>=20
> Since RK3399 big.LITTLE architecture, we need to select and adapt
> more PLLs (ALPLL/ABPLL/DPLL/GPLL) sources.
>=20
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

applied to my clk-branch for v4.7, with an adapted subject of
"clk: rockchip: allow varying mux parameters for cpuclk pll-sources"


Thanks
Heiko
