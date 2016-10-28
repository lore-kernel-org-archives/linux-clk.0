Return-Path: <sboyd@codeaurora.org>
Date: Fri, 28 Oct 2016 16:30:59 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Loc Ho <lho@apm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] clk: xgene: Don't call __pa on ioremaped address
Message-ID: <20161028233059.GO16026@codeaurora.org>
References: <1477673978-15424-1-git-send-email-labbott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1477673978-15424-1-git-send-email-labbott@redhat.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/28, Laura Abbott wrote:
> ioremaped addresses are not linearly mapped so the physical
> address can not be figured out via __pa. More generally, there
> is no guarantee that backing value of an ioremapped address
> is a physical address at all. The value here is only used
> for debugging so just drop the call to __pa on the ioremapped
> address.
> 
> Fixes: 6ae5fd381251 ("clk: xgene: Silence sparse warnings")
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
