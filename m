Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH V2 4/4] clk: max77686: Add support for MAX77620 clocks
To: Laxman Dewangan <ldewangan@nvidia.com>, javier@osg.samsung.com,
 mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
References: <1466083407-28793-1-git-send-email-ldewangan@nvidia.com>
 <1466083407-28793-5-git-send-email-ldewangan@nvidia.com>
 <576392B1.9040801@samsung.com> <5763905F.4020504@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 Javier Martinez Canillas <javier@dowhile0.org>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <576394CC.7010101@samsung.com>
Date: Fri, 17 Jun 2016 08:12:28 +0200
MIME-version: 1.0
In-reply-to: <5763905F.4020504@nvidia.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/17/2016 07:53 AM, Laxman Dewangan wrote:
> 
> On Friday 17 June 2016 11:33 AM, Krzysztof Kozlowski wrote:
>> On 06/16/2016 03:23 PM, Laxman Dewangan wrote:
>>>   config COMMON_CLK_MAX77686
>>> -    tristate "Clock driver for Maxim 77686/77802 MFD"
>>> -    depends on MFD_MAX77686
>>> +    tristate "Clock driver for Maxim 77686/77802/MAX77620 MFD"
>> You missed Javier's comment here. Just
>> "Maxim 77686/77802/77620"
> 
> Sigh.. did not see this comment when going one by one.. really missed..
> I will collect all Reviewed/ack/tested and will post V3 with fixing this.

No problem.

I think the device names could be in numerical order, so:
Maxim 77620/77686/77802

Best regards,
Krzysztof
