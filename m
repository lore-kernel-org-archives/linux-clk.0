Return-Path: <Yixun.Lan@amlogic.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: meson-axg: add clock DT info for Meson
 AXG SoC
To: Stephen Boyd <sboyd@codeaurora.org>
References: <20171128125330.363-1-yixun.lan@amlogic.com>
 <20171128125330.363-4-yixun.lan@amlogic.com>
 <20171129193536.GB19419@codeaurora.org>
CC: <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael
 Turquette <mturquette@baylibre.com>, Carlo Caione <carlo@caione.org>, Qiufang
 Dai <qiufang.dai@amlogic.com>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: Yixun Lan <yixun.lan@amlogic.com>
Message-ID: <8353c264-3253-0268-91fc-8d42fbe82611@amlogic.com>
Date: Thu, 30 Nov 2017 14:01:32 +0800
MIME-Version: 1.0
In-Reply-To: <20171129193536.GB19419@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
Return-Path: yixun.lan@amlogic.com
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen

On 11/30/17 03:35, Stephen Boyd wrote:
> On 11/28, Yixun Lan wrote:
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> index b932a784b02a..36a2e98338a8 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> @@ -7,6 +7,7 @@
>>  #include <dt-bindings/gpio/gpio.h>
>>  #include <dt-bindings/interrupt-controller/irq.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/axg-clkc.h>
>>  
>>  / {
>>  	compatible = "amlogic,meson-axg";
>> @@ -148,6 +149,20 @@
>>  			#address-cells = <0>;
>>  		};
>>  
>> +		hiubus: hiubus@ff63c000 {
> 
> Maybe just call the node "bus@ff63c000"?
> 
isn't this just a name? what's the benefits to change?
personally, I tend to keep it this way, because it's better map to the
data sheet

we also has 'aobus', 'cbus' scattered there..

>> +			compatible = "simple-bus";
>> +			reg = <0x0 0xff63c000 0x0 0x1c00>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1c00>;
>> +
>> +			clkc: clock-controller@0 {
>> +				compatible = "amlogic,axg-clkc";
>> +				#clock-cells = <1>;
>> +				reg = <0x0 0x0 0x0 0x320>;
>> +			};
>> +		};
>> +
>>  		mailbox: mailbox@ff63dc00 {
>>  			compatible = "amlogic,meson-gx-mhu", "amlogic,meson-gxbb-mhu";
>>  			reg = <0 0xff63dc00 0 0x400>;
>> -- 
>> 2.15.0
>>
> 
