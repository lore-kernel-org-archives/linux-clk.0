Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC 06/11] ARM: shmobile: r8a7790: Link CPG to RST using
 "renesas, modemr"
Date: Tue, 07 Jul 2015 19:20:45 +0300
Message-ID: <15446450.YUqyGq9qOl@avalon>
In-Reply-To: <CAMuHMdWCXFbBAPS46d7+3o=FiLLzVacdiTiJq09tCHSCQPUfxw@mail.gmail.com>
References: <1436278217-20522-1-git-send-email-geert+renesas@glider.be>
 <3792169.nKlDE6xfl4@avalon>
 <CAMuHMdWCXFbBAPS46d7+3o=FiLLzVacdiTiJq09tCHSCQPUfxw@mail.gmail.com>
MIME-Version: 1.0
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

Hi Geert,

On Tuesday 07 July 2015 16:58:21 Geert Uytterhoeven wrote:
> On Tue, Jul 7, 2015 at 4:23 PM, Laurent Pinchart wrote:
> > On Tuesday 07 July 2015 16:10:12 Geert Uytterhoeven wrote:
> >> Add a link from the Clock Pulse Generator node to the Reset Controller
> >> node, so the CPG can read the Mode Monitoring Register (MODEMR) to
> >> obtain the MD pin values.x
> >> 
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> 
> >>  arch/arm/boot/dts/r8a7790.dtsi | 1 +
> >>  1 file changed, 1 insertion(+)
> >> 
> >> diff --git a/arch/arm/boot/dts/r8a7790.dtsi
> >> b/arch/arm/boot/dts/r8a7790.dtsi index
> >> 08067ae177643b8f..4ee5523fc3e13e12 100644
> >> --- a/arch/arm/boot/dts/r8a7790.dtsi
> >> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> >> @@ -1115,6 +1115,7 @@
> >>                                            "lb", "qspi", "sdh", "sd0",
> >>                                            "sd1",
> >>                                            "z", "rcan", "adsp";
> >>                       #power-domain-cells = <0>;
> >> +                     renesas,modemr = <&rst 0x60>;
> > 
> > I have mixed feelings about this as I don't think it really describes the
> > hardware.
> 
> From the R-Car Gen2 manual:
> 
> 8. Reset (RST)
> 8.1 Features
> The following functions are implemented by RST.
> [...]
> Latching of the levels on mode pins when PRESET# is negated
> Mode monitoring register
> 
> 7. Clock Pulse Generator (CPG)
> 7.2 Input/Output Pins
> Table 7.1 lists the CPG pin configuration.
> Table 7.1 Pin Configuration and Functions of CPG
> Pin Name Function I/O Description
> [...]
> MD0 Mode 0 ...
> 
> Hence there definitely is a link between the (latched) values in the RST
> module and CPG configuration. This link is expressed using the
> "renesas,modemr" property, where the phandle provides the link to the RST
> block, and the register offset provides a way for software to read the
> configuration.

The mode bits of course influence the CPG (otherwise we wouldn't be having 
this discussion :-)), but to me it looks more like a configuration broadcast 
through the whole SoC than a real link between two IP cores. It's obviously 
subject to interpretation.

> > Wouldn't it make sense to instead add a standard kernel API to retrieve
> > the boot mode value ? It seems to be a pretty common feature of SoCs
> > across all vendors.
> 
> What format would the boot mode value be in? One u32 word, an array
> of u32s?

I'd go for a u32 as that's what all the vendors I came across use. It could 
easily be extended to a u64 or an array of u32/u64 later if needed. The format 
of the boot mode value will be SoC-specific, but that's also true of the mode 
register that would be read through syscon.

-- 
Regards,

Laurent Pinchart


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
