Return-Path: <daniel.thompson@linaro.org>
Return-Path: <daniel.thompson@linaro.org>
Subject: Re: [PATCH 30/34] clk: stm32f3: Migrate to clk_hw based OF and
 registration APIs
To: Stephen Boyd <stephen.boyd@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <20160601231533.9354-1-stephen.boyd@linaro.org>
 <20160601231533.9354-31-stephen.boyd@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <8dcaca11-b193-64d2-8fa6-7f3f031b328b@linaro.org>
Date: Mon, 6 Jun 2016 14:48:01 +0100
MIME-Version: 1.0
In-Reply-To: <20160601231533.9354-31-stephen.boyd@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 02/06/16 00:15, Stephen Boyd wrote:

Minor nit but the subject is wrong [IIRC stm32f3 cannot run Linux ;-)].


Daniel.

> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs.
>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
