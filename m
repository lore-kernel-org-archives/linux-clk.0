Return-Path: <sboyd@codeaurora.org>
Date: Tue, 2 Jan 2018 10:13:06 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Amit Nischal <anischal@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: qcom: MISC RCG changes for SDM845
Message-ID: <20180102181306.GF7997@codeaurora.org>
References: <1514877987-8082-1-git-send-email-anischal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1514877987-8082-1-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 01/02, Amit Nischal wrote:
> Changes in v2:
> * Changed usage of clk_hw_is_prepared() to __clk_is_enabled()
>   in clk_rcg2_shared_ops to fix build test error.

Please change it to read the hardware directly and not use
__clk_is_enabled() or clk_hw_is_prepared().

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
