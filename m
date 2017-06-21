Return-Path: <sboyd@codeaurora.org>
Date: Wed, 21 Jun 2017 10:49:14 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Binbin Zhou <zhoubb@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>,
	James Hogan <james.hogan@imgtec.com>,
	John Crispin <john@phrozen.org>,
	"Steven J . Hill" <Steven.Hill@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fuxin Zhang <zhangfx@lemote.com>,
	Zhangjin Wu <wuzhangjin@gmail.com>,
	Kelvin Cheung <keguang.zhang@gmail.com>,
	Yang Ling <gnaygnil@gmail.com>,
	=?utf-8?B?6LCi6Ie06YKm?= <Yeking@Red54.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
	HuaCai Chen <chenhc@lemote.com>
Subject: Re: [PATCH v8 8/9] clk: Loongson: Add Loongson-1A clock support
Message-ID: <20170621174914.GE4493@codeaurora.org>
References: <1497949027-10988-1-git-send-email-zhoubb@lemote.com>
 <1497949027-10988-9-git-send-email-zhoubb@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1497949027-10988-9-git-send-email-zhoubb@lemote.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/20, Binbin Zhou wrote:
> This patch adds clock support to Loongson-1A SoC.
> 
> Unfortunately, The Loongson-1A's PLL register is written only,
> so we just set it with a fixed value.
> 
> Signed-off-by: Binbin Zhou <zhoubb@lemote.com>
> Signed-off-by: HuaCai Chen <chenhc@lemote.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-clk@vger.kernel.org
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
