Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 16:05:26 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Purna Chandra Mandal <purna.mandal@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
	Ralf Baechle <ralf@linux-mips.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/11] clk: microchip: use readl_poll_timeout() in
 pbclk_set_rate().
Message-ID: <20160824230526.GG19826@codeaurora.org>
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/17, Purna Chandra Mandal wrote:
> pbclk_set_rate() is using readl_poll_timeout_atomic() even
> though spinlock is released. Fix it by replacing with
> readl_poll_timeout().
> 
> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
