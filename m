Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Feb 2016 17:16:47 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, lee.jones@linaro.org,
	maxime.ripard@free-electrons.com, maxime.coquelin@st.com,
	geert@linux-m68k.org, heiko@sntech.de, andre.przywara@arm.com,
	rklein@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v42 4/6] clk: per-user clk prepare & enable ref counts
Message-ID: <20160213011647.GK4847@codeaurora.org>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
 <1455225554-13267-5-git-send-email-mturquette@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455225554-13267-5-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/11, Michael Turquette wrote:
> This patch adds prepare and enable reference counts for the per-user
> handles that clock consumers have for a clock node. This patch warns if
> an imbalance occurs while trying to disable or unprepare a clock and
> aborts, leaving the hardware unaffected.
> 
> Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
