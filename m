Return-Path: <gabriel.fernandez@st.com>
Subject: Re: [PATCH] clk: stm32f4: avoid uninitialized variable access
To: Arnd Bergmann <arnd@arndb.de>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <20170111134107.3821564-1-arnd@arndb.de>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@st.com>,
        Rob Herring <robh@kernel.org>,
        Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
From: Gabriel Fernandez <gabriel.fernandez@st.com>
Message-ID: <a3c0ae24-0289-b008-ebdb-9c9ea289fec3@st.com>
Date: Wed, 11 Jan 2017 17:08:55 +0100
MIME-Version: 1.0
In-Reply-To: <20170111134107.3821564-1-arnd@arndb.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 01/11/2017 02:40 PM, Arnd Bergmann wrote:
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
>   drivers/clk/clk-stm32f4.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
>
Acked-by: Gabriel Fernandez <gabriel.fernandez@st.com>
