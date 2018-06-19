Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1528885997-10311-1-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1528885997-10311-1-git-send-email-tdas@codeaurora.org>
Message-ID: <152942182329.16708.17615552184746348831@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 0/2] Add display clock controller driver for SDM845
Date: Tue, 19 Jun 2018 08:23:43 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-06-13 03:33:15)
>  [v2]
>   * Removed unused header file includes.
>   * Moved the frequency table macro to a common file [1].
>   * Move to pll config to probe.
>   * Update SoC name in device tree binding and
>     also update the Kconfig.
> =

> Add support for the display clock controller found on SDM845
> based devices. This would allow display drivers to probe and
> control their clocks.
> =

> The Display clock driver depends on the frequency table macro
> movement to a common file [1].

Please send that patch along with these patches so the dependency is
clear.

> =

>  [1]:  https://lkml.org/lkml/2018/6/13/216
>=20
