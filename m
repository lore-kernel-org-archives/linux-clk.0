Return-Path: <sboyd@codeaurora.org>
Date: Thu, 8 Dec 2016 16:19:30 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v2] clk:mmp:clk-of-pxa910: Free memory and Unmap region
 obtained by kzmalloc and of_iomap
Message-ID: <20161209001930.GA5423@codeaurora.org>
References: <1474369178-16015-1-git-send-email-arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474369178-16015-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/20, Arvind Yadav wrote:
> From: Arvind Yadav <arvind.yadav.cs@gmail.com>
> 
> Free memory and memory mapping , if pxa910_clk_init is not successful.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
