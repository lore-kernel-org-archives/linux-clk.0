Return-Path: <linux-omap-owner@vger.kernel.org>
Message-ID: <558C0624.4060008@ti.com>
Date: Thu, 25 Jun 2015 19:16:12 +0530
From: Keerthy <a0393675@ti.com>
MIME-Version: 1.0
To: Mugunthan V N <mugunthanvnm@ti.com>, Keerthy <j-keerthy@ti.com>,
	<linux-omap@vger.kernel.org>
CC: <galak@codeaurora.org>, <tony@atomide.com>, <t-kristo@ti.com>,
	<pawel.moll@arm.com>, <linux-kernel@vger.kernel.org>,
	<bcousson@baylibre.com>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 0/2] CLK: TI: add dpll_clksel_mac_clk node
References: <1434614473-8500-1-git-send-email-j-keerthy@ti.com> <55828A18.6030608@ti.com>
In-Reply-To: <55828A18.6030608@ti.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Sender: linux-omap-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On Thursday 18 June 2015 02:36 PM, Mugunthan V N wrote:
> On Thursday 18 June 2015 01:31 PM, Keerthy wrote:
>> The series adds the missing clock node needed for cpsw.
>>
>> Keerthy (2):
>>    CLK: TI: add dpll_clksel_mac_clk node
>>    ARM: dts: am4372: Set the default clock rate for dpll_clksel_mac_clk
>>      clock
>>
>>   arch/arm/boot/dts/am4372.dtsi        | 7 +++++--
>>   arch/arm/boot/dts/am43xx-clocks.dtsi | 9 +++++++++
>>   drivers/clk/ti/clk-43xx.c            | 1 +
>>   3 files changed, 15 insertions(+), 2 deletions(-)
>>
>
> Tested-by: Mugunthan V N <mugunthanvnm@ti.com>

Thanks Mugunthan.

A gentle ping on this series.

Regards,
Keerthy
>
> Regards
> Mugunthan V N
>
