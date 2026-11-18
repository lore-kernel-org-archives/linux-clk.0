Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014957;
	b=Sur8URpJt6k3X8k2NktoN9mkCgaMDQbER7JboA5vYNEiC6l4DEDxEDp1a/VDg3wLtnn7
	 8lDTM3tYPwfPJshmXvq/20Da0VkdhnME5d8n3zrqyr6YeHYkMm6ONEmOCCCsglYb7iPyU
	 WArANriHpT8me18AmDoK/HnLK37l2O2DWWN3fJ4ItHKX2OSfSUEAezDJxhFPUJG87xfP2
	 K73lSgDSzfG/pWIJ8H7sAL7nWZAJq7A/Cw7ea4X2eZZnWf5I/gICCNEEQlauoA/L0cjW9
	 638x42KQGjC0ULo9UvejP7i1JNc126iA16rm/BRKlSThN3Gqpzipw0TPUrUtAz10CSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014957;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iom0u3S5srgZxMd5fGMlRcfbzcBMCeh6+MQIM8fT0s0=;
	b=ef+CbHsHq+lD3BSROqUTtvnaVA1X1B9yWEPoek1d4wbsVbjE47PdxSzjVpGw9SVshYbe
	 MRxEP5dXRKslYaD/IJwIoDoIoi3kNquSt/9McuEGtAAncaDzcYrvnHjJ5nbYgbTVGmfJI
	 4eQBLFPYtBorpdLtK7KQF+0xGv1Gmys0eA6kaWylzbHSLqV/TuzwOG5FTTR/hXiyZFO2r
	 FkNElYMQDcTpovMUFET9KchWt4lgqmfDNavZvO6Vh/XcLC5oPSA3k/xdRamVdQjztbcIk
	 UUR1iQJ4VoImnyygpt3D9BG3owUA9OnFtsr18ciPvVgRYeJ444AfYrezWIr5ICjW0Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFGvrbE5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A92606A325
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFGvrbE5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951521F000D1
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795014956;
	bh=iom0u3S5srgZxMd5fGMlRcfbzcBMCeh6+MQIM8fT0s0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=KFGvrbE5zzoFlhSAxcalNFZLVXxGZLks3il/HIaBrVcZdITr0tuR9pSRgXpLn/UY0
	 MM/QxqnbnrUPu4mmD3y+gUt+DSxaxjdBb2OLnG7H7FC1wPfHJ7JQI2qf03IjQwvr4p
	 4m++1udlAKFSpoVUSBEBa0pdHWVOrJW2GzdOUe36L9Sk1Gu0IRPQBnF/+yb7lGINsQ
	 J6vqGUWKy8jJkol+UOK7r6mexwx72ll7hqrev+pvPgF0jea+w1wkGV6J6qDIy5kl7Q
	 ySTXTL32Fe4QpFzP/A4tD033hA7MAAMLUYC8mdM2FnSIcUPlERTeOXjjJRMFWHW/Nn
	 thViwsxVBV7AQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be416e603cso819883e87.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:15:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFszZV4NTNFvD7KhfNufxBgR0MFY+m2V0LyQteqa1L9j5kmo/YbIe7Q7tMNDTuQ/ceTjxkmO5tQzno=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wx5/UeNX5JB8pFEuf3sCQj3JTK7Q5OpFgZRuzFLAzxL0+uKg9
	BrIxPl6oJRQLcOzIL8mLZ97zY8/VRKehUMVgDJDYt6UiLeMdyPUuFPaffr+Uqwx9gUnkI/pGQAl
	hrQ9mWbU3TvWIKmk5cU3URhXrVuj480U=
X-Received: by 2002:a05:6512:2206:b0:5c1:4dba:f748 with SMTP id
 2adb3069b0e04-5c1aa04bfb1mr1142250e87.10.1795014954886; Wed, 18 Nov 2026
 07:15:54 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-a733-fwclk-v2@gmail.com> <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com>
 <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com> <124bb855-f2f6-4b10-b0be-99fb53cc2ee8@arm.com>
