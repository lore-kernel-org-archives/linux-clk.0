Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 17:24:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jon Mason <jonmason@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v2] clk: iproc: Make clocks visible options
Message-ID: <20160915002458.GI7243@codeaurora.org>
References: <1446151450-23563-1-git-send-email-jonmason@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1446151450-23563-1-git-send-email-jonmason@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/29, Jon Mason wrote:
> Make the clocks visible options that can be selected by anyone.  This
> avoids the problems of:
>  1) Select is a reverse dependency and is hard for people to understand
>     and can sometimes be a pain to track down
>  2) Build coverage goes down because configs are hidden
>  3) Code bloat
> 
> Patch suggested by Stephen Boyd
> 
> Signed-off-by: Jon Mason <jonmason@broadcom.com>
> ---

Applied to clk-next with some minor fixup in the Makefile. I know
this is almost a year old, but it still mostly applied.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
