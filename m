Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 19 Mar 2018 09:28:23 +0800
In-Reply-To: <20180318201744.dw6hnm2vdybaunev@flea>
References: <20180316140215.28663-1-icenowy@aosc.io> <20180318201744.dw6hnm2vdybaunev@flea>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [PATCH v4 0/9] Initial Allwinner H6 support
To: linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
CC: devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <F40271A8-3782-4A69-8C40-3909EB296C66@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2018年3月19日 GMT+08:00 上午4:17:44, Maxime Ripard <maxime.ripard@bootlin.com> 写到:
>On Fri, Mar 16, 2018 at 10:02:06PM +0800, Icenowy Zheng wrote:
>> This patchset adds initial support for the Allwinner H6 SoC.
>> 
>> It's quite different from earlier Allwinner SoCs. For example, the
>> memory map is refactored, and the CCU is rearranged. It's also the
>first
>> Allwinner SoC with PCI Express interface (although the implementation
>> of the PCI Express controller is broken), and the second one with USB
>> 3.0 (the first one is A80).
>> 
>> This patchset adds the most basical support for it, including the
>main pin
>> controller, the main CCU and the basical device tree.
>> 
>> Icenowy Zheng (9):
>>   pinctrl: sunxi: refactor irq related register function to have desc
>>   pinctrl: sunxi: introduce IRQ bank conversion function
>>   pinctrl: sunxi: change irq_bank_base to irq_bank_map
>>   pinctrl: sunxi: add support for the Allwinner H6 main pin
>controller
>>   clk: sunxi-ng: Support fixed post-dividers on NKMP style clocks
>>   dt-bindings: add device tree binding for Allwinner H6 main CCU
>>   clk: sunxi-ng: add support for the Allwinner H6 CCU
>>   arm64: allwinner: h6: add the basical Allwinner H6 DTSI file
>>   arm64: allwinner: h6: add support for Pine H64 board
>
>Applied the !pinctrl patches.

Oops, one clock (CLK_HDMI_SLOW) is missing in the CCU
driver, as Jernej pointed out.

Should I send a patch that fix it?

>
>Thanks!
>Maxime
