Return-Path: <sboyd@codeaurora.org>
Date: Thu, 10 Nov 2016 15:30:01 -0800
From: 'Stephen Boyd' <sboyd@codeaurora.org>
To: Sricharan <sricharan@codeaurora.org>
Cc: 'Rajendra Nayak' <rnayak@codeaurora.org>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stanimir.varbanov@linaro.org
Subject: Re: [PATCH 3/3] clk: qcom: Set BRANCH_HALT_DELAY flags for venus
 core0/1 clks
Message-ID: <20161110233001.GM16026@codeaurora.org>
References: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org>
 <1477304297-5248-4-git-send-email-sricharan@codeaurora.org>
 <20161103203418.GA16026@codeaurora.org>
 <006701d2367b$19a6ba00$4cf42e00$@codeaurora.org>
 <20161104201836.GE16026@codeaurora.org>
 <58201597.6010207@codeaurora.org>
 <20161108223336.GK16026@codeaurora.org>
 <000301d23aaa$3f5dd110$be197330$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000301d23aaa$3f5dd110$be197330$@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/09, Sricharan wrote:
> 
> So the above is the sequence which is actually carried out on the
> firmware side. The same can be done in host as well.
> The clocks stuck issue indeed is not there with this.

Great! We've finally connected on what the actual problem is.

> But with the above sequence we need to add a step to do inverse
> of STEP3 above (ie write the registers to de-assert hw_signal),
> to keep the subdomains in off, till firmware uses it. So the
> above sequence helps to avoid masking the halt check, although
> the host really does not wants to use these clocks, except
> setting it up for the firmware.
> 

Right, but knowing that the clocks failed to turn on in the first
place is much safer than silently ignoring the failure.
Otherwise, we could hand over control to the firmware, and the
firmware would fail to operate the hardware, and we're stuck with
debugging the firmware now. That sounds quite painful to figure
out.

If we properly toggle the video hw bits in coordination with
firmware and turn on/off the clocks with the GDSC ON, then
debugging is made simpler. The point is, we don't want to lose
robustness by silencing halt checks. The semantics of
clk_enable() means the clock is running, and that won't be true
here unless we ensure the GDSC is enabled.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
