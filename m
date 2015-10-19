Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] clk: samsung: exynos4: Add SSS gate clock
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1445230834-32689-1-git-send-email-k.kozlowski@samsung.com>
 <1445230834-32689-2-git-send-email-k.kozlowski@samsung.com>
 <20151019195946.GH10182@codeaurora.org>
Cc: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <56258203.8030500@samsung.com>
Date: Tue, 20 Oct 2015 08:51:31 +0900
MIME-version: 1.0
In-reply-to: <20151019195946.GH10182@codeaurora.org>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 20.10.2015 04:59, Stephen Boyd wrote:
> On 10/19, Krzysztof Kozlowski wrote:
>> Add a gate clock for controlling all clocks of Security Sub System
>> (SSS).
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> ---
> 
> The To: list is huge, so I have no idea if you want me to apply
> this patch or not, and given that it's part of a series that has
> dts changes I guess that means it should go through arm-soc:
> 
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

If you are OK with that I would like to push it through arm-soc. Thanks
for the ack!

Best regards,
Krzysztof
