Return-Path: <sboyd@codeaurora.org>
Date: Fri, 26 Jan 2018 16:49:17 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] clk: Properly update prepare/enable count on orphan
 clock reparent
Message-ID: <20180127004917.GI28313@codeaurora.org>
References: <CGME20180126091902eucas1p2b3ad9978e3ab09bd7a2bd9123c9eecaa@eucas1p2.samsung.com>
 <20180126091845.11902-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180126091845.11902-1-m.szyprowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/26, Marek Szyprowski wrote:
> If orphaned clock has been already prepared/enabled (for example if it or
> one of its children has CLK_IS_CRITICAL flag), then the prepare/enable
> counters of the newly assigned parent are not updated correctly. This
> might later cause warnings during changing clock parents.

This doesn't feel right. Perhaps we should delay enabling a clk
if it's CRITICAL until we adopt an orphaned clk. Good news is we
have orphan status tracking now so this should be pretty simple.
Otherwise migrating the count up is complicated and requires us
to call the prepare/enable ops on a critical clk and then keep
doing that each time it gets re-parented. Do you have this case,
where some clk is marked as CRITICAL, and then we need to migrate
that enable/prepare count to the parent?

Hopefully it isn't the worser case, where the clk is handed out
to some consumer but it's still orphaned at that point, and then
we have little control over the migration of state to the parent.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
