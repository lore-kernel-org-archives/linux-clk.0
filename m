Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH 0/2] ARM: dts: Fix imprecise external abort error when
 accessing Exynos MFC
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org
References: <1464111662-15336-1-git-send-email-javier@osg.samsung.com>
 <6479e0c0-97fb-ca3b-1337-6ed11410d94f@samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 Shuah Khan <shuahkh@osg.samsung.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <d90b6245-1ed4-32c6-c98d-cc5f12601205@osg.samsung.com>
Date: Wed, 25 May 2016 10:17:52 -0400
MIME-Version: 1.0
In-Reply-To: <6479e0c0-97fb-ca3b-1337-6ed11410d94f@samsung.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hello Marek,

On 05/25/2016 02:51 AM, Marek Szyprowski wrote:
> Hello,
> 
> 
> On 2016-05-24 19:41, Javier Martinez Canillas wrote:
>> This series fixes an imprecise external abort error when accessing the
>> Exynos MFC registers due the power domain configuration requiring the
>> aclk333 clock to be enabled during a domain switch.
>>
>> There isn't a dependency between the clock and Linux Samsung SoC trees
>> because the CLK_ACLK333 clock ID is already defined so the patches can
>> be picked indepedently by the relevant subsystem maintainers.
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> I'm really curious what kind of async-bridge is there, but this patch
> really fixes the problem with mfc power domain.
>

Yes, the Exynos manual is not that clear about what clocks have to remain
enabled during a power domain switch for an IP block so maybe I got wrong.

I see that the MFC block has an async-bridge in "Figure 15-1" at section 
"15.2.1 NoC Probes in 5420 Bus". And I thought that since the IP block
has an async-bridge, the clock needs to remain ungated when the PMU turn
it on and off on a power domain switch.

I chose that clock because "Figure 7-10 MFC Clock Diagram" at section
"7.4.7 MFC Clock Diagram" shows that ACLK_333 is associated with the
MFC internal buses, or at least that's my understanding.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
