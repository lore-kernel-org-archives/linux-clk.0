Return-Path: <david@lechnology.com>
Subject: Re: [v2,7/8] clk: divider: read-only divider can propagate rate
 change
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180214134340.17242-8-jbrunet@baylibre.com>
From: David Lechner <david@lechnology.com>
Message-ID: <f1d4688b-87ce-01df-ab94-72bf20579330@lechnology.com>
Date: Mon, 19 Feb 2018 11:30:38 -0600
MIME-Version: 1.0
In-Reply-To: <20180214134340.17242-8-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 02/14/2018 07:43 AM, Jerome Brunet wrote:
> When a divider clock has CLK_DIVIDER_READ_ONLY set, it means that the
> register shall be left un-touched, but it does not mean the clock
> should stop rate propagation if CLK_SET_RATE_PARENT is set
> 
> This is properly handled in qcom clk-regmap-divider but it was not in
> the generic divider
> 
> To fix this situation, introduce a new helper function
> divider_ro_round_rate, on the same model as divider_round_rate.
> 
> Fixes: e6d5e7d90be9 ("clk-divider: Fix READ_ONLY when divider > 1")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Working for me with the davinci clk drivers I am developing.

Tested-By: David Lechner <david@lechnology.com>
