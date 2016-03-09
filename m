Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 1/5] clk: rockchip: add more mux parameters for new pll sources
Date: Wed, 09 Mar 2016 02:12:31 +0100
Message-ID: <2242962.kh0Ty0L2C4@phil>
In-Reply-To: <1456827275-8035-2-git-send-email-zhengxing@rock-chips.com>
References: <1456827275-8035-1-git-send-email-zhengxing@rock-chips.com> <1456827275-8035-2-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 1. M=E4rz 2016, 18:14:31 schrieb Xing Zheng:
> Thers are only two parent PLLs that APLL and GPLL for core on the
> previous SoCs (RK3066/RK3188/RK3288/RK3368). Hence, we set fixed
> GPLL as alternate parent when core is switching freq.
>=20
> Since RK3399 big.LITTLE architecture, we need to select and adapt
> more PLLs (ALPLL/ABPLL/DPLL/GPLL) sources.
>=20
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

note to self: looks good to go
