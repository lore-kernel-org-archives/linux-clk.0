Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:64619 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbcHQGFI (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 17 Aug 2016 02:05:08 -0400
Subject: Re: [PATCH v2] clk: max77686: Migrate to clk_hw based OF and
 registration APIs
To: Stephen Boyd <stephen.boyd@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
References: <20160816223856.1282-1-stephen.boyd@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <ab7f86c8-8feb-1512-2046-016b950ce68b@samsung.com>
Date: Wed, 17 Aug 2016 08:05:03 +0200
MIME-version: 1.0
In-reply-to: <20160816223856.1282-1-stephen.boyd@linaro.org>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/17/2016 12:38 AM, Stephen Boyd wrote:
> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs.
> 
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
>  drivers/clk/clk-max77686.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)

Looks correct. The pr_err() could be replaced to dev_err() but first
pointer to dev should be stored... so this may be fixed on different patch.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
