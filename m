Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Nov 2017 01:19:41 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk/tegra: Delete an error message for a failed memory
 allocation in three functions
Message-ID: <20171102081941.GO11011@codeaurora.org>
References: <9cc51853-c393-91e6-45d8-6516dde90366@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9cc51853-c393-91e6-45d8-6516dde90366@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/27, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 18:40:34 +0200
> 
> Omit extra messages for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
