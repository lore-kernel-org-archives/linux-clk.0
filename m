Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Nov 2017 23:31:40 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, mturquette@baylibre.com, baohua@kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sirf: make clk_ops const
Message-ID: <20171102063140.GU30645@codeaurora.org>
References: <1503410541-25461-1-git-send-email-bhumirks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1503410541-25461-1-git-send-email-bhumirks@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/22, Bhumika Goyal wrote:
> Make these const as they are only stored in the const field of a
> clk_init_data structure.
> 
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
