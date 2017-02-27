Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Subject: Re: [PATCH v5 5/7] arm: dts: sun8i: split Allwinner H3 .dtsi
To: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.xyz>
References: <20170226011956.53581-1-icenowy@aosc.xyz>
 <20170226011956.53581-6-icenowy@aosc.xyz>
 <CAGb2v67qywz9EdTzguAOEtWYqqrOZ-jSMTgkRza3dysUsCN6rw@mail.gmail.com>
From: Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <579a2e9f-335f-04b7-fce2-ee4d2128141f@arm.com>
Date: Mon, 27 Feb 2017 08:20:40 +0000
MIME-Version: 1.0
In-Reply-To: <CAGb2v67qywz9EdTzguAOEtWYqqrOZ-jSMTgkRza3dysUsCN6rw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 26/02/17 03:46, Chen-Yu Tsai wrote:
> Hi,

[...]

>> -               gic: interrupt-controller@01c81000 {
>> -                       compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
>> -                       reg = <0x01c81000 0x1000>,
>> -                             <0x01c82000 0x2000>,
>> -                             <0x01c84000 0x2000>,
>> -                             <0x01c86000 0x2000>;
>> -                       interrupt-controller;
>> -                       #interrupt-cells = <3>;
>> -                       interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> 
> The gic bits seem to be the same for both SoCs, aside from the
> different compatible
> string. Marc had sent a series to change them all to arm,gic-400, which is the
> proper name for it, but it wasn't merged. I'm assuming the compatibles
> are equal?
> If so then it can also be shared.

The series was fixing the various GICv2 memory maps, and is now in
mainline. If you have a good indication that all these SoCs are indeed
featuring a gic-400, feel free to amend the DT.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
