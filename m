Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Oct 2015 15:23:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 08/19] clk: st: fix handling result of
 of_property_count_strings
Message-ID: <20151001222343.GO19319@codeaurora.org>
References: <1443103227-25612-1-git-send-email-a.hajda@samsung.com>
 <1443103227-25612-9-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1443103227-25612-9-git-send-email-a.hajda@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/24, Andrzej Hajda wrote:
> The function can return negative value.
> 
> The problem has been detected using proposed semantic patch
> scripts/coccinelle/tests/assign_signed_to_unsigned.cocci [1].
> 
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2046107
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
