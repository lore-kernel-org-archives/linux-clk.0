Return-Path: <sboyd@codeaurora.org>
Subject: Re: [RFC 00/12] Misc patches for QCOM clocks
To: Abhishek Sahu <absahu@codeaurora.org>, mturquette@baylibre.com
Cc: andy.gross@linaro.org, david.brown@linaro.org, rnayak@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <1232449b-9fb6-fbf6-25ff-953867546217@codeaurora.org>
Date: Thu, 27 Jul 2017 11:39:48 -0700
MIME-Version: 1.0
In-Reply-To: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 07/27/2017 04:10 AM, Abhishek Sahu wrote:
> This patch series does the miscellaneous changes in different
> types of Qualcomm clock nodes which are required for IPQ8074 SoC.
> Following are the major changes in IPQ8074 for which the existing
> code does not have support.
>
> 1. Some of the IPQ8074 RCG2 has CFG_RCGR at offset 8 from
>    CMD_RCGR instead of offset 4. Following are the register
>    offsets of UBI RCG2 in Qualcomm IPQ8074.
>
> 	GCC_NSS_UBI0_CMD_RCGR: 0x1868100
> 	GCC_NSS_UBI0_CFG_RCGR: 0x1868108

That's insane. There's a hardware design mandate to not mess with the
register layout specifically for this reason. Amazing, but not
surprising that someone screwed it up.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
