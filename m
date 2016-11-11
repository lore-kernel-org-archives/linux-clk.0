Return-Path: <sboyd@codeaurora.org>
Date: Thu, 10 Nov 2016 16:48:05 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 3/3] clk: qcom: Always add factor clock for xo clocks
Message-ID: <20161111004805.GA5177@codeaurora.org>
References: <20161102155658.32203-1-georgi.djakov@linaro.org>
 <20161102155658.32203-4-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161102155658.32203-4-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/02, Georgi Djakov wrote:
> Currently the RPM/RPM-SMD clock drivers do not register the xo clocks,
> so we should always add factor clock. When we later add xo clocks support
> into the drivers, we should update this function to skip registration.
> By doing so we avoid any DT dependencies.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

Applied to clk-qcom-rpm and merged into clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
