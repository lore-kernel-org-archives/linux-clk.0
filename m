Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458943;
	b=CtHS2qw85O3wQvh4Rl3yqO9Is2Ce8BkRg36U4kdqjWBngZe7YZ+YWd1onqGqrxZrCP7/
	 c6jxY3Goj/pD3NdNf5/sjUpbOnc7hkVMgt04E4fQrg2YRMBiIy4Wt1dnA7elnOKUMQFxI
	 twX2TokUr4ka65r3tVSI1okbnfghovTgUOv/87kNGjpnoaWp3luxSBh+vR9VXY20L1msc
	 ZSlDp1+aJromGV4GFOajyySECYJeV0s9AgV/+IlbJ+4ZUChIW8ymLo48tBlxYTbI4dLl2
	 bz4UJpnHWCSUxWCH823bAVWpu+MIj1p9spkgtW3vkrsCAUHyeM2lzhrskR1aVTkuVjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458943;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oQVECjiYv+5gin3gqfEuCwKcNL2qZjL4PiezFw9RBtk=;
	b=2WcCbeN3rzMY5WTdw1nTl1oJPP5UMKWbEBTTNxADc1+tSurlbSkI0fkNS5KaWw/8C9e4
	 sZt5TEzm4tx7O7NcpD8bZFLMD+7/C+1ku4lNAsTCDwCVz0xCJahWQWLJQh8hfXvjN2b6Z
	 JDnNvxFTyJk24dzQogRq1RubCstnk3zMzl1mUAA82QY6vylTeK5BJZVfAD1i/QiXNa6fe
	 70KYxao81/aU2NDcLHYpPcDKYGBnMDMayUtwgToUyYeOe0G8rCgHeaEXfCl2MQNlfe7Bk
	 Coo2pEHiyU7LSl6pus1R8qA88on0SpLot8TdoCtEzcACC3flJFsZZKzNRaLXDdo3yYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FvU6kbuE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA72606A31C
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 04:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FvU6kbuE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDF11F00A05;
	Thu, 12 Nov 2026 04:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794458942;
	bh=oQVECjiYv+5gin3gqfEuCwKcNL2qZjL4PiezFw9RBtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FvU6kbuEsM7PUv5Qi50yKArjm3Won4MRPvuVEALBQW2I/1iLcKXb/Qrl3bCXbvBHn
	 Z6aegKSk6l0JYz/vxA8EsgIpPfz9ReCeMxnQkl2eAWxFa8mJjXkfUTnkYNJX2eeUcL
	 CEPXYwCCCJrMlAvz7qn8YD/C169dYTR/XpEWC32mPMVv4zc6FGxjUPAj0gwu0QQxzd
	 16iUHXW8sbSjW3ExLIJNRHhd3B9UPiThzTJdwVW9j0+sTuMl8lb/A5WV8vj7blFF1a
	 9fuuDNFaVpweYbvz2tSxfGC7MrlQQGdoYxrSvT1lZXLNKpnMgHidhZJKkjbP5lRy81
	 5nrKW2kqCmm8g==
Message-ID: <sashiko-outbox-210394@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] MIPS: Ingenic: Add XBurst SMP support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <f.fainelli@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261112041422.2997275-3-f.fainelli@gmail.com>
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
 <20261112041422.2997275-3-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:49:02 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] MIPS: Ingenic: missing set_cpu_present() and hotplug ops in
  xburst_smp_ops
- [High] MIPS: Ingenic: boot BUG_ON in mips_smp_ipi_allocate() on
  generic kernel
- [High] MIPS: Ingenic: missing cpu_set_core() suppresses cache IPIs
  under MIPS_CPS
- [High] MIPS: idle: check_wait() selects xburst_wait_irqoff() on UP
  XBurst SoCs
- [Medium] MIPS: Ingenic: invalid wait context in
  xburst_boot_secondary()
- [Low] MIPS: Ingenic: 64-bit generic kernel build failure in
  ingenic-smp
--

commit 6b8dd5ed8b645649357726e158dd3bee858c1f08
Author: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>

MIPS: Ingenic: Add XBurst SMP support

This commit adds SMP support for the second XBurst core on the Ingenic
JZ4780 using CP0 mailboxes for IPIs and flushes the data cache before
entering WAIT on SMP JZ4780 kernels.

Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099

