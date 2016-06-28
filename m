Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 28 Jun 2016 15:55:18 -0500
From: Rob Herring <robh@kernel.org>
To: Jongsung Kim <neidhard.kim@lge.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chanho Min <chanho.min@lge.com>
Subject: Re: [PATCH v2] clk: fixed-factor: add optional dt-binding clock-flags
Message-ID: <20160628205518.GF3737@rob-hp-laptop>
References: <20160621005910.GN1521@codeaurora.org>
 <1466741572-58802-1-git-send-email-neidhard.kim@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1466741572-58802-1-git-send-email-neidhard.kim@lge.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 24, 2016 at 01:12:52PM +0900, Jongsung Kim wrote:
> There is no way to set additional flags for a DT-initialized fixed-
> factor-clock, and it can be problematic i.e., when the clock rate
> needs to be changed. [1][2]
> 
> This patch introduces an optional dt-binding named "clock-flags" to
> be used for passing any needed flags from dts.

I don't think we want this in DT. If we did, the flags would need some 
documentation about what the flags mean.

Rob
