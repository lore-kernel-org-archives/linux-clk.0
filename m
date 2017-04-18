Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36357 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755988AbdDRTFu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2017 15:05:50 -0400
Subject: Re: [PATCH 2/2] ARM: dts: r8a7791: Add GyroADC bindings
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org
References: <20170416165709.27449-1-marek.vasut+renesas@gmail.com>
 <20170416165709.27449-2-marek.vasut+renesas@gmail.com>
 <776957e7-0500-3fc2-f6bc-1b2ba0e6594c@cogentembedded.com>
Cc: linux-clk@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <baf4dc51-3fa0-cca5-d742-56603d8cc052@gmail.com>
Date: Tue, 18 Apr 2017 20:44:34 +0200
MIME-Version: 1.0
In-Reply-To: <776957e7-0500-3fc2-f6bc-1b2ba0e6594c@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/17/2017 11:19 AM, Sergei Shtylyov wrote:
> Hello!

Hi!

> On 4/16/2017 7:57 PM, Marek Vasut wrote:
> 
>> Add bindings for the GyroADC block and it's associated clock.
> 
>    Well, I already spoke to you about the bindings on IRC...

That's fixed.

>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>  arch/arm/boot/dts/r8a7791.dtsi | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/r8a7791.dtsi
>> b/arch/arm/boot/dts/r8a7791.dtsi
>> index 4d0c2ce59900..1b099dbc9eef 100644
>> --- a/arch/arm/boot/dts/r8a7791.dtsi
>> +++ b/arch/arm/boot/dts/r8a7791.dtsi
>> @@ -776,6 +776,15 @@
>>          status = "disabled";
>>      };
>>
>> +    adc: adc@e6e54000 {
> 
>    Why not label it "gyroadc:"?

We can ... I don't mind either way. Shall we ?

>> +        compatible = "renesas,r8a7791-gyroadc", "renesas,rcar-gyroadc";
>> +        reg = <0 0xe6e54000 0 64>;
> 
>    s/64/0x40/.

The surrounding code uses 64, so I kept it consistent.

> [...]
>> @@ -1133,6 +1142,13 @@
>>              clock-frequency = <0>;
>>          };
>>
>> +        /* GyroADC clock */
>> +        adc_clk: adc_clk {
> 
>    We geberally skip the "_clk" suffix in the clock node names, so that
> the clock name generated from the node name doesn't have this suffix.

Fixed

> [...]
> 
> MBR, Sergei
> 


-- 
Best regards,
Marek Vasut
