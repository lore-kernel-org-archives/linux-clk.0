Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 Aug 2016 17:04:08 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 3/3] clk: Loongson1: Make use of GENMASK
Message-ID: <20160819000408.GM361@codeaurora.org>
References: <1470999108-9851-1-git-send-email-keguang.zhang@gmail.com>
 <1470999108-9851-4-git-send-email-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470999108-9851-4-git-send-email-keguang.zhang@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Keguang Zhang wrote:
> From: Kelvin Cheung <keguang.zhang@gmail.com>
> 
> Make use of GENMASK instead of open coding the equivalent operation,
> and update the PLL formula.

Was the old formula broken? I would expect a bug fix like this to
be first in the series and be backported to any affected stable
trees.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
