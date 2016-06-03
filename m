Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH 25/34] clk: s2mps11: Migrate to clk_hw based OF and
 registration APIs
To: Stephen Boyd <stephen.boyd@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <20160601231533.9354-1-stephen.boyd@linaro.org>
 <20160601231533.9354-26-stephen.boyd@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andi Shyti <andi.shyti@samsung.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <57512F3D.8090201@samsung.com>
Date: Fri, 03 Jun 2016 09:18:21 +0200
MIME-version: 1.0
In-reply-to: <20160601231533.9354-26-stephen.boyd@linaro.org>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/02/2016 01:15 AM, Stephen Boyd wrote:
> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs.
> 
> Cc: Andi Shyti <andi.shyti@samsung.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
> 
> See commit 58657d189a2f and it's children for details on this
> new registration API.
> 
>  drivers/clk/clk-s2mps11.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)

Looks and works correct:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
