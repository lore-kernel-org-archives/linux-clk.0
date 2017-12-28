Return-Path: <sboyd@codeaurora.org>
Date: Thu, 28 Dec 2017 10:43:44 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Igor Grinberg <grinberg@compulab.co.il>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: pxa: unbreak lookup of CLK_POUT
Message-ID: <20171228184344.GP7997@codeaurora.org>
References: <20171226133036.11432-1-grinberg@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171226133036.11432-1-grinberg@compulab.co.il>
List-ID: <linux-clk.vger.kernel.org>

On 12/26, Igor Grinberg wrote:
> Since switching to clk drivers, the CLK_POUT cannot be searched for by
> clk_get() API and thus it returns with ENOENT.
> Register it with the clk_lookup and thus unbreak the users of it.
> 
> Signed-off-by: Igor Grinberg <grinberg@compulab.co.il>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
