Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:65041 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754690AbeEaLZo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 May 2018 07:25:44 -0400
Subject: Re: [PATCH v2 5/6] ARM: dts: Add generic interconnect target module
 node for MCAN
To: Rob Herring <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <bcousson@baylibre.com>,
        <tony@atomide.com>, <paul@pwsan.com>, <t-kristo@ti.com>
References: <20180530141133.3711-1-faiz_abbas@ti.com>
 <20180530141133.3711-6-faiz_abbas@ti.com>
 <20180531040638.GA26751@rob-hp-laptop>
From: Faiz Abbas <faiz_abbas@ti.com>
Message-ID: <be0fd711-c44b-dbe2-648f-08aa88c7aec4@ti.com>
Date: Thu, 31 May 2018 16:56:46 +0530
MIME-Version: 1.0
In-Reply-To: <20180531040638.GA26751@rob-hp-laptop>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Thursday 31 May 2018 09:36 AM, Rob Herring wrote:
> On Wed, May 30, 2018 at 07:41:32PM +0530, Faiz Abbas wrote:
>> The ti-sysc driver provides support for manipulating the idlemodes
>> and interconnect level resets.
>>
>> Add the generic interconnect target module node for MCAN to support
>> the same.
>>
>> CC: Tony Lindgren <tony@atomide.com>
>> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
>> ---
>>  arch/arm/boot/dts/dra76x.dtsi | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/dra76x.dtsi b/arch/arm/boot/dts/dra76x.dtsi
>> index bfc82636999c..57b8dc0fe719 100644
>> --- a/arch/arm/boot/dts/dra76x.dtsi
>> +++ b/arch/arm/boot/dts/dra76x.dtsi
>> @@ -11,6 +11,25 @@
>>  / {
>>  	compatible = "ti,dra762", "ti,dra7";
>>  
>> +	ocp {
>> +
>> +		target-module@0x42c00000 {
> 
> Build your dtb with W=1 and fix warnings you add (drop '0x').

Sure, Will fix this.
> 
> This is a CAN bus controller? If so, then use 'can' for node name.

Yes but I am using m_can along the lines of dcan in other boards (For
example, see arch/arm/boot/dts/am33xx.dtsi:1046). Are you saying all CAN
controllers should only be called can?

Thanks,
Faiz
