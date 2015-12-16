Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Wed, 16 Dec 2015 17:30:15 -0600
From: Andy Gross <andy.gross@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [v2,3/5] clk: qcom: Add MSM8996 Global Clock Control (GCC) driver
Message-ID: <20151216233015.GC5951@Agamemnon.attlocal.net>
References: <1448933502-11944-4-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448933502-11944-4-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Nov 30, 2015 at 05:31:40PM -0800, Stephen Boyd wrote:
> Add support for the global clock controller found on MSM8996
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> 
> ---

I saw that this complete set of patches was pulled into clk-next.  Would it be
possible for you to host an immutable branch so that I can get the DTS pulled in
properly with all the dependencies?

Thanks,

Andy
