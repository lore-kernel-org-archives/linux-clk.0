Return-Path: <dinguyen@opensource.altera.com>
Message-ID: <55B2F79E.3000101@opensource.altera.com>
Date: Fri, 24 Jul 2015 21:42:38 -0500
From: Dinh Nguyen <dinguyen@opensource.altera.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <mturquette@baylibre.com>, <dinh.linux@gmail.com>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: socfpga: Add a second parent option for the dbg_base_clk
References: <1437591858-12552-1-git-send-email-dinguyen@opensource.altera.com> <20150724214113.GH15042@codeaurora.org>
In-Reply-To: <20150724214113.GH15042@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>



On 7/24/15 4:41 PM, Stephen Boyd wrote:
> On 07/22, dinguyen@opensource.altera.com wrote:
>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
>> index 80f924d..7d5db54 100644
>> --- a/arch/arm/boot/dts/socfpga.dtsi
>> +++ b/arch/arm/boot/dts/socfpga.dtsi
>> @@ -164,7 +164,7 @@
>>  						dbg_base_clk: dbg_base_clk {
>>  							#clock-cells = <0>;
>>  							compatible = "altr,socfpga-perip-clk";
>> -							clocks = <&main_pll>;
>> +							clocks = <&main_pll>, <&osc1>;
>>  							div-reg = <0xe8 0 9>;
>>  							reg = <0x50>;
>>  						};
> 
> We don't usually take changes in dts files. Can you split this
> off and take it through arm-soc?
> 

Ah okay..will do.

Thanks,
Dinh
