Return-Path: <sboyd@codeaurora.org>
Date: Mon, 20 Jun 2016 17:48:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Roman Volkov <v1ron@mail.ru>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Volkov <rvolkov@v1ros.org>,
	Tony Prisk <linux@prisktech.co.nz>
Subject: Re: [PATCH v2 1/2] clk: vt8500: fix gcc-4.9 warnings
Message-ID: <20160621004844.GK1521@codeaurora.org>
References: <20160607215610.8724-1-v1ron@mail.ru>
 <20160607215610.8724-2-v1ron@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20160607215610.8724-2-v1ron@mail.ru>
List-ID: <linux-clk.vger.kernel.org>

On 06/08, Roman Volkov wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This fixes some false positive warnings we get with older compiler
> versions:
> 
> clk-vt8500.c: In function ‘wm8650_find_pll_bits’:
> clk-vt8500.c:430:12: ‘best_div2’ may be used uninitialized in this function
> clk-vt8500.c:429:12: ‘best_div1’ may be used uninitialized in this function
> clk-vt8500.c:428:14: ‘best_mul’ may be used uninitialized in this function
> clk-vt8500.c: In function ‘wm8750_find_pll_bits’:
> clk-vt8500.c:509:12: ‘best_div2’ may be used uninitialized in this function
> clk-vt8500.c:508:12: ‘best_div1’ may be used uninitialized in this function
> clk-vt8500.c:507:14: ‘best_mul’ may be used uninitialized in this function
> clk-vt8500.c: In function ‘wm8850_find_pll_bits’:
> clk-vt8500.c:560:12: ‘best_div2’ may be used uninitialized in this function
> clk-vt8500.c:559:12: ‘best_div1’ may be used uninitialized in this function
> clk-vt8500.c:558:14: ‘best_mul’ may be used uninitialized in this function
> 
> As the local variables are only use for temporaries, we can just
> as well assign the final values directly, which also makes the
> code slightly shorter.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Roman Volkov <rvolkov@v1ros.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
