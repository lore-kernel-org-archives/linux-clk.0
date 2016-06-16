Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH 5/5] ARM: config: Get rid of config COMMON_CLK_MAX77802
To: Javier Martinez Canillas <javier@osg.samsung.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, mturquette@baylibre.com,
 robh+dt@kernel.org, linux@armlinux.org.uk
References: <1466000018-16784-1-git-send-email-ldewangan@nvidia.com>
 <1466000018-16784-6-git-send-email-ldewangan@nvidia.com>
 <3fa0a098-3b28-9baa-8950-a944cce86b65@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 Javier Martinez Canillas <javier@dowhile0.org>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <57629AB9.2090506@samsung.com>
Date: Thu, 16 Jun 2016 14:25:29 +0200
MIME-version: 1.0
In-reply-to: <3fa0a098-3b28-9baa-8950-a944cce86b65@osg.samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/15/2016 05:39 PM, Javier Martinez Canillas wrote:
> Hello Laxman,
> 
> On 06/15/2016 10:13 AM, Laxman Dewangan wrote:
>> The clock driver used by Maxim PMIC MAX77802 is clk-max77686
>> which can be enabled with config CONFIG_COMMON_CLK_MAX77686.
>>
>> Hence the config CONFIG_COMMON_CLK_MAX77802 is not required.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> CC: Javier Martinez Canillas <javier@dowhile0.org>
>> ---
>>  arch/arm/configs/exynos_defconfig   | 1 -
>>  arch/arm/configs/multi_v7_defconfig | 1 -
> 
> Please split these two changes in separate patches, there are just
> cleanups needed after 1/5 and they can be picked separately.

Not entirely separately. If we do not want to loose max77802 clocks on
defconfigs, then it should go with the same tree or after driver get
merged. I prefer the latter, similar case to 1898994229f8 ("ARM:
multi_v7_defconfig: Switch max77693 to module").

Best regards,
Krzysztof
