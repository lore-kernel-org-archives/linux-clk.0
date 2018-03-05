Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [RESEND PATCH] clk: rockchip: Prevent calculating mmc phase if clock rate is zero
Date: Mon, 05 Mar 2018 22:08:52 +0100
Message-ID: <1992472.PuCZ8TM9rV@diego>
In-Reply-To: <1520220358-181119-1-git-send-email-shawn.lin@rock-chips.com>
References: <1520220358-181119-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 5. M=E4rz 2018, 04:25:58 CET schrieb Shawn Lin:
> The MMC sample and drv clock for rockchip platforms are derived from
> the bus clock output to the MMC/SDIO card. So it should never happens
> that the clk rate is zero given it should inherits the clock rate from
> its parent. If something goes wrong and makes the clock rate to be zero,
> the calculation would be wrong but may still make the mmc tuning process
> work luckily. However it makes people harder to debug when the following
> data transfer is unstable.
>=20
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied for 4.17


Thanks
Heiko
