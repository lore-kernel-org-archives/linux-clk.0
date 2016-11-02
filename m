Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:25:16 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	robdclark@gmail.com, jcrouse@codeaurora.org
Subject: Re: [PATCH 1/2] clk: qcom: Handle the clamp_io assert/deassert
 sequence
Message-ID: <20161102002516.GD16026@codeaurora.org>
References: <1476956287-13749-1-git-send-email-rnayak@codeaurora.org>
 <1476956287-13749-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1476956287-13749-2-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/20, Rajendra Nayak wrote:
> Add a flag to mark gdscs which need to support the clamp deassert/assert
> before and after the gdsc enable/disable
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
