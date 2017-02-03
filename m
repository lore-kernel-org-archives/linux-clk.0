Return-Path: <sboyd@codeaurora.org>
Date: Fri, 3 Feb 2017 11:55:26 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: uniphier: add eMMC clock for LD11 and LD20 SoCs
Message-ID: <20170203195526.GC25384@codeaurora.org>
References: <1485610021-9905-1-git-send-email-yamada.masahiro@socionext.com>
 <1485610021-9905-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1485610021-9905-2-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/28, Masahiro Yamada wrote:
> Add clock for the Cadence eMMC controller on LD11/LD20.
> For the other SoCs, the clock for the eMMC controller is included
> in the MIO/SD control block.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
