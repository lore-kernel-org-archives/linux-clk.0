Return-Path: <caesar.upstream@gmail.com>
Return-Path: <caesar.upstream@gmail.com>
Subject: Re: [PATCH v2 04/12] clk: rockchip: rk3036: enable the
 CLK_IGNORE_UNUSED flag for sclk_i2s_out
To: Heiko Stuebner <heiko@sntech.de>
References: <1452155155-16232-1-git-send-email-wxt@rock-chips.com>
 <290434099.8XFZ9qmNRz@phil> <568F80BA.6060209@gmail.com>
 <20757797.djuaztrzGE@phil>
Cc: Caesar Wang <caesar.upstream@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, leecam@google.com, leozwang@google.com,
 keescook@google.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>
From: Caesar Wang <caesar.upstream@gmail.com>
Message-ID: <56960686.7030903@gmail.com>
Date: Wed, 13 Jan 2016 16:10:46 +0800
MIME-Version: 1.0
In-Reply-To: <20757797.djuaztrzGE@phil>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Heiko,

在 2016年01月08日 17:46, Heiko Stuebner 写道:
> Hi Caesar,
>
> Am Freitag, 8. Januar 2016, 17:26:18 schrieb Caesar Wang:
>> 在 2016年01月07日 18:05, Heiko Stuebner 写道:
>>> Am Donnerstag, 7. Januar 2016, 16:25:47 schrieb Caesar Wang:
>>>> SCLk_I2S_OUT is the noc bus clock for i2s module, this clock is used by
>>>> extra codecs.
>>>>
>>>> Due to it shouldn't belong to any driver, but we need it enabled,
>>>> so just mark it as the CLK_IGNORE_UNUSED flag.
>>> What makes you think it shouldn't belong to any driver?
>>>
>>> In most schematics I have, i2s_clkout is going to some clock-input of
>>> the
>>> audio codec - probably the MCLK input on your rt5616. And while the new
>>> rt5616 driver does not seem to do clock handling, it should just handle
>>> the clock using the normal APIs.
>> You are right,  that's seem has to find the root cause.
>> I'm wonder that the codec/i2s is working in kernel v4.1 patch without it.
>>
>> In general,  the MLCK will be handled in i2s driver if the cpu side is
>> master.
> looking at the rt5616 datasheet, that would be BCLK1 instead I think. This
> one does differentiate between being master/slave.
>
> The master/sysclk (mclk) is also handled in other drivers in all cases.
> (da7213.c, da7219.c, max98090.c, max98095.c, probably more)

Saw the patch:
https://patchwork.kernel.org/patch/5427131/

Add the follow that's working.

--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -288,8 +288,8 @@
                 interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
                 #address-cells = <1>;
                 #size-cells = <0>;
-               clock-names = "i2s_clk", "i2s_hclk";
-               clocks = <&cru SCLK_I2S>, <&cru HCLK_I2S>;
+               clock-names = "i2s_clk", "i2s_hclk", "i2s_clk_out";
+               clocks = <&cru SCLK_I2S>, <&cru HCLK_I2S>, <&cru 
SCLK_I2S_OUT>;

Okay, I believe Mark likes that works in codec driver.

>
>
> Heiko
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


-- 
Thanks,
Caesar
