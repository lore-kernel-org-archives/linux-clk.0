Return-Path: <sboyd@codeaurora.org>
Date: Thu, 12 Jan 2017 14:06:27 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Gabriel Fernandez <gabriel.fernandez@st.com>,
	Rob Herring <robh@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: stm32f4: avoid uninitialized variable access
Message-ID: <20170112220627.GQ17126@codeaurora.org>
References: <20170111134107.3821564-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170111134107.3821564-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 01/11, Arnd Bergmann wrote:
> The failure path in the newly added function tries to free an
> uninitialized pointer:
> 
> drivers/clk/clk-stm32f4.c: In function 'stm32f4_rcc_init':
> drivers/clk/clk-stm32f4.c:1106:4: error: 'gate' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> 
> I'm adding an initialization to NULL here to make the kfree()
> succeed, and I'm also rearranging the cleanup so that the
> same kfree() is used for any error path, making the function
> slightly more robust against newly introduced bugs in the
> error handling.
> 
> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next. Seems I need to update my compiler to find
these warnings.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
