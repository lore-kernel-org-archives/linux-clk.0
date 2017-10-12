Return-Path: <sboyd@codeaurora.org>
Date: Thu, 12 Oct 2017 15:51:35 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <sergej@taudac.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rabeeh Khoury <rabeeh@solid-run.com>
Subject: Re: [RFC PATCH v1] clk: si5351: Rename internal plls to avoid name
 collisions
Message-ID: <20171012225135.GG18706@codeaurora.org>
References: <1501017662-9239-1-git-send-email-sergej@taudac.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1501017662-9239-1-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/25, Sergej Sawazki wrote:
> This drivers probe fails due to a clock name collision if a clock named
> 'plla' or 'pllb' is already registered when registering this drivers
> internal plls.
> 
> Fix it by renaming internal plls to avoid name collisions.
> 
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> Signed-off-by: Sergej Sawazki <sergej@taudac.com>
> ---

Is this needed still? I was expecting Sebastian to review.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
