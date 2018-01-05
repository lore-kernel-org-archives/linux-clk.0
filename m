Return-Path: <vz@mleia.com>
Subject: Re: [PATCH 2/5] clk: lpc32xx: read-only divider can propagate rate
 change
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org
References: <20180105170959.17266-1-jbrunet@baylibre.com>
 <20180105170959.17266-3-jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <5a256cde-8e59-4921-f6e2-fecd3d1c3377@mleia.com>
Date: Fri, 5 Jan 2018 20:12:45 +0200
MIME-Version: 1.0
In-Reply-To: <20180105170959.17266-3-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome,

On 01/05/2018 07:09 PM, Jerome Brunet wrote:
> When a divider clock has CLK_DIVIDER_READ_ONLY set, it means that the
> register shall be left un-touched, but it does not mean the clock
> should stop rate propagation if CLK_SET_RATE_PARENT is set
> 

okay, the statement sounds correct, but there is no such clocks on LPC32xx,
thus I hardly can confirm that adding dead/inapplicable code is a fix.

> This properly handled in qcom clk-regmap-divider but it was not in the
> lpc32xx divider
> 
> Fixes: f7c82a60ba26 ("clk: lpc32xx: add common clock framework driver")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

I would suggest to drop two LPC32xx clock driver changes from the series.

--
With best wishes,
Vladimir