[ ... ]

> diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
> index 1d712eac16171..38f294887c17a 100644
> --- a/arch/mips/generic/init.c
> +++ b/arch/mips/generic/init.c
> @@ -13,6 +13,7 @@
> =20
>  #include <asm/bootinfo.h>
>  #include <asm/fw/fw.h>
> +#include <asm/ingenic-smp.h>
>  #include <asm/irq_cpu.h>
>  #include <asm/machine.h>
>  #include <asm/mips-cps.h>
> @@ -113,6 +114,8 @@ void __init device_tree_init(void)
>  	unflatten_and_copy_device_tree();
>  	mips_cpc_probe();
> =20
> +	if (!register_ingenic_smp_ops())
> +		return;
>  	if (!register_cps_smp_ops())
>  		return;
>  	if (!register_vsmp_smp_ops())

[Severity: High]
Does booting a generic MIPS kernel (CONFIG_MIPS_GENERIC_KERNEL=3Dy) with
CONFIG_BOARD_INGENIC=3Dy and CONFIG_SMP=3Dy on JZ4780 hit BUG_ON() in
mips_smp_ipi_allocate()?

CONFIG_MIPS_GENERIC_KERNEL selects CONFIG_MIPS_GIC and
CONFIG_SYS_SUPPORTS_MULTITHREADING, which enable CONFIG_GENERIC_IRQ_IPI=3Dy
under CONFIG_SMP=3Dy.  Because xburst_smp_ops uses direct CP0 mailbox
interrupts instead of registering a DOMAIN_BUS_IPI irq_domain, the
early_initcall mips_smp_ipi_init() -> mips_smp_ipi_allocate() finds
ipidomain =3D=3D NULL and panics whenever more than one CPU is present:

arch/mips/kernel/smp.c:mips_smp_ipi_allocate() {
    ...
	if (!ipidomain) {
		BUG_ON(num_present_cpus() > 1);
		return 0;
	}
    ...
}

[ ... ]

> diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/in=
genic-smp-entry.S
> new file mode 100644
> index 0000000000000..250a0c89c9556
> --- /dev/null
> +++ b/arch/mips/ingenic/ingenic-smp-entry.S
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2013 Paul Burton <paulburton@kernel.org>
> + * XBurst secondary CPU reset entry
> + */
> +
> +#include <asm/addrspace.h>
> +#include <asm/asm.h>
> +#include <asm/asmmacro.h>
> +#include <asm/cacheops.h>
> +#include <asm/mipsregs.h>
> +
> +#define CACHE_SIZE	(32 * 1024)
> +#define CACHE_LINESIZE	32
> +
> +	/* The CP0 REIM register only stores the upper 16 address bits. */
> +	.section .text.smp-entry, "ax"
> +	.balign 0x10000
> +	.set noreorder
> +LEAF(xburst_secondary_cpu_entry)
> +	mtc0	zero, CP0_CAUSE
> +	li	t0, ST0_CU0
> +	mtc0	t0, CP0_STATUS
> +	ehb
> +
> +	/* Invalidate both private caches before entering cached code. */
> +	li	t0, KSEG0
> +	ori	t1, t0, CACHE_SIZE

[ ... ]

> +	/* CPU0 publishes these in RAM before releasing CPU1 from reset. */
> +	la	t0, xburst_cpu_entry_sp
> +	lw	sp, 0(t0)
> +	la	t0, xburst_cpu_entry_gp
> +	lw	gp, 0(t0)
> +
> +	la	t0, smp_bootstrap
> +	jr	t0
> +	 nop
> +END(xburst_secondary_cpu_entry)

[Severity: Low]
Does this break 64-bit generic MIPS builds (CONFIG_MIPS_GENERIC_KERNEL=3Dy,
CONFIG_64BIT=3Dy) when CONFIG_BOARD_INGENIC=3Dy and CONFIG_SMP=3Dy are enab=
led?

CONFIG_BOARD_INGENIC has no dependency on CONFIG_32BIT and selects
CONFIG_MACH_JZ4780, so both ingenic-smp-entry.S and ingenic-smp.c are built
on 64-bit generic kernels.  In arch/mips/include/asm/addrspace.h, KSEG0 and
KSEG1ADDR() are only defined when CONFIG_64BIT is disabled (whereas CKSEG0
and CKSEG1ADDR() are always defined), causing xburst_secondary_cpu_entry and
xburst_smp_setup() to fail to build, alongside the 32-bit la and lw
instructions used here on unsigned long globals.

