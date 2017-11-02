Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Nov 2017 23:22:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, vireshk@kernel.org, mturquette@baylibre.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] CLK: SPEAr: make structure field and function
 argument as const
Message-ID: <20171102062243.GS30645@codeaurora.org>
References: <1508251114-7042-1-git-send-email-bhumirks@gmail.com>
 <1508251114-7042-2-git-send-email-bhumirks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1508251114-7042-2-git-send-email-bhumirks@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/17, Bhumika Goyal wrote:
> Make the masks field of clk_aux structure const as it do not modify the
> fields of the aux_clk_masks structure it points to.
> 
> Make the struct aux_clk_masks *aux argument of the function
> clk_register_aux as const as the argument is only stored in the masks
> field of a clk_aux structure which is now made const.
> 
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
