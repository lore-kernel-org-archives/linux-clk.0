Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Feb 2016 17:18:55 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, lee.jones@linaro.org,
	maxime.ripard@free-electrons.com, maxime.coquelin@st.com,
	geert@linux-m68k.org, heiko@sntech.de, andre.przywara@arm.com,
	rklein@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v42 5/6] clk: clk_put WARNs if user has not disabled clk
Message-ID: <20160213011855.GL4847@codeaurora.org>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
 <1455225554-13267-6-git-send-email-mturquette@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455225554-13267-6-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/11, Michael Turquette wrote:
> >From the clk_put kerneldoc in include/linux/clk.h:
> 
> """
> Note: drivers must ensure that all clk_enable calls made on this clock
> source are balanced by clk_disable calls prior to calling this function.
> """
> 
> The common clock framework implementation of the clk.h api has per-user
> reference counts for calls to clk_prepare and clk_disable. As such it
> can enforce the requirement to properly call clk_disable and
> clk_unprepare before calling clk_put.
> 
> Because this requirement is probably violated in many places, this patch
> starts with a simple warning. Once offending code has been fixed this
> check could additionally release the reference counts automatically.

Do we have any fixes for pm code in the works? I'm worried we're
going to be giving a warning and nobody will fix them or has a
plan to fix them.

> 
> Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
