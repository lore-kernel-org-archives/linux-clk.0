Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:37728 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751058AbdHBFH5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Aug 2017 01:07:57 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Wed, 02 Aug 2017 13:07:55 +0800
From: icenowy@aosc.io
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: linux-sunxi@googlegroups.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [linux-sunxi] [PATCH 07/13] ARM: sun8i: h3: add display engine
 pipeline barebone
In-Reply-To: <1773537.vAqre0jhCE@jernej-laptop>
References: <20170801131304.7741-1-icenowy@aosc.io>
 <20170801131304.7741-8-icenowy@aosc.io> <1773537.vAqre0jhCE@jernej-laptop>
Message-ID: <fcbff773f61061bbc0f1d6ffef2a7c35@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

在 2017-08-02 12:47，Jernej Škrabec 写道：
> Hi Icenowy,
> 
> Dne torek, 01. avgust 2017 ob 15:12:58 CEST je Icenowy Zheng 
> napisal(a):
>> As we have already the support for the DE2 on Allwinner H3, add the
>> display engine pipeline device tree nodes to its DTSI file.
>> 
>> The H5 pipeline has some differences and will be enabled later.
>> 
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> ---
>>  arch/arm/boot/dts/sun8i-h3.dtsi | 170
>> ++++++++++++++++++++++++++++++++++++++++ 1 file changed, 170 
>> insertions(+)
>> 
>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
>> b/arch/arm/boot/dts/sun8i-h3.dtsi index b36f9f423c39..75ad7b65a7fc 
>> 100644
>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>> @@ -41,6 +41,8 @@
>>   */
>> 
>>  #include "sunxi-h3-h5.dtsi"
>> +#include <dt-bindings/clock/sun8i-de2.h>
>> +#include <dt-bindings/reset/sun8i-de2.h>
>> 
>>  / {
>>  	cpus {
>> @@ -72,6 +74,174 @@
>>  		};
>>  	};
>> 
>> +	de: display-engine {
>> +		compatible = "allwinner,sun8i-h3-display-engine";
>> +		allwinner,pipelines = <&mixer0>,
>> +				      <&mixer1>;
>> +		status = "disabled";
>> +	};
>> +
>> +	soc {
>> +		display_clocks: clock@1000000 {
>> +			compatible = "allwinner,sun8i-a83t-de2-clk";
>> +			reg = <0x01000000 0x100000>;
>> +			clocks = <&ccu CLK_BUS_DE>,
>> +				 <&ccu CLK_DE>;
>> +			clock-names = "bus",
>> +				      "mod";
>> +			resets = <&ccu RST_BUS_DE>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			assigned-clocks = <&ccu CLK_DE>;
>> +			assigned-clock-parents = <&ccu CLK_PLL_DE>;
>> +			assigned-clock-rates = <432000000>;
>> +		};
> 
> I believe Maxime ask you to use clk_set_rate() in the past:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2017-June/512909.html

Yes, but I think the frequency is still part of our configuration, not 
forced
by the hardware.

If we set it in the driver, why don't we set it to 300MHz?

(In fact for pipelines without TVE we can really use 300MHz for CLK_DE, 
and if
we do not want 4K we can even use lower frequency)

> 
> Regards,
> Jernej
