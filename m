Return-Path: <sboyd@codeaurora.org>
Date: Mon, 14 Sep 2015 14:59:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Luis de Bethencourt <luis@debethencourt.com>
Cc: linux-kernel@vger.kernel.org, Emilio Lopez <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 3/5] clk: sunxi: sun6i-ar100: Fix module autoload for OF
 platform driver
Message-ID: <20150914215917.GE23081@codeaurora.org>
References: <20150828124354.GA26610@goodgumbo.baconseed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150828124354.GA26610@goodgumbo.baconseed.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/28, Luis de Bethencourt wrote:
> This platform driver has a OF device ID table but the OF module
> alias information is not created so module autoloading won't work.
> 
> Signed-off-by: Luis de Bethencourt <luis@debethencourt.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
