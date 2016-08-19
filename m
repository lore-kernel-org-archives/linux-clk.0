Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 Aug 2016 17:03:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 2/3] clk: Loongson1: Update clocks of Loongson1B
Message-ID: <20160819000336.GL361@codeaurora.org>
References: <1470999108-9851-1-git-send-email-keguang.zhang@gmail.com>
 <1470999108-9851-3-git-send-email-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470999108-9851-3-git-send-email-keguang.zhang@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Keguang Zhang wrote:
> From: Kelvin Cheung <keguang.zhang@gmail.com>
> 
> This patch updates some clock names of Loongson1B,
> and adds AC97, DMA and NAND clock.
> 
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>

Ah here's the rewrite of the name. We should squash the other
patch into this one so that we don't break bisection.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
