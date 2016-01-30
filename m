Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Jan 2016 16:44:03 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 14/38] clk: vt8500: fix sign of possible PLL values
Message-ID: <20160130004403.GO12841@codeaurora.org>
References: <20151001225628.GU19319@codeaurora.org>
 <1443761393-29366-1-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1443761393-29366-1-git-send-email-a.hajda@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/02, Andrzej Hajda wrote:
> With unsigned values underflow in loops can occur resulting in
> theoretically infinite loops.
> 
> The problem has been detected using proposed semantic patch
> scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].
> 
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2038576
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
