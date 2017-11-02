Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Nov 2017 23:31:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, mturquette@baylibre.com, baohua@kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: make clk_init_data const
Message-ID: <20171102063152.GZ30645@codeaurora.org>
References: <1503050897-23252-1-git-send-email-bhumirks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1503050897-23252-1-git-send-email-bhumirks@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/18, Bhumika Goyal wrote:
> Make these const as they are only stored in the init field of a clk_hw
> structure, which is const.
> 
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
