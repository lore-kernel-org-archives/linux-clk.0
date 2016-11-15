Return-Path: <sboyd@codeaurora.org>
Date: Mon, 14 Nov 2016 18:21:10 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, yanhaifeng@hisilicon.com,
	wenpan@hisilicon.com, howell.yang@hisilicon.com,
	qinxiaojun@huawei.com
Subject: Re: [RESEND 2/2] clk: hisilicon: add CRG driver for Hi3516CV300 SoC
Message-ID: <20161115022110.GS5177@codeaurora.org>
References: <1479091794-1145-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1479091794-1145-1-git-send-email-xuejiancheng@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/14, Jiancheng Xue wrote:
> Add CRG driver for Hi3516CV300 SoC. CRG(Clock and Reset
> Generator) module generates clock and reset signals used
> by other module blocks on SoC.
> 
> Signed-off-by: Pan Wen <wenpan@hisilicon.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> ---

Applied to clk-next + fixed the authorship to be Pan Wen.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
