Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180706185303.27936-2-daniel@zonque.org>
Cc: linux-clk@vger.kernel.org, Daniel Mack <daniel@zonque.org>
References: <20180706185303.27936-1-daniel@zonque.org>
 <20180706185303.27936-2-daniel@zonque.org>
Message-ID: <153090959895.143105.5388333578846149145@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v5 1/1] clk: Add driver for MAX9485
Date: Fri, 06 Jul 2018 13:39:58 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Daniel Mack (2018-07-06 11:53:03)
> This patch adds a driver for MAX9485, a programmable audio clock generato=
r.
> =

> The device requires a 27.000 MHz clock input. It can provide a gated
> buffered output of its input clock and two gated outputs of a PLL that can
> generate one out of 16 discrete frequencies. There is only one PLL howeve=
r,
> so the two gated outputs will always have the same frequency but they can
> be switched individually.
> =

> The driver for this device exposes 4 clocks in total:
> =

> - MAX9485_MCLKOUT:      A gated, buffered output of the input clock
> - MAX9485_CLKOUT:       A PLL that can be configured to 16 different
>                         discrete frequencies
> - MAX9485_CLKOUT[1,2]:  Two gated outputs for MAX9485_CLKOUT
> =

> Some PLL output frequencies can be achieved with different register
> settings. The driver will select the one with lowest jitter in such cases.
> =

> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---

Applied to clk-next
