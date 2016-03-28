Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] clk: rockchip: add clock controller for the RK3399
Date: Mon, 28 Mar 2016 02:13:34 +0200
Message-ID: <9181730.v9nyazlRXy@phil>
In-Reply-To: <1458974276-10325-5-git-send-email-zhengxing@rock-chips.com>
References: <1458974276-10325-1-git-send-email-zhengxing@rock-chips.com> <1458974276-10325-5-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Xing,

Am Samstag, 26. M=E4rz 2016, 14:37:56 schrieb Xing Zheng:
> Add the clock tree definition for the new RK3399 SoC.
>=20
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---

[...]

> +=09/*
> +=09 * We use pclkin_cifinv by default GRF_SOC_CON20[9] (GSC20_9) set=
ting in
> system, +=09 * so we ignore the mux and make clocks nodes as followin=
g,
> +=09 *
> +=09 * pclkin_cifinv --|-------\
> +=09 *                 |GSC20_9|-- pclkin_cifmux
> +=09 * pclkin_cif    --|-------/
> +=09 */
> +=09GATE(PCLK_ISP1_WRAPPER, "pclkin_isp1_wrapper", "pclkin_cifmux",

please name that source clock pclkin_cif as in the TRM.
pclkin_cif is the actual input clock - if I'm reading the TRM correctly=
 and=20
the inverter is part of the soc or so?

That we currently hide / hardcode the phase-handling should not be part=
 of=20
our outside connection - which should be stable even if we implement th=
is=20
later.


Heiko
