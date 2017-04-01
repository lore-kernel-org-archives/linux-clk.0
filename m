Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:47289 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750726AbdDAEPn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Apr 2017 00:15:43 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 31 Mar 2017 21:15:29 -0700
From: Stefan Agner <stefan@agner.ch>
To: Dong Aisheng <dongas86@gmail.com>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, sboyd@codeaurora.org,
        aisheng.dong@nxp.com, fabio.estevam@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add USDHC NAND clock to SDHC
 instances
In-Reply-To: <20170401030312.GB24882@b29396-OptiPlex-7040>
References: <20170330005029.6472-1-stefan@agner.ch>
 <20170330005029.6472-2-stefan@agner.ch>
 <20170401030312.GB24882@b29396-OptiPlex-7040>
Message-ID: <5c8339900fa1bd6215fb94d4386f7e06@agner.ch>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2017-03-31 20:03, Dong Aisheng wrote:
> On Wed, Mar 29, 2017 at 05:50:29PM -0700, Stefan Agner wrote:
>> The USDHC instances need the USDHC NAND clock in order to operate.
>> Add the clock as ahb bus clock.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  arch/arm/boot/dts/imx7s.dtsi | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
>> index 5d3a43b8de20..5794febb19a4 100644
>> --- a/arch/arm/boot/dts/imx7s.dtsi
>> +++ b/arch/arm/boot/dts/imx7s.dtsi
>> @@ -936,7 +936,7 @@
>>  				reg = <0x30b40000 0x10000>;
>>  				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
>>  				clocks = <&clks IMX7D_CLK_DUMMY>,
> 
> Would you please change the left ipg dummy to IMX7D_IPG_ROOT_CLK as well?

IMX7D_IPG_ROOT_CLK is currently not a valid clock in upstream... So we
would have to add it to the clock driver first.

I guess we could/should add it anyway at one point? But probably also as
init on, just to make sure Linux does not disable it since it is
currently used by several IPs implicitly.

--
Stefan

> 
> Otherwise,
> 
> Acked-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> Regards
> Dong Aisheng
> 
>> -					<&clks IMX7D_CLK_DUMMY>,
>> +					<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>,
>>  					<&clks IMX7D_USDHC1_ROOT_CLK>;
>>  				clock-names = "ipg", "ahb", "per";
>>  				bus-width = <4>;
>> @@ -948,7 +948,7 @@
>>  				reg = <0x30b50000 0x10000>;
>>  				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>>  				clocks = <&clks IMX7D_CLK_DUMMY>,
>> -					<&clks IMX7D_CLK_DUMMY>,
>> +					<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>,
>>  					<&clks IMX7D_USDHC2_ROOT_CLK>;
>>  				clock-names = "ipg", "ahb", "per";
>>  				bus-width = <4>;
>> @@ -960,7 +960,7 @@
>>  				reg = <0x30b60000 0x10000>;
>>  				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>>  				clocks = <&clks IMX7D_CLK_DUMMY>,
>> -					<&clks IMX7D_CLK_DUMMY>,
>> +					<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>,
>>  					<&clks IMX7D_USDHC3_ROOT_CLK>;
>>  				clock-names = "ipg", "ahb", "per";
>>  				bus-width = <4>;
>> --
>> 2.12.1
>>
