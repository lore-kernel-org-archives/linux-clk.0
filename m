Return-Path: <sboyd@codeaurora.org>
Date: Tue, 29 Mar 2016 16:30:14 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>, Barry Song <baohua@kernel.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 6/7] clk: tegra: Make reset_control_ops const
Message-ID: <20160329233014.GN18567@codeaurora.org>
References: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
 <1456393512-26602-7-git-send-email-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456393512-26602-7-git-send-email-p.zabel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On 02/25, Philipp Zabel wrote:
> The rst_ops structure is never modified. Make it const.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