In-Reply-To: <124bb855-f2f6-4b10-b0be-99fb53cc2ee8@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Nov 2026 23:15:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v65A4rAFTFYyB_sZBC9O7fb0TJWE1YRjdGrLeNgwyVzcSw@mail.gmail.com>
X-Gm-Features: AclHuK_h8I6R1NB2_rRQH2fTPyAFCMaG4sd-3_UUxudP7Hows23f9WUVAAbR40Q
Message-ID: <CAGb2v65A4rAFTFYyB_sZBC9O7fb0TJWE1YRjdGrLeNgwyVzcSw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
To: Andre Przywara <andre.przywara@arm.com>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, jernej.skrabec@gmail.com, samuel@sholland.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 10:51=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi,
>
> On 11/18/26 14:41, Chen-Yu Tsai wrote:
> > On Wed, Nov 18, 2026 at 1:18=E2=80=AFAM Andre Przywara <andre.przywara@=
arm.com> wrote:
> >>
> >> Hi,
> >>
> >> the patch itself looks fine, but the comments and the commit message a=
re
> >> not entirely correct, I think.
> >>
> >> On 11/12/26 22:38, Enzo Adriano wrote:
> >>> The A733 PRCM's bus-r-riscv and bus-r-msgbox gates have no Linux
> >>> consumers, so unused-clock cleanup gates them. With vendor SCP firmwa=
re
> >>> running on the E902 as shipped on Cubie A7S, warm reboot then stalls.
> >>
> >> Please note that we don't support "vendor firmware" with mainline Linu=
x.
> >> That was mostly incompatible in the past, and while it might work thes=
e
> >> days, this is not something we control and want to endorse.
> >> So we would be quite reluctant (to put it mildly) about merging patche=
s
> >> that are solely needed for BSP firmware bits.
> >>
> >>> Keep both critical until remoteproc/mailbox drivers can claim them.
> >>
> >> I don't think this "until" is an argument. Even if we'd have Linux
> >> driver support, they would be optional to use (not compiled, not
> >> loaded), and would only be needed to *communicate* with the firmware.
> >>
> >> But those clocks are actually there to drive the RISC-V core clock, an=
d
> >> also the "RISC-V side" of the peripherals, due to a lack of separate
> >> clock controls in the SoC in the Allwinner design. So the kernel shoul=
d
> >> not care about or touch those clocks at all - which is what
> >> CLK_IS_CRITICAL does.
> >
> > No. CLK_IS_CRITICAL also tells the kernel to turn it on, and you then
> > can never turn it off. You get a big warning if you try to defeat the
> > refcounting, but nothing else happens.
>
> Good point, so is CLK_IGNORE_UNUSED a better flag? As far as I can see,
> it only prevents turning it off if unclaimed, it doesn't turn it on if
> it was off initially, and it doesn't disallow turning it off.

Yes. It's like an uncoordinated simplefb? :p

> > So what if the *real* remoteproc driver needs to turn the clock off to
> > pause the RISC-V core? It can't
>
> I guess this depends on the use case, which isn't very well defined. If
> this E902 is really a remoteproc device entirely controlled by Linux,
> then sure: Linux should have full control over its clock.
> But if it's running some kind of firmware component, then the kernel
> shouldn't mess with it, IMHO. But I think there is still the arisc on
> the A733, so this would more likely run the management processor (SCP) co=
de?

Even if it had firmware already running, if it provides some interface to
the OS (other than PSCI / SCMI), then you'd probably still have a remotepro=
c
driver claiming and somewhat controlling it, plus rpmsg or something else
to bridge the firmware interface.

OTOH, AFAIK some SCP, such as crust, are pretty much transparent to the OS,
i.e. the OS doesn't know about it. The RISC-V core is probably useful beyon=
d
just being the SCP. You could offload control of various hardware blocks to
it if you wanted, or you could have it be an always on sensor hub. Either w=
ay
the OS would have some control over it and some defined interface to it.


ChenYu

