Return-Path: <agross@codeaurora.org>
Date: Wed, 21 Oct 2015 21:52:07 -0500
From: Andy Gross <agross@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/8] arm64: dts: qcom: 8x16: Add fixed rate on-board
 oscillator
Message-ID: <20151022025207.GB4968@qualcomm.com>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
 <1445360280-2347-2-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445360280-2347-2-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Oct 20, 2015 at 07:57:53PM +0300, Georgi Djakov wrote:
> Add the on-board XO oscillator. This patch prepares for adding support
> for RPM controlled clocks. In order to do smooth transition and support
> both cases (RPM clock driver is enabled or nor), we first move the XO to
> the DT and change the GCC fixed-rate root clock to a dummy pass-through
> clock. Then if the RPM driver is enabled, we set the parent of the XO
> clock in the RPM clock driver to xo_board.
> The advantage of doing so is that the rate of the XO clock is not hard-
> coded in the GCC driver anymore, but comes from the board layout, so
> that is why it should be in DT anyway.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

Looks good to me.

Reviewed-by: Andy Gross <agross@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
