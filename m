Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:36576 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755504AbdDRUJ0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2017 16:09:26 -0400
Subject: Re: [PATCH 2/2] ARM: dts: r8a7791: Add GyroADC bindings
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20170416165709.27449-1-marek.vasut+renesas@gmail.com>
 <20170416165709.27449-2-marek.vasut+renesas@gmail.com>
 <CAMuHMdXFUkLypckz2n27or268xiMXCpX+YB3+-beTt92EFA=rQ@mail.gmail.com>
 <85ca1a60-3367-1282-28f4-e94409a391a7@gmail.com>
 <CAMuHMdUoaRSGX7=Jh28d9SRRj3MQ+M4k1Bo1qH1OsWPkqEc3ow@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d9ca7b13-cdc7-32b9-b931-e66ee70d1b66@gmail.com>
Date: Tue, 18 Apr 2017 21:57:08 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUoaRSGX7=Jh28d9SRRj3MQ+M4k1Bo1qH1OsWPkqEc3ow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/18/2017 09:09 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi!

> On Tue, Apr 18, 2017 at 9:05 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 04/18/2017 03:59 PM, Geert Uytterhoeven wrote:
>>> On Sun, Apr 16, 2017 at 6:57 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> --- a/arch/arm/boot/dts/r8a7791.dtsi
>>>> +++ b/arch/arm/boot/dts/r8a7791.dtsi
>>>> @@ -776,6 +776,15 @@
>>>>                 status = "disabled";
>>>>         };
>>>>
>>>> +       adc: adc@e6e54000 {
>>>> +               compatible = "renesas,r8a7791-gyroadc", "renesas,rcar-gyroadc";
>>>> +               reg = <0 0xe6e54000 0 64>;
>>>> +               clocks = <&mstp9_clks R8A7791_CLK_GYROADC>, <&adc_clk>;
>>>> +               clock-names = "fck", "if";
>>>> +               power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
>>>> +               status = "disabled";
>>>> +       };
>>>> +
>>>>         scif2: serial@e6e58000 {
>>>>                 compatible = "renesas,scif-r8a7791", "renesas,rcar-gen2-scif",
>>>>                              "renesas,scif";
>>>> @@ -1133,6 +1142,13 @@
>>>>                         clock-frequency = <0>;
>>>>                 };
>>>>
>>>> +               /* GyroADC clock */
>>>> +               adc_clk: adc_clk {
>>>> +                       compatible = "fixed-clock";
>>>> +                       #clock-cells = <0>;
>>>> +                       clock-frequency = <65000000>;
>>>> +               };
>>>
>>> Why do you have to add a clock?
>>> I think you should just refer to the on-SoC peripheral clock: &cp_clk.
>>
>> I think you are right, in fact, see below ...
>>
>>>> +
>>>>                 /* Special CPG clocks */
>>>>                 cpg_clocks: cpg_clocks@e6150000 {
>>>>                         compatible = "renesas,r8a7791-cpg-clocks",
>>>> @@ -1432,6 +1448,7 @@
>>>>                                  <&hp_clk>, <&hp_clk>;
>>>
>>> Missing addition of the parent clock for the newly added module clock.
>>> Perhaps this should be the peripheral clock (<&cp_clk>)?
>>>
>>> Oops, that means there's no need to have two clock inputs in the adc device
>>> node, and thus we screwed up when reviewing the GyroADC bindings :-(
>>
>> I think you're right. I should be just getting the clk rate of the fck
>> and derive the gyroadc timings from that, correct ? I can send a patch
>> for the driver to just ignore the second clock entry and update the DT
>> binding document to drop the "if" clock (?) .
> 
> Fine for me. Thanks!

OK, patches are ready. I need to find koelsch to test on ..

-- 
Best regards,
Marek Vasut
