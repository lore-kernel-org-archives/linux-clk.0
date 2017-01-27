Return-Path: <sboyd@codeaurora.org>
Date: Thu, 26 Jan 2017 16:12:54 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: sunxi-ng: a33: Set CLK_SET_RATE_PARENT for the
 GPU
Message-ID: <20170127001254.GR8801@codeaurora.org>
References: <53c56d23af099d8a41460d5ac59a2c792c8d050c.1485250845.git-series.maxime.ripard@free-electrons.com>
 <1914af84712092019181807ddb72adfc5b40c6f4.1485250845.git-series.maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1914af84712092019181807ddb72adfc5b40c6f4.1485250845.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/24, Maxime Ripard wrote:
> In order to achieve all the rates asked by the GPU, we might need to change
> the parent frequency.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