> diff --git a/arch/mips/ingenic/ingenic-smp.c b/arch/mips/ingenic/ingenic-=
smp.c
> new file mode 100644
> index 0000000000000..3cdb953c7a871
> --- /dev/null
> +++ b/arch/mips/ingenic/ingenic-smp.c

[ ... ]

> +static void __init xburst_smp_setup(void)
> +{
> +	struct device_node *np;
> +	u32 entry, reim;
> +	unsigned int cpu =3D 0;
> +	u64 hwid;
> +
> +	for_each_of_cpu_node(np) {
> +		hwid =3D of_get_cpu_hwid(np, 0);
> +		if (!of_device_is_available(np) ||
> +		    hwid >=3D ARRAY_SIZE(__cpu_number_map))
> +			continue;
> +		if (cpu >=3D nr_cpu_ids) {
> +			of_node_put(np);
> +			break;
> +		}
> +		__cpu_number_map[hwid] =3D cpu;
> +		__cpu_logical_map[cpu] =3D hwid;
> +		set_cpu_possible(cpu, true);
> +		cpu++;
> +	}

[Severity: High]
Does omitting cpu_set_core() in xburst_smp_setup() and
xburst_init_secondary() suppress cross-CPU cache flush IPIs when
CONFIG_MIPS_CPS=3Dy is enabled?

In arch/mips/kernel/cpu-probe.c, decode_configs() skips calling
cpu_set_core() when CONFIG_MIPS_CPS=3Dy (which is enabled in generic kernel=
s):

arch/mips/kernel/cpu-probe.c:decode_configs() {
    ...
#ifndef CONFIG_MIPS_CPS
	if (cpu_has_mips_r2_r6) {
		unsigned int core;

		core =3D get_ebase_cpunum();
		if (cpu_has_mipsmt)
			core >>=3D fls(core_nvpes()) - 1;
		cpu_set_core(c, core);
	}
#endif
}

Because neither xburst_smp_setup() nor xburst_init_secondary() calls
cpu_set_core(&cpu_data[cpu], hwid), both CPUs keep core ID 0, so
cpus_are_siblings(0, 1) returns true and calculate_cpu_foreign_map() leaves
cpu_foreign_map empty.  r4k_on_each_cpu() then skips sending IPIs to flush
the other core's private 32 KiB L1 I-cache and D-cache, leaving stale cache
lines across cores.

[ ... ]

> +static int xburst_boot_secondary(int cpu, struct task_struct *idle)
> +{
> +	unsigned long flags;
> +	u32 ctrl;
> +	int ret;
> +
> +	if (cpu_logical_map(cpu) !=3D 1 || IS_ERR_OR_NULL(cpu1_clock))
> +		return -ENODEV;
> +
> +	raw_spin_lock_irqsave(&smp_lock, flags);
> +	ctrl =3D read_c0_corectrl() | CORECTRL_SWRST(1) | CORECTRL_RPC(1);
> +	write_c0_corectrl(ctrl);
> +	back_to_back_c0_hazard();
> +
> +	ret =3D clk_enable(cpu1_clock);

[Severity: Medium]
Does calling clk_enable(cpu1_clock) while holding the raw spinlock smp_lock
trigger an invalid wait context splat under CONFIG_PROVE_RAW_LOCK_NESTING?

clk_enable() acquires the non-raw spinlock_t enable_lock in
clk_enable_lock() and then calls jz4780_core1_enable(), which acquires the
non-raw spinlock_t cgu->lock and polls CGU_REG_LCR for up to 5 ms while
smp_lock is held with interrupts disabled.

[ ... ]

> +static const struct plat_smp_ops xburst_smp_ops =3D {
> +	.send_ipi_single =3D xburst_send_ipi_single,
> +	.send_ipi_mask =3D xburst_send_ipi_mask,
> +	.init_secondary =3D xburst_init_secondary,
> +	.smp_finish =3D xburst_smp_finish,
> +	.boot_secondary =3D xburst_boot_secondary,
> +	.smp_setup =3D xburst_smp_setup,
> +	.prepare_cpus =3D xburst_prepare_cpus,
> +};

[Severity: High]
When CONFIG_HOTPLUG_CPU=3Dy is enabled (for example via CONFIG_MIPS_CPS=3Dy=
 in
generic_defconfig), does CPU1 fail to come online at boot, and does offlini=
ng
a CPU crash in __cpu_disable()?

In arch/mips/kernel/smp.c, smp_prepare_cpus() only initializes
cpu_present_mask from cpu_possible_mask when CONFIG_HOTPLUG_CPU is disabled.
Because neither xburst_smp_setup() nor xburst_prepare_cpus() calls
set_cpu_present(cpu, true), CPU1 is never marked present and
bringup_nonboot_cpus() never boots it.  In addition, __cpu_disable() and
__cpu_die() in arch/mips/include/asm/smp.h unconditionally call
mp_ops->cpu_disable() and mp_ops->cpu_die(), which are NULL in
xburst_smp_ops.

[ ... ]

> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 80e8a04a642e0..46526997a4c64 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -18,6 +18,7 @@
>  #include <asm/cpu-type.h>
>  #include <asm/idle.h>
>  #include <asm/mipsregs.h>
> +#include <asm/r4kcache.h>
> =20
>  /*
>   * Not all of the MIPS CPUs have the "wait" instruction available. Moreo=
ver,
> @@ -71,6 +72,23 @@ static void __cpuidle rm7k_wait_irqoff(void)
>  		"	.set	pop					\n");
>  }
> =20
> +/* XBurst gates its private cache clock in WAIT; write back dirty data f=
irst. */
> +static void __cpuidle xburst_wait_irqoff(void)
> +{
> +	unsigned long pending =3D read_c0_cause() & read_c0_status() & CAUSEF_I=
P;
> +
> +	if (!need_resched() && !pending) {
> +		r4k_blast_dcache();
> +		__asm__ __volatile__(
> +			".set push\n"
> +			".set mips3\n"
> +			"sync\n"
> +			"wait\n"
> +			".set pop\n"
> +			: : : "memory");
> +	}
> +}
> +
>  /*
>   * Au1 'wait' is only useful when the 32kHz counter is used as timer,
>   * since coreclock (and the cp0 counter) stops upon executing it. Only an
> @@ -156,10 +174,16 @@ void __init check_wait(void)
>  	case CPU_CAVIUM_OCTEON_PLUS:
>  	case CPU_CAVIUM_OCTEON2:
>  	case CPU_CAVIUM_OCTEON3:
> -	case CPU_XBURST:
>  	case CPU_LOONGSON32:
>  		cpu_wait =3D r4k_wait;
>  		break;
> +	case CPU_XBURST:
> +		if (IS_ENABLED(CONFIG_MACH_JZ4780) &&
> +		    IS_ENABLED(CONFIG_SMP))
> +			cpu_wait =3D xburst_wait_irqoff;
> +		else
> +			cpu_wait =3D r4k_wait;
> +		break;

[Severity: High]
Does check_wait() select xburst_wait_irqoff() on single-core XBurst SoCs
(such as JZ4740, JZ4725B, JZ4770, X1000, and X1830) whenever a shared
Ingenic kernel is built with CONFIG_SMP=3Dy?

CONFIG_MACH_INGENIC_GENERIC selects CONFIG_MACH_JZ4780 alongside the
single-core XBurst SoCs, and all of them report CPU_XBURST.  Using
compile-time IS_ENABLED() checks instead of a runtime check (such as
num_possible_cpus() > 1) forces every idle entry on UP XBurst machines to
write back and invalidate the entire 32 KiB L1 D-cache via
r4k_blast_dcache() and execute wait with local interrupts disabled, which
can also prevent interrupts from waking MIPS32r1 cores (JZ4740, JZ4725B).

Also, in xburst_wait_irqoff(), pending interrupts are only checked before
r4k_blast_dcache(), leaving a window during the full D-cache flush where a
newly pending interrupt is not re-checked before executing wait, and the
inline assembly uses .set mips3 rather than .set arch=3Dr4000 like the other
wait helpers in this file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112041422.2997=
275-1-f.fainelli@gmail.com?part=3D2
