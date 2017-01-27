Return-Path: <sboyd@codeaurora.org>
Date: Thu, 26 Jan 2017 16:00:20 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stanimir.varbanov@linaro.org, sricharan@codeaurora.org
Subject: Re: [PATCH v2] clk: qcom: gdsc: Fix handling of hw control
 enable/disable
Message-ID: <20170127000020.GJ8801@codeaurora.org>
References: <1485145581-517-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1485145581-517-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 01/23, Rajendra Nayak wrote:
> Once a gdsc is brought in and out of HW control, there is a
> power down and up cycle which can take upto 1us. Polling on
> the gdsc status immediately after the hw control enable/disable
> can mislead software/firmware to belive the gdsc is already either on
> or off, while its yet to complete the power cycle.
> To avoid this add a 1us delay post a enable/disable of HW control
> mode.
> 
> Also after the HW control mode is disabled, poll on the status to
> check gdsc status reflects its 'on' before force disabling it
> in software.
> 
> Reported-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next + I added a fixes tag. I don't think any
driver is affected by this problem in mainline, hence the punt to
v4.11.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
