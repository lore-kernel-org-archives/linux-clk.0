Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Douglas Anderson <dianders@chromium.org>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180830173437.63601-1-dianders@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>,
 David Brown <david.brown@linaro.org>, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20180830173437.63601-1-dianders@chromium.org>
Message-ID: <153566638758.93865.13101841945914366899@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: qcom: Allocate space for NULL terimation in DFS table
Date: Thu, 30 Aug 2018 14:59:47 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Douglas Anderson (2018-08-30 10:34:37)
> The table allocated in clk_rcg2_dfs_populate_freq_table() is
> eventually iterated over by qcom_find_freq() which assumes that the
> table is NULL terminated.  Allocate one extra space in the array for
> the NULL termination.  Initting of the NULL termination is implicit
> due to kcalloc().
> =

> Fixes: cc4f6944d0e3 ("clk: qcom: Add support for RCG to register for DFS")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-next
