Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Jun 2017 10:49:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: palmas: undo preparation of a clock source.
Message-ID: <20170602174946.GL20170@codeaurora.org>
References: <1493384587-32659-1-git-send-email-arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1493384587-32659-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/28, Arvind Yadav wrote:
> Undo preparation of a clock source, if palmas_clks_init_configure is not
> successful.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
