Return-Path: <sboyd@codeaurora.org>
Date: Fri, 10 Feb 2017 09:20:23 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rajendra Nayak <rnayak@codeaurora.org>, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: add parent for venus core0 and core1 gdsc's
Message-ID: <20170210172023.GQ25384@codeaurora.org>
References: <1486653630-15552-1-git-send-email-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1486653630-15552-1-git-send-email-stanimir.varbanov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 02/09, Stanimir Varbanov wrote:
> Make venus_gdsc parent of venus gdsc core0 and core1.
> 

Ok, but why? Do we need the venus_gdsc to be on for the
venus_core0_gdsc to work? More details in commit text please.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
