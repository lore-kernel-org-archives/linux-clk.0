Return-Path: <sboyd@codeaurora.org>
Date: Fri, 11 Nov 2016 16:04:36 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, bin.chen@linaro.org, elder@linaro.org,
	hermit.wangheming@hisilicon.com, yanhaifeng@hisilicon.com,
	wenpan@hisilicon.com, howell.yang@hisilicon.com
Subject: Re: [PATCH 1/2] clk: hisilicon: add CRG driver for Hi3798CV200 SoC
Message-ID: <20161112000436.GF5177@codeaurora.org>
References: <1477721618-10809-1-git-send-email-xuejiancheng@hisilicon.com>
 <1477721618-10809-2-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1477721618-10809-2-git-send-email-xuejiancheng@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/29, Jiancheng Xue wrote:
> Add CRG driver for Hi3798CV200 SoC. CRG(Clock and Reset
> Generator) module generates clock and reset signals used
> by other module blocks on SoC.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-hisi and merged into clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
