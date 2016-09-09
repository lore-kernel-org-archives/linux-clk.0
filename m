Return-Path: <sboyd@codeaurora.org>
Date: Fri, 9 Sep 2016 11:07:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: rk808: Pass the right pointer as the get_hw context
Message-ID: <20160909180718.GC7243@codeaurora.org>
References: <1473427506-28244-1-git-send-email-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1473427506-28244-1-git-send-email-tomeu.vizoso@collabora.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/09, Tomeu Vizoso wrote:
> Right now we are passing a pointer to a pointer to the structure that
> will be used to fetch the clk hw, which gets casted later to a pointer
> to the structure, thus getting garbage in the hw structs.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Fixes: a8b6e85db6a6 ("clk: rk808: Migrate to clk_hw based OF and
> registration APIs")
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