> Cheers,
> Andre
>
> > So, not a fan of this. If the loaded firmware somehow needs some resour=
ces
> > then perhaps the software that loaded it needs to somehow tell the kern=
el
> > they are needed, like the bootloader patching the DT passed to the kern=
el.
> >
> > If the firmware needs a piece of DRAM, you don't say in the kernel that
> > this piece of DRAM is off-limits. You let the bootloader tell the kerne=
l.
> > Static DRAM carve outs with reserved-memory nodes in the DT source is a=
lso
> > ugly, as you could end up with mismatches if the firmware somehow chang=
ed.
> >
> > IMO CLK_IS_CRITICAL should be used for things that the kernel knows it =
needs
> > but there's nothing to claim it.
> >
> >
> > ChenYu
> >
> >>> This follows A523 bus-r-cpucfg in commit 1dba74abf3e2 ("clk: sunxi-ng=
:
> >>> Mark A523 bus-r-cpucfg clock as critical") and the temporary SCPI fir=
mware
> >>> clock protection for Meson AXG fclk_div3 in drivers/clk/meson/axg.c.
> >>>
> >>> On Cubie A7S with vendor boot0/BL31/SCP/U-Boot and without
> >>> clk_ignore_unused, warm reboot returns with both clocks critical and
> >>> stalls without them. Vinicius found either flag alone insufficient on
> >>> Cubie A7Z. Power-off, suspend, single flags on A7S, other
> >>> boards/firmware and upstream TF-A were not tested.
> >>>
> >>> Link: https://lore.kernel.org/r/20261005183038.417798-1-vinicius.edua=
rdo.pedrosa@gmail.com
> >>> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> >>> ---
> >>> Changes in v2:
> >>> - Drop r-timer0, bus-r-timer and bus-msgbox0: A7S warm reboot works w=
ith
> >>>     these at 0/0. Keep only the two E902/mailbox bus gates after Junh=
ui's
> >>>     review, pending remoteproc/mailbox ownership.
> >>> - Rebase on CCU v7; its PRCM clock definitions are unchanged from v6.
> >>>
> >>> v1:
> >>> https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
> >>>
> >>> Base: v7.4-rc1. Depends on CCU v7 (all eight patches):
> >>> https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmora=
l.tech
> >>>
> >>> November 12 board test: two RAM boots and warm reboot -f returns on
> >>> Cubie A7S with vendor boot0/BL31/SCP/U-Boot, without clk_ignore_unuse=
d.
> >>> Both retained clocks were 1/1; all three dropped clocks were 0/0.
> >>> The no-flag stall was observed with CCU v6 on Nov 10; PRCM code is
> >>> byte-identical in v7, where the no-flag control was not repeated.
> >>> Runtime used DT v3 and its dependencies (all four UART v2 patches),
> >>> with the PMIC identifier and pinctrl IRQ-map context adapted to the b=
ase:
> >>> https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmai=
l.com
> >>
> >> I don't think there is any need for those longish test descriptions,
> >> especially if they pass.
> >>
> >>>
> >>>    drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 7 +++++--
> >>>    1 file changed, 5 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/s=
unxi-ng/ccu-sun60i-a733-r.c
> >>> index b8f6e8c6e507..f2965daba0d3 100644
> >>> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> >>> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> >>> @@ -108,7 +108,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-s=
pi", r_spi_parents, 0x150,
> >>>                                  0);
> >>>    static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.co=
mmon.hw, 0x15c, BIT(0), 0);
> >>>
> >>> -static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_cl=
k.common.hw, 0x17c, BIT(0), 0);
> >>> +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox=
 driver claims it. */
> >>
> >> Please change this comment. Something like the msgbox clock is shared
> >> between the E902 core and the Arm APs.
> >>
> >>> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_cl=
k.common.hw,
> >>> +                      0x17c, BIT(0), CLK_IS_CRITICAL);
> >>>
> >>>    static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_c=
lk.common.hw, 0x18c, BIT(0), 0);
> >>>    static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_c=
lk.common.hw, 0x18c, BIT(1), 0);
> >>> @@ -146,8 +148,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, =
"r-riscv", r_riscv_parents, 0x2
> >>>                                  24, 2,        /* mux */
> >>>                                  BIT(31),      /* gate */
> >>>                                  0);
> >>> +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox=
 driver claims it. */
> >>
> >> and this. Just note that the E902 might be running on its own, in a pu=
re
> >> firmware role, or even completely separate from the main kernel.
> >>
> >> Oh, and also please put somewhere that this is based on the linux-sunx=
i
> >> for-next tree, aside from just having the base-commit ID below.
> >>
> >> Cheers,
> >> Andre
> >>
> >>>    static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_c=
lk.common.hw,
> >>> -                      0x21c, BIT(0), 0);
> >>> +                      0x21c, BIT(0), CLK_IS_CRITICAL);
> >>>    static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &=
r_apb0_clk.common.hw,
> >>>                         0x21c, BIT(1), 0);
> >>>
> >>>
> >>> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> >>
>
>
