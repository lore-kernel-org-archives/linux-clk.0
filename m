Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <15446450.YUqyGq9qOl@avalon>
References: <1436278217-20522-1-git-send-email-geert+renesas@glider.be>
 <3792169.nKlDE6xfl4@avalon>
 <CAMuHMdWCXFbBAPS46d7+3o=FiLLzVacdiTiJq09tCHSCQPUfxw@mail.gmail.com>
 <15446450.YUqyGq9qOl@avalon>
Date: Wed, 8 Jul 2015 10:29:56 +0200
Message-ID: <CAMuHMdUpMFLqA+jRwq=tA1niRkm=L5cMyZ5mxSj18BQnc8CpJw@mail.gmail.com>
Subject: Re: [PATCH/RFC 06/11] ARM: shmobile: r8a7790: Link CPG to RST using
 "renesas, modemr"
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux-sh list <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>,
 Ulrich Hecht <ulrich.hecht@gmail.com>, linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Hi Laurent,

On Tue, Jul 7, 2015 at 6:20 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> >> --- a/arch/arm/boot/dts/r8a7790.dtsi
>> >> +++ b/arch/arm/boot/dts/r8a7790.dtsi
>> >> @@ -1115,6 +1115,7 @@
>> >>                                            "lb", "qspi", "sdh", "sd0",
>> >>                                            "sd1",
>> >>                                            "z", "rcan", "adsp";
>> >>                       #power-domain-cells = <0>;
>> >> +                     renesas,modemr = <&rst 0x60>;
>> >
>> > I have mixed feelings about this as I don't think it really describes the
>> > hardware.
>>
>> From the R-Car Gen2 manual:
>>
>> 8. Reset (RST)
>> 8.1 Features
>> The following functions are implemented by RST.
>> [...]
>> Latching of the levels on mode pins when PRESET# is negated
>> Mode monitoring register
>>
>> 7. Clock Pulse Generator (CPG)
>> 7.2 Input/Output Pins
>> Table 7.1 lists the CPG pin configuration.
>> Table 7.1 Pin Configuration and Functions of CPG
>> Pin Name Function I/O Description
>> [...]
>> MD0 Mode 0 ...
>>
>> Hence there definitely is a link between the (latched) values in the RST
>> module and CPG configuration. This link is expressed using the
>> "renesas,modemr" property, where the phandle provides the link to the RST
>> block, and the register offset provides a way for software to read the
>> configuration.
>
> The mode bits of course influence the CPG (otherwise we wouldn't be having
> this discussion :-)), but to me it looks more like a configuration broadcast
> through the whole SoC than a real link between two IP cores. It's obviously
> subject to interpretation.

Yep.

Broadcast? Like a bus clock? For that we also have properties with phandles...

Syscon is the Hot New Abstraction for a module that provides a bunch of
registers needed by drivers for other modules. Those other modules need
some way to refer to the appropriate syscon register.

The RST module definitely falls in that category: CPG needs the MODEMR
register, watchdog (RWDT/SWDT) needs the Watchdog Timer Reset Control Register,
and APMU probably needs the CA15/7 reset control registers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
