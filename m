Return-Path: <sboyd@codeaurora.org>
Date: Thu, 12 Oct 2017 15:51:00 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <ce3a@gmx.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rabeeh Khoury <rabeeh@solid-run.com>
Subject: Re: [PATCH v2] clk: si5351: Do not enable parent clocks on probe
Message-ID: <20171012225100.GF18706@codeaurora.org>
References: <1501007531-5521-1-git-send-email-ce3a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1501007531-5521-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

On 07/25, Sergej Sawazki wrote:
> The si5351 driver should not prepare or enable other clocks in the tree on
> probe. Let the clients decide when to prepare or enable the clocks.
> 
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
> ---

Is this patch still needed? I was expecting Sebastian to review
and I found it in the bottom of my patch pile.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
