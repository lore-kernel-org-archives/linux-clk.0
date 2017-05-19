Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 May 2017 18:54:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 01/21] clk: divider: Make divider_round_rate take the
 parent clock
Message-ID: <20170519015430.GF20170@codeaurora.org>
References: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
 <af976be0ecc2ea335cd9694a83fb29174d87e17d.1495006350.git-series.maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <af976be0ecc2ea335cd9694a83fb29174d87e17d.1495006350.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/17, Maxime Ripard wrote:
> So far, divider_round_rate only considers the parent clock returned by
> clk_hw_get_parent.
> 
> This works fine on clocks that have a single parents, this doesn't work on
> muxes, since we will only consider the first parent, while other parents
> may totally be able to provide a better combination.
> 
> Clocks in that case cannot use divider_round_rate, so would have to come up
> with a very similar logic to work around it. Instead of having to do
> something like this, and duplicate that logic everywhere, create a
> divider_round_rate parent to allow caller to give an additional parameter
> for the parent clock to consider.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
