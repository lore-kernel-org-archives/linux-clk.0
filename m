Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Simek <michal.simek@xilinx.com>, kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] clk: make several parent names const
Date: Thu, 28 May 2015 12:35:12 +0200
Message-ID: <4095482.AGzSOmiiYQ@phil>
In-Reply-To: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, 28. Mai 2015, 10:45:51 schrieb Uwe Kleine-K=F6nig:
> Since commit 2893c379461a ("clk: make strings in parent name arrays
> const") the name of parent clocks can be const. So add more const in
> several clock drivers.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>


Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
> Hello,
>=20
> commit 2893c379461a isn't in Linus Torvald's tree yet, so the commit
> message needs adaption if clk-next is rewritten.
>=20
> Should I split this patch per subdir?

I don't have any Rockchip-related clock changes for 4.2, so for me it's=
 not=20
important if you split it or keep it together.


Thanks
Heiko
