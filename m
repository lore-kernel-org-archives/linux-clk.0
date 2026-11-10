Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288763;
	b=m8lsoefFCUH8GxGW5PxwBy8iTITDcTJsjMnjvsywnGwtN+uSgSD8DDXKG35s8kMl+xwT
	 eYRD49P/8uM8X7cgUfjkumLMeEjxKNBsLTLyhzlP2TaOkNUfVe+g4pPBCWio64RKzcAkD
	 FwUhBu4clScDinxYfSpZCmT4V9ae8rA7cwc7xc9DjEv3JxVnUQxWP4lZySubazvbuPux7
	 lnrVqeZSRy5M6feFwoAUm3+oa8xWIIDVfEMjFp4dAM4A+XFRbG/pRsOYZ/Ix/gkQ4XWKh
	 ArN6aqXkg53HSMhiD4xlMaoGeh4eA8rE+svGXuXatBqw5ZOk4SkraPjkMS/8m6SBfsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288763;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GrP2nT2FOemStq+sdAfAVtULHZfP2DOa325YDqCZUKA=;
	b=YQc5xLTB0ihejhEUmnv3oo+rhZ1+cZRguKvZKj0yvrvw+XgWaLTEaFMyDppiPbjhopQ3
	 9ROyMOBOg76NmNCv4Dkj/JNfaBX70kllL0UFFOUES+HlAHsRKe1f3VSVvuBQgw5VQ4pns
	 5tCF3LP6kGF1Ro/gfQfTFYYhKNt2lGVJK4RcqJPcD2NpgTJH0Zx2SrQEZGspTPn+DOpyT
	 G36EZoXgeyEqu+plxnIVUcKQ+0FYIbsCsTTNIVXQORh/Iiw4/luicom3UrlUz0Gg1u9Mu
	 lKRZ3NxFrUNUFejxDLq58exTSj7zjSVYVzfhgTsXXGLXt88k+JwYduZAdqA0rBDffaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaZ1jAvS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5268606A31C
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 05:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaZ1jAvS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731661F0089F;
	Tue, 10 Nov 2026 05:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794288762;
	bh=GrP2nT2FOemStq+sdAfAVtULHZfP2DOa325YDqCZUKA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QaZ1jAvSMC8D/oHk+GZVgygtu2oZWysHrd/8ewFEu4DsO3J3tf9mHJuX5noTifdO8
	 B9x885fDGS1kft5Lynj0NfxEwfK0RU/SiLXh5cYYOMEYZvvdeGzHVz+2RrkED0bvkU
	 /Fr62gXTqFOPq5i5U5ne/bR8XZoUHM7cfF8bo4e5p0XhV5hHTlq1zHhso3qxh5tTPz
	 v8UBkKlldy0WqV24pdQFxEbh32/8I6wsWXmsTcXhWP/7tXoSTGY1xVI6j3aEkq84+3
	 tyts2+mfpW5qtf6/03GDgcQPeyn6vhp2lvEcNKViGSAXFmYnHCDTxsj6ScL8FQeqXw
	 EY34ytEQ7KSuQ==
Message-ID: <sashiko-outbox-206301@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] MIPS: CI20: Enable SMP with two CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <f.fainelli@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261110043131.1985993-4-f.fainelli@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
 <20261110043131.1985993-4-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 05:32:42 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] mips: ingenic: invalid lock nesting in xburst_boot_secondary()
- [High] mips: ingenic: boot BUG_ON in mips_smp_ipi_allocate() and
  missing present mask
- [High] mips: ingenic: missing cpu_set_core() skips cache IPIs under
  CONFIG_MIPS_CPS
- [Low] mips: ingenic: 64-bit build failure in xburst_smp_setup() and
  entry asm
--

commit 80faf5187246f2a8b8c7ef1db1522ec3cdf520d4
Author: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>

MIPS: CI20: Enable SMP with two CPUs

This commit enables CONFIG_SMP=3Dy and sets CONFIG_NR_CPUS=3D2 in ci20_defc=
onfig
to use both cores of the JZ4780 SoC.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739

> diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_de=
fconfig
> index 90536cab417ee..09d65094b1bd2 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -22,6 +22,8 @@ CONFIG_EXPERT=3Dy
>  CONFIG_MACH_INGENIC_SOC=3Dy
>  CONFIG_JZ4780_CI20=3Dy
>  CONFIG_HIGHMEM=3Dy
> +CONFIG_SMP=3Dy
> +CONFIG_NR_CPUS=3D2

[Severity: High]
Does xburst_boot_secondary() acquire non-raw spinlocks while holding the
raw_spinlock_t smp_lock?

