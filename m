Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 18:11:08 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	ldv-project@linuxtesting.org
Subject: Re: [PATCH] clk: si5351: implement remove handler
Message-ID: <20171222021108.GK7997@codeaurora.org>
References: <1505514630-19874-1-git-send-email-khoroshilov@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1505514630-19874-1-git-send-email-khoroshilov@ispras.ru>
List-ID: <linux-clk.vger.kernel.org>

On 09/16, Alexey Khoroshilov wrote:
> The driver has no remove function, so it does not cleanup
> resources that are not under devm management.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
