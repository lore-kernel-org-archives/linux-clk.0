Return-Path: <gregory.clement@free-electrons.com>
Message-ID: <5550AC1E.6040901@free-electrons.com>
Date: Mon, 11 May 2015 15:18:22 +0200
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
MIME-Version: 1.0
To: Michael Turquette <mturquette@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
CC: Stephen Boyd <sboyd@codeaurora.org>,
 Jean-Francois Moine <moinejf@free.fr>,
 Michael Welling <mwelling@ieee.org>,
 Russell King <rmk+linux@arm.linux.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ARM: dove: Add clock-names to CuBox Si5351 clk
 generator
References: <1430773456-15203-1-git-send-email-sebastian.hesselbarth@gmail.com> <1430773456-15203-3-git-send-email-sebastian.hesselbarth@gmail.com> <554A13AE.6000904@free-electrons.com> <20150508190050.16410.52142@quantum>
In-Reply-To: <20150508190050.16410.52142@quantum>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Sebastian,

On 08/05/2015 21:00, Michael Turquette wrote:
> Quoting Gregory CLEMENT (2015-05-06 06:14:22)
>> Hi Sebastian,
>>
>> On 04/05/2015 23:04, Sebastian Hesselbarth wrote:
>>> Si5351 clock generator on CuBox uses XTAL as clock reference, name the
>>> clock phandle accordingly.
>>
>> as soon as the binding will be accepted (in patch 1), I will apply it
>> on mvebu/fixes.
> 

applied on mvebu/fixes

Thanks,

Gregory


> It is on the clk git mirror now. Should be picked up in -next soon.
> 
> Regards,
> Mike
> 
>>
>> Thanks,
>>
>> Gregory
>>
>>
>>>
>>> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>>> ---
>>> Cc: Mike Turquette <mturquette@linaro.org>
>>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>>> Cc: Jean-Francois Moine <moinejf@free.fr>
>>> Cc: Michael Welling <mwelling@ieee.org>
>>> Cc: Russell King <rmk+linux@arm.linux.org.uk>
>>> Cc: Jason Cooper <jason@lakedaemon.net>
>>> Cc: Andrew Lunn <andrew@lunn.ch>
>>> Cc: Gregory Clement <gregory.clement@free-electrons.com>
>>> Cc: linux-clk@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>  arch/arm/boot/dts/dove-cubox.dts | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm/boot/dts/dove-cubox.dts b/arch/arm/boot/dts/dove-cubox.dts
>>> index aae7efc09b0b..e6fa251e17b9 100644
>>> --- a/arch/arm/boot/dts/dove-cubox.dts
>>> +++ b/arch/arm/boot/dts/dove-cubox.dts
>>> @@ -87,6 +87,7 @@
>>>  
>>>               /* connect xtal input to 25MHz reference */
>>>               clocks = <&ref25>;
>>> +             clock-names = "xtal";
>>>  
>>>               /* connect xtal input as source of pll0 and pll1 */
>>>               silabs,pll-source = <0 0>, <1 0>;
>>>
>>
>>
>> -- 
>> Gregory Clement, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
