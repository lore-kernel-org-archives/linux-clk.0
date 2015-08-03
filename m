Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 3 Aug 2015 11:08:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Tero Kristo <t-kristo@ti.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 23/26] clk: tegra: Convert to clk_hw based provider APIs
Message-ID: <20150803180846.GA8318@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-24-git-send-email-sboyd@codeaurora.org>
 <55BF2395.8000604@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <55BF2395.8000604@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/03, Tero Kristo wrote:
> On 07/31/2015 08:04 PM, Stephen Boyd wrote:
> >We're removing struct clk from the clk provider API, so switch
> >this code to using the clk_hw based provider APIs.
> >
> 
> Subject should be clk: ti: ...
> 
> Other than that, seems ok to me. Also, gave clk-next + this set a
> quick testing on the boards accessible to me, and seems to work
> fine.
> 
> So, once the subject is fixed, for TI relevant parts for patches 2,
> 5, 7, 8, 23:
> 
> Acked-by: Tero Kristo <t-kristo@ti.com>
> 

Thanks. I fixed the subject.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
