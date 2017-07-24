Return-Path: <linux-pm-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170723102749.17323-7-icenowy@aosc.io>
References: <20170723102749.17323-1-icenowy@aosc.io> <20170723102749.17323-7-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 24 Jul 2017 11:10:56 +0800
Message-ID: <CAGb2v66bFjcB6CwNM+QDAqUxETqE6XX1UWKwqM_XAt6dOsjhLA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 06/10] clk: sunxi-ng: allow set parent clock
 (PLL_CPUX) for CPUX clock on H3
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jul 23, 2017 at 6:27 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> The CPUX clock, which is the main clock of the ARM core on Allwinner H3,
> can be adjusted by changing the frequency of the PLL_CPUX clock.
>
> Allowing setting parent clock for the CPUX clock, thus the PLL_CPUX
> clock can be adjusted when adjusting the CPUX clock.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Fixes: 0577e4853bfb ("clk: sunxi-ng: Add H3 clocks")
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
