Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:56:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: pxa: export core clocks
Message-ID: <20161102005651.GZ16026@codeaurora.org>
References: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
 <1477225170-19019-5-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1477225170-19019-5-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On 10/23, Robert Jarzmik wrote:
> pxaxxx_get_clk_frequency_khz() needs several clocks to be available
> through clk_get(), ie. the cpu clocks, system bus clock and memory
> clocks.
> 
> Add the missing clkdev so that their rate can be acquired.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
