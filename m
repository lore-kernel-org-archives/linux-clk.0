Return-Path: <krzk@kernel.org>
Subject: Re: [PATCH v2 06/22] ARM: dts: exynos: Remove old fixed-clock provider
 on SMDK5410
To: Javier Martinez Canillas <javier@osg.samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-7-git-send-email-krzk@kernel.org>
 <723d088c-ada7-a18f-87a2-e7caaf2c56fd@osg.samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Message-id: <57317125.5030702@kernel.org>
Date: Tue, 10 May 2016 07:27:01 +0200
MIME-version: 1.0
In-reply-to: <723d088c-ada7-a18f-87a2-e7caaf2c56fd@osg.samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/09/2016 10:24 PM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 05/08/2016 03:05 PM, Krzysztof Kozlowski wrote:
>> All "fin_pll" clock users are switched to the new one, provided by
> 
> s/are switched/were switched

Thanks for spotting this,
Krzysztof
