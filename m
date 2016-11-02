Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:44:21 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH RFT] clk: qcom: lcc-ipq806x: Fixup overriding val in
 regmap_read call
Message-ID: <20161102004421.GS16026@codeaurora.org>
References: <1473479250-2225-1-git-send-email-axel.lin@ingics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1473479250-2225-1-git-send-email-axel.lin@ingics.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/10, Axel Lin wrote:
> Drop the assignment of regmap_read return code to val, so the code checks
> the value read.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---

I never got around to testing it, but it looks correct enough.

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
