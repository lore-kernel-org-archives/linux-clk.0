Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Lin Huang <hl@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: add clock flag parameter when register pll
Date: Mon, 08 Aug 2016 22:31:02 +0200
Message-ID: <1629452.yetpgSEng2@diego>
In-Reply-To: <1469169465-5892-1-git-send-email-hl@rock-chips.com>
References: <1469169465-5892-1-git-send-email-hl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 22. Juli 2016, 14:37:45 schrieb Lin Huang:
> From: Heiko St=FCbner <heiko@sntech.de>
>=20
> add clock flag parameter so we can pass specific clock flag
> (like CLK_GET_RATE_NOCACHE etc..)to pll driver.
>=20
> Change-Id: I1e076b3efa6b5da082b6e68e2e2a4c9dfd93e3d4
> Signed-off-by: Heiko St=FCbner <heiko@sntech.de>
> Signed-off-by: Lin Huang <hl@rock-chips.com>

just so it doesn't get overlooked, this patch was also part of the late=
r ddr-
clock series and I picked it from there,
