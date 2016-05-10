Return-Path: <krzk@kernel.org>
Subject: Re: [PATCH v2 22/22] ARM: dts: exynos: Add initial support for Odroid
 XU board
To: Javier Martinez Canillas <javier@osg.samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-23-git-send-email-krzk@kernel.org>
 <cbcb5657-8825-83cf-688f-d565ac7ecbab@osg.samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Message-id: <57317333.5010309@kernel.org>
Date: Tue, 10 May 2016 07:35:47 +0200
MIME-version: 1.0
In-reply-to: <cbcb5657-8825-83cf-688f-d565ac7ecbab@osg.samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/10/2016 12:02 AM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 05/08/2016 03:06 PM, Krzysztof Kozlowski wrote:
>> The Hardkernel's Odroid XU board was first design with big.LITTLE SoC
>> from Samsung: the Exynos5410. Comparing now to more popular Odroid XU3
>> the differences are:
>> 1. Exynos5410 instead of 5422,
>> 2. DisplayPort,
>> 3. Main PMIC: Maxim 77802 instead of S2MPS11,
>> 4. USB3503+LAN9730 instead of integrated LAN9514,
>> 5. eMMC 4.5 instead of eMMC 5.0,
>>
>> This patch adds initial support for the XU board with working basic
>> functions, eMMC/SD and USB (including attached ethernet adapter).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
> 
> This DTS has some TODO's, FIXME's and commented input supplies. Probably
> this patch should had been an RFC? or you should mention about these in
> the commit message to understand why are there.

I have to clean it up or fix these notes. Actually I was quite surprised
that board worked fine with this basic setup.

Best regards,
Krzysztof
