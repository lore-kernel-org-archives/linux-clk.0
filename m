Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,  linux-clk@vger.kernel.org,  linux-usb@vger.kernel.org,  linux-amlogic@lists.infradead.org,  johnyoun@synopsys.com,  kishon@ti.com,  carlo@caione.org,  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,  sboyd@codeaurora.org,  mturquette@baylibre.com,  will.deacon@arm.com,  catalin.marinas@arm.com,  gregkh@linuxfoundation.org,  mark.rutland@arm.com,  robh+dt@kernel.org
Subject: Re: [PATCH v2 5/6] ARM64: meson-gxbb-p20x: Enable USB Nodes
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
	<20160911134111.31141-1-martin.blumenstingl@googlemail.com>
	<20160911134111.31141-6-martin.blumenstingl@googlemail.com>
	<7h37l2mk6a.fsf@baylibre.com>
Date: Thu, 15 Sep 2016 15:09:46 -0700
In-Reply-To: <7h37l2mk6a.fsf@baylibre.com> (Kevin Hilman's message of "Wed, 14
	Sep 2016 11:05:17 -0700")
Message-ID: <7hmvj8ke6t.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Kevin Hilman <khilman@baylibre.com> writes:

> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
>> From: Jerome Brunet <jbrunet@baylibre.com>
>>
>> Enable both gxbb USB controller and add a 5V regulator for the OTG port
>> VBUS
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> nit: subject should have "ARM64: dts:" prefix.
>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi | 29 ++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
>> index ce105fe..4493bce 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
>> @@ -93,6 +93,18 @@
>>  		compatible = "mmc-pwrseq-emmc";
>>  		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
>>  	};
>> +
>> +	usb_vbus: regulator-usb0-vbus {
>
> nit: I like to use the signal name from the schematics for the node name
> (and for regulator-name below).  In the schematics, that signal is named
> USB_PWR.
>
>
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "USB0_VBUS";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +
>> +		gpio = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
>
> Please add a comment above this line with the schematic signal name: USB_PWR_EN.
>

For the record... after a chat with Martin on IRC, I just fixed these up
myself locally, so...

Applied,

Kevin
