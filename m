Return-Path: <sboyd@codeaurora.org>
Date: Thu, 13 Jul 2017 10:50:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Tirupathi Reddy <tirupath@codeaurora.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
	andy.gross@linaro.org, david.brown@linaro.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org
Subject: Re: [PATCH V1]: clk: qcom: support qpnp clock divider configuration
Message-ID: <20170713175048.GB22780@codeaurora.org>
References: <1499945536-18281-1-git-send-email-tirupath@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1499945536-18281-1-git-send-email-tirupath@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/13, Tirupathi Reddy wrote:
> This patch adds a new device driver for configuring the clkdiv module
> presents on the Qualcomm QPNP PMIC. The driver configures the frequency
> of clkdiv outputs. The driver provides callback functions for different
> clock operations and register the clkdiv module to clock framework.
> 

Please don't send cover letters for single patches.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
