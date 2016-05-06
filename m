Return-Path: <sboyd@codeaurora.org>
Date: Fri, 6 May 2016 11:06:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vaishali Thakkar <vaishali.thakkar@oracle.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: bcm/kona: Do not use sizeof on pointer type
Message-ID: <20160506180646.GZ3492@codeaurora.org>
References: <1461851433-19365-1-git-send-email-vaishali.thakkar@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461851433-19365-1-git-send-email-vaishali.thakkar@oracle.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/28, Vaishali Thakkar wrote:
> When sizeof is applied to a pointer typed expression, it gives
> the size of the pointer. So, here do not use sizeof on pointer
> type. Also, silent checkpatch.pl by using kmalloc_array over
> kmalloc.
> 
> Note that this has no effect on runtime because 'parent_names'
> is a pointer to a pointer.
> 
> Problem found using Coccinelle.
> 
> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@oracle.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
