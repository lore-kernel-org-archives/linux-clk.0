Return-Path: <sboyd@codeaurora.org>
Date: Thu, 11 Feb 2016 16:31:05 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] clk: qcom: gdsc: Add support for hierarchical
 power domains
Message-ID: <20160212003105.GM30978@codeaurora.org>
References: <1448986336-16846-1-git-send-email-rnayak@codeaurora.org>
 <1448986336-16846-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448986336-16846-2-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Rajendra Nayak wrote:
> Some qcom SoCs' can have hierarchical power domains. Let the gdsc structs
> specify the parents (if any) and the driver add genpd subdomains for them.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
