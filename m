Return-Path: <sboyd@codeaurora.org>
Date: Thu, 31 Aug 2017 18:43:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alex Frid <afrid@nvidia.com>
Subject: Re: [PATCH] clk: Don't write error code into divider register
Message-ID: <20170901014325.GU21656@codeaurora.org>
References: <1500977920-5533-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1500977920-5533-1-git-send-email-pdeschrijver@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/25, Peter De Schrijver wrote:
> From: Alex Frid <afrid@nvidia.com>
> 
> Add a check for error returned by divider value calculation to avoid
> writing error code into hw register.
> 
> Signed-off-by: Alex Frid <afrid@nvidia.com>
> Reviewed-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Reviewed-by: Jon Mayo <jmayo@nvidia.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
