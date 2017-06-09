Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  narmstrong@baylibre.com,  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,  mturquette@baylibre.com,  sboyd@codeaurora.org,  robh+dt@kernel.org,  mark.rutland@arm.com,  carlo@caione.org,  linux@armlinux.org.uk,  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] clk: meson: meson8b: add compatibles for Meson8 and Meson8m2
References: <20170604183341.21417-1-martin.blumenstingl@googlemail.com>
	<20170604183341.21417-2-martin.blumenstingl@googlemail.com>
	<1496606325.3552.16.camel@baylibre.com>
Date: Fri, 09 Jun 2017 11:13:17 -0700
In-Reply-To: <1496606325.3552.16.camel@baylibre.com> (Jerome Brunet's message
	of "Sun, 04 Jun 2017 21:58:45 +0200")
Message-ID: <m2lgp19ghu.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Sun, 2017-06-04 at 20:33 +0200, Martin Blumenstingl wrote:
>> The clock controller on Meson8, Meson8b and Meson8m2 is very similar
>> based on the code from the Amlogic GPL kernel sources. Add separate
>> compatibles for each SoC to make sure that we can easily implement
>> all the small differences for each SoC later on.
>>=20
>> In general the Meson8 and Meson8m2 seem to be almost identical as they
>> even share the same mach-meson8 directory in Amlogic's GPL kernel
>> sources.
>> The main clocks on Meson8, Meson8b and Meson8m2 are very similar,
>> because they are all using the same PLL values, 90% of the clock gates
>> are the same (the actual diffstat of the mach-meson8/clock.c and
>> mach-meson8b/clock.c files is around 30 to 40 lines, when excluding
>> all commented out code).
>> The difference between the Meson8 and Meson8b clock gates seem to be:
>> - Meson8 has AIU_PCLK, HDMI_RX, VCLK2_ENCT, VCLK2_ENCL, UART3,
>> =C2=A0 CSI_DIG_CLKIN gates which don't seem to be available on Meson8b
>> - the gate on Meson8 for bit 7 seems to be named "_1200XXX" instead
>> =C2=A0 of "PERIPHS_TOP" (on Meson8b)
>> - Meson8b has a SANA gate which doesn't seem to exist on Meson8 (or
>> =C2=A0 on Meson8 the same bit is used by the UART3 gate in Amlogic's GPL
>> =C2=A0 kernel sources)
>> None of these gates is added for now, since it's unclear whether these
>> definitions are actually correct (the VCLK2_ENCT gate for example is
>> defined, but only used in some commented block).
>>=20
>> The main difference between all three SoCs seem to be the video (VPU)
>> clocks. Apart from different supported clock rates (according to vpu.c
>> in mach-meson8 and mach-meson8b from Amlogic's GPL kernel sources) the
>> most notable difference is that Meson8m2 has a GP_PLL clock and a mux
>> (probably the same as on the Meson GX SoCs) to support glitch-free
>> (clock rate) switching.
>> None of these VPU clocks are not supported by our mainline meson8b
>> clock driver yet though.
>>=20
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>> =C2=A0.../devicetree/bindings/clock/amlogic,meson8b-clkc.txt=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 11 +++++++---
>
> I think you should split the binding documentation and clk changes into s=
eparate
> patches.
>
>> -
>> =C2=A0drivers/clk/meson/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A06 +++---
>> =C2=A0drivers/clk/meson/meson8b.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A05 ++++-
>
> The change being more platform than clock related, I'd prefer if Kevin or=
 Carlo
> ack it before we apply it.

Acked-by: Kevin Hilman <khilman@baylibre.com>