arch/mips/ingenic/ingenic-smp.c:xburst_boot_secondary() {
	...
	raw_spin_lock_irqsave(&smp_lock, flags);
	ctrl =3D read_c0_corectrl() | CORECTRL_SWRST(1) | CORECTRL_RPC(1);
	write_c0_corectrl(ctrl);
	back_to_back_c0_hazard();

	ret =3D clk_enable(cpu1_clock);
	...
}

When bringing up CPU1 via smp_init() -> cpu_up(1) -> xburst_boot_secondary(=
),
clk_enable() acquires the non-raw spinlock_t enable_lock in clk_enable_lock=
()
and cgu->lock in jz4780_core1_enable() while smp_lock is held.  This trigge=
rs
an invalid wait context lockdep BUG under CONFIG_PROVE_LOCKING, sleeps in
atomic context on PREEMPT_RT kernels, and holds smp_lock with interrupts
disabled across the 5000 us busy-poll loop in jz4780_core1_enable().

[Severity: High]
Does booting a generic MIPS SMP kernel (CONFIG_MIPS_GENERIC_KERNEL=3Dy,
CONFIG_BOARD_INGENIC=3Dy, CONFIG_SMP=3Dy) on JZ4780 either leave CPU1 offli=
ne or
hit BUG_ON(num_present_cpus() > 1) in mips_smp_ipi_allocate()?

xburst_smp_setup() only calls set_cpu_possible(cpu, true), and
smp_prepare_cpus() only runs init_cpu_present(cpu_possible_mask) when
CONFIG_HOTPLUG_CPU is disabled.  When CONFIG_HOTPLUG_CPU=3Dy (such as in
generic_defconfig), CPU1 is never marked present in cpu_present_mask and is
never brought up.

Furthermore, CONFIG_MIPS_GENERIC_KERNEL selects CONFIG_MIPS_GIC, which sele=
cts
CONFIG_GENERIC_IRQ_IPI when CONFIG_SMP=3Dy.  During boot, mips_smp_ipi_init=
()
calls mips_smp_ipi_allocate(cpu_possible_mask), where ipidomain is NULL
because JZ4780 uses its own mailbox IPI handlers instead of registering a
DOMAIN_BUS_IPI irq_domain:

arch/mips/kernel/smp.c:mips_smp_ipi_allocate() {
	...
	if (!ipidomain) {
		BUG_ON(num_present_cpus() > 1);
		return 0;
	}
	...
}

Whenever CPU1 is marked present (for example with CONFIG_HOTPLUG_CPU=3Dn), =
this
triggers a kernel panic at boot.

[Severity: High]
Does xburst_smp_setup() leave both JZ4780 cores with core ID 0 when
CONFIG_MIPS_CPS=3Dy, causing r4k_on_each_cpu() to skip cross-CPU cache flush
IPIs?

decode_configs() in arch/mips/kernel/cpu-probe.c only calls cpu_set_core()
when CONFIG_MIPS_CPS is disabled, and neither xburst_smp_setup() nor
xburst_init_secondary() calls cpu_set_core().  Under CONFIG_MIPS_CPS=3Dy (s=
uch
as in generic_defconfig), both CPU0 and CPU1 retain core ID 0, so
cpus_are_siblings(0, 1) returns true and calculate_cpu_foreign_map() leaves
cpu_foreign_map[0] empty.  r4k_op_needs_ipi() then returns false and skips
all cross-CPU L1 I-cache and D-cache flush IPIs between Core 0 and Core 1,
corrupting memory and instructions across their non-coherent L1 caches.

[Severity: Low]
Does building a 64-bit generic MIPS SMP kernel (CONFIG_MIPS_GENERIC_KERNEL=
=3Dy,
CONFIG_64BIT=3Dy, CONFIG_BOARD_INGENIC=3Dy, CONFIG_SMP=3Dy) fail in
arch/mips/ingenic/ingenic-smp.c and arch/mips/ingenic/ingenic-smp-entry.S?

CONFIG_BOARD_INGENIC can be enabled on 64-bit generic kernels and selects
CONFIG_MACH_JZ4780 and CONFIG_SYS_SUPPORTS_SMP.  When CONFIG_64BIT=3Dy,
KSEG1ADDR and KSEG0 are not defined in arch/mips/include/asm/addrspace.h,
so xburst_smp_setup() fails to compile at KSEG1ADDR(), and
xburst_secondary_cpu_entry fails to assemble on KSEG0 as well as the 32-bit
la and lw instructions used on 64-bit pointers and unsigned long symbols.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110043131.1985=
993-1-f.fainelli@gmail.com?part=3D3
