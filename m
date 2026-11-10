Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287458;
	b=5mOC852OZOhJcl+7Be8oBaAs9Bd4UjpxBVzo2FpE2gZNSE45aTacht4GwNY1KJUA+sVV
	 BM+KKsmaCfvUYRefMXIQqL/N+FRjdGOwrAPj2lPpegjoeXT3MkoL3yu7FAEou/vRh1vjx
	 K4a1CO6whhqInKN2RcsX+cS9zPN+4tj21um+r7tbxJn3r7y69lGEycxFOjpnckzJTd/UZ
	 2MeOXHycSti+3DQh8KXo4MxV7a8zzE9Sz7DgQTUKFDnFMiwsnxCctoWXYlkFMOVEqdJFp
	 hJ5ppwJOBUwyzfW3zxp/YL+fdfkRTYP0ZIqPn3rdxBMb41M4D4Xghq7CgqwzwiuMKjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287458;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=enpmm9MWSv/dzU1xFOa+YOoejzjOco+VDHvagv7+bRA=;
	b=tlxsjCVH1ScVuXGsCWZUdYcG8s+OPPNmxyytLGrQKdeBeTy5MM+OxsaDCVd2VVTrcsqh
	 A/TepHZwVxG+7Nm/3YSH8aZ5/ZqLI/0tDsarKL6ntvXONoQBnBLGWykeNRz2gkdE1df25
	 x9IANjybbtf0tuoSzdj3RlvkCiQR5qv/josBEcA4Ss/IDycTR2/wUKglA+nrhVdhahLNy
	 gwqcdsddD4xkl90cGnDv3eSv23EuBV4RoWNKu4xi+hIE42YC1d+0pyOKQRVBNL4wmDLdn
	 yWk/xHpk6yeIf+Za2QJIS12TfQiPPeOuTJqRM6HqOLBmhKA9A6Dgr3c8vL21HklkvVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTU0wyOp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7705C606A31C
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 05:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTU0wyOp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BB51F0089F;
	Tue, 10 Nov 2026 05:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794287458;
	bh=enpmm9MWSv/dzU1xFOa+YOoejzjOco+VDHvagv7+bRA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DTU0wyOperp0E3inrkbS5i5ABH3yuEGkbRi2xmE1LHntcmcEQ3jp+uCNakAUQCVEh
	 lR4GsleTQBnvT8jOmJRHKpYcKNeP/b2THtGkBFbfFlkv4n9ffewhTdc9aZ2klFxrHz
	 sn/fzi+FLO+sEfvsHVjUi1zLNFIjcv+5LL649HOjH5GTeNSJmEZUeCRR62XQWkWNNh
	 cJSDgLjiAG80lkY8rE8ls0PXBv1oBr1oLu/Yd6yOTaPfUuWVsuVLkdLBkMbRt0z/G5
	 nX1GcTlMoaneWbquh8UcV/qHQOG4+98qUv0KnPtBHxyZEujXu3e4DtMJ53VYtoGoEY
	 lM8BsiSX4Q4uw==
Message-ID: <sashiko-outbox-206263@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] MIPS: Ingenic: Add XBurst SMP support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <f.fainelli@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261110043131.1985993-3-f.fainelli@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
 <20261110043131.1985993-3-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 05:10:57 +0000
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
- [High] MIPS: idle: check_wait() selects xburst_wait_irqoff() on UP
  XBurst SoCs
- [High] MIPS: Ingenic: boot BUG_ON in mips_smp_ipi_allocate() on
  generic kernel
- [High] MIPS: Ingenic: missing set_cpu_present() and hotplug callbacks
  in xburst_smp_ops
- [High] MIPS: Ingenic: missing cpu_set_core() suppresses cache IPIs
  under MIPS_CPS
- [Medium] MIPS: Ingenic: invalid wait context in
  xburst_boot_secondary()
- [Low] MIPS: Ingenic: 64-bit generic kernel build failure in
  ingenic-smp
--

commit 84aca91e29a4f9f60b4d407205a2e5c0ec8d50c1
Author: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>

MIPS: Ingenic: Add XBurst SMP support

This commit adds SMP support for the second XBurst core on the Ingenic
JZ4780 using CP0 mailboxes for inter-processor interrupts, and flushes
the private data cache before entering WAIT on SMP builds.

Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099

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
Does registering xburst_smp_ops on a generic MIPS kernel trigger the
BUG_ON() in mips_smp_ipi_allocate() during boot on JZ4780?

CONFIG_MIPS_GENERIC_KERNEL selects CONFIG_MIPS_GIC and
CONFIG_SYS_SUPPORTS_MULTITHREADING, which enable CONFIG_GENERIC_IRQ_IPI
when CONFIG_SMP is enabled.  During early initcalls, mips_smp_ipi_init()
calls mips_smp_ipi_allocate() whenever num_possible_cpus() > 1, but
JZ4780 uses CP0 mailbox interrupts instead of registering a
DOMAIN_BUS_IPI irq_domain:

arch/mips/kernel/smp.c:mips_smp_ipi_allocate() {
    ...
	if (!ipidomain) {
		BUG_ON(num_present_cpus() > 1);
		return 0;
	}
    ...
}

> diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/in=
genic-smp-entry.S
> new file mode 100644
> index 0000000000000..250a0c89c9556
> --- /dev/null
> +++ b/arch/mips/ingenic/ingenic-smp-entry.S
> @@ -0,0 +1,54 @@
[ ... ]
> +	/* Invalidate both private caches before entering cached code. */
> +	li	t0, KSEG0
> +	ori	t1, t0, CACHE_SIZE
> +	mtc0	zero, CP0_TAGLO
> +	ehb
> +1:	cache	Index_Store_Tag_I, 0(t0)
> +	cache	Index_Store_Tag_D, 0(t0)
> +	addiu	t0, t0, CACHE_LINESIZE
> +	bne	t0, t1, 1b
> +	 nop
> +
> +	mfc0	t0, CP0_CONFIG
> +	li	t1, ~CONF_CM_CMASK
> +	and	t0, t0, t1
> +	ori	t0, t0, CONF_CM_CACHABLE_NONCOHERENT
> +	mtc0	t0, CP0_CONFIG
> +	mtc0	zero, CP0_PAGEMASK
> +	ehb
> +
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
Does this break 64-bit generic kernel builds when CONFIG_BOARD_INGENIC
and CONFIG_SMP are enabled?

CONFIG_BOARD_INGENIC has no dependency on CONFIG_32BIT and selects
CONFIG_MACH_JZ4780, so a 64-bit CONFIG_MIPS_GENERIC_KERNEL build compiles
arch/mips/ingenic/.  Under CONFIG_64BIT, KSEG0 (used here) and KSEG1ADDR
(used in xburst_smp_setup()) are not defined in <asm/addrspace.h>, and
xburst_secondary_cpu_entry uses 32-bit la and lw instructions to load the
unsigned long globals xburst_cpu_entry_sp and xburst_cpu_entry_gp.

> diff --git a/arch/mips/ingenic/ingenic-smp.c b/arch/mips/ingenic/ingenic-=
smp.c
> new file mode 100644
> index 0000000000000..3cdb953c7a871
> --- /dev/null
> +++ b/arch/mips/ingenic/ingenic-smp.c
> @@ -0,0 +1,247 @@
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
Does omitting cpu_set_core() leave cpu_foreign_map empty when
CONFIG_MIPS_CPS is enabled (such as in generic_defconfig)?

decode_configs() only populates the core ID from EBase.CPUNum when
CONFIG_MIPS_CPS is disabled:

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
cpu_set_core(), both CPUs keep core ID 0 under CONFIG_MIPS_CPS.
calculate_cpu_foreign_map() then treats CPU0 and CPU1 as SMT siblings
sharing L1 caches and leaves cpu_foreign_map empty, so
r4k_op_needs_ipi() returns false and cross-CPU cache flushes never send
IPIs to the other core's private L1 caches.

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
> +	if (ret)
> +		goto unlock;

[Severity: Medium]
Does calling clk_enable() while holding the raw spinlock smp_lock trigger
an invalid wait context warning under lockdep?

clk_enable() acquires the non-raw spinlock_t enable_lock in
clk_enable_lock() and cgu->lock in jz4780_core1_enable(), nesting
spinlock_t inside raw_spinlock_t and holding smp_lock with interrupts
disabled across the register polling loop in jz4780_core1_enable().

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
What happens when CONFIG_HOTPLUG_CPU is enabled (for example in a
CONFIG_MIPS_GENERIC_KERNEL build where CONFIG_MIPS_CPS selects
CONFIG_SYS_SUPPORTS_HOTPLUG_CPU)?

smp_prepare_cpus() only initializes cpu_present_mask from
cpu_possible_mask when CONFIG_HOTPLUG_CPU is disabled:

arch/mips/kernel/smp.c:smp_prepare_cpus() {
    ...
#ifndef CONFIG_HOTPLUG_CPU
	init_cpu_present(cpu_possible_mask);
#endif
}

Because neither xburst_smp_setup() nor xburst_prepare_cpus() calls
set_cpu_present(cpu, true), CPU1 is never marked present and is never
brought online during boot when CONFIG_HOTPLUG_CPU is enabled.  In
addition, xburst_smp_ops leaves .cpu_disable and .cpu_die NULL, while
__cpu_disable() and __cpu_die() in <asm/smp.h> dereference them
unconditionally.

> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 80e8a04a642e0..46526997a4c64 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
[ ... ]
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
Does this compile-time check cause single-core XBurst SoCs to use
xburst_wait_irqoff() when booted with a shared Ingenic kernel?

CONFIG_MACH_INGENIC_GENERIC unconditionally selects CONFIG_MACH_JZ4780
alongside single-core XBurst SoCs such as JZ4740, JZ4725B, JZ4770, X1000
and X1830, and all of them report CPU_XBURST.  When CONFIG_SMP is enabled
in a multi-SoC kernel, booting on any single-core XBurst SoC selects
xburst_wait_irqoff() instead of r4k_wait().  That blasts the entire L1
data cache on every idle entry and executes WAIT with local interrupts
disabled (CP0_Status.IE =3D=3D 0) and without the r4k_wait rollback handler,
which prevents interrupts from waking MIPS32r1 XBurst cores such as
JZ4740 and JZ4725B from idle.  Checking num_possible_cpus() > 1 at
runtime would restrict xburst_wait_irqoff() to SMP systems.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110043131.1985=
993-1-f.fainelli@gmail.com?part=3D2
