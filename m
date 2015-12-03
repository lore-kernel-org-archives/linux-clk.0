Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com
Cc: sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, Xing Zheng <zhengxing@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: fix rk3368 cpuclk divider offsets
Date: Thu, 03 Dec 2015 16:47:31 +0100
Message-ID: <3718967.dRZrdSmclK@diego>
In-Reply-To: <6481456.ejZyd6DyuY@diego>
References: <6481456.ejZyd6DyuY@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 1. Dezember 2015, 22:31:56 schrieb Heiko St=FCbner:
> Due to a copy-paste error the the rk3368 cpuclk settings were acessin=
g
> rk3288-specific register offsets. This never caused problems till now=
,
> as cpu frequency scaling in't used currently at all.
>=20
> Reported-by: Xing Zheng <zhengxing@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

applied to my clock-branch for 4.5
