Return-Path: <sboyd@codeaurora.org>
Date: Wed, 7 Dec 2016 16:17:06 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] clk: uniphier: add CPU-gear change (cpufreq)
 support
Message-ID: <20161208001706.GE5423@codeaurora.org>
References: <1481074353-31535-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1481074353-31535-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/07, Masahiro Yamada wrote:
> Core support code for CPU frequency changes, which will be used by
> the generic cpufreq driver.
> 
> The register view is different from the generic clk-mux; it has
> a separate status register, and an update bit to load the register
> setting.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
