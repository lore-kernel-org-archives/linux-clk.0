Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v2 09/10] Documentation: devicetree: Add dts description
 for nuc900
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
References: <1468136542-2656-1-git-send-email-vw@iommu.org>
 <1468136542-2656-2-git-send-email-vw@iommu.org> <1850749.ap1S8Xq0fA@wuerfel>
Cc: Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, jason@lakedaemon.net,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	Thomas Gleixner <tglx@linutronix.de>,
	Wan Zongshun <mcuos.com@gmail.com>
From: Wan Zongshun <vw@iommu.org>
Message-ID: <578300E2.5000405@iommu.org>
Date: Mon, 11 Jul 2016 10:13:54 +0800
MIME-Version: 1.0
In-Reply-To: <1850749.ap1S8Xq0fA@wuerfel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 2016年07月11日 06:17, Arnd Bergmann wrote:
> On Sunday, July 10, 2016 3:42:21 PM CEST Wan Zongshun wrote:
>> +
>> +Required properties:
>> +- compatible : Should be "nuvoton,nuc970-tmr"
>> +- reg : Address and length of the register set
>> +- clocks : Reference on the timer input clock
>> +- interrupts : Reference to the timer interrupt
>> +
>> +Example:
>> +
>> +tmr@0xb8001000 {
>
> The name should be "timer", not "tmr", and the address should
> not contain a leading "0x".

Ok, so all dts addresses has no need contain a leading "0x"?

>
>> +       compatible = "nuvoton,nuc970-tmr";
>> +       reg = <0xb8001000 0x1000>;
>> +       interrupts = <16>;
>> +       clocks = <&clks TIMER0_GATE>,
>> +       <&clks TIMER1_GATE>;
>> +       clock-names = "timer0", "timer1";
>> +};
>
> The clocks/clock-names description does not match the example:
> you only define a single clock in the required properties, but
> have two separate inputs in the example. Please fix one or the
> other.

Two clocks are necessary, so I only need modify this description like?

Required properties:
   clocks : Reference on the timer input clock, This list should be 2
	   clocks, the order is timer0 , timer1.

Is it ok?

>
> 	Arnd
>
>
