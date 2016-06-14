Return-Path: <sboyd@codeaurora.org>
Date: Tue, 14 Jun 2016 10:39:10 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, s.hauer@pengutronix.de,
	jeremy.kerr@canonical.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Convert clk-fixed into module platform driver
Message-ID: <20160614173910.GB28218@codeaurora.org>
References: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/08, Ricardo Ribalda Delgado wrote:
> When clock providers are added to the device tree after of_clk_init is called
> they are not added to the clock provider list. This makes that drivers such
> as i2c-xiic.c fail to init, as they may depend on the unadded clock provider.

Who's the provider here? It isn't clear to me why we're
populating fixed factor and fixed rate clks from DT for i2c
devices? Presumably there's an i2c device driver that should be
populating clks from C code instead?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
