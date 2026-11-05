Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912711;
	b=rLdqdWiNrPeIgGOta+9m7jnsQ0ikrrqqxuw6MNmtwX8XpFn4X2bEGsnvGK1tdAAzfbd4
	 /uyMCDSYb8fCA7QKI8jLEAEooSKQksG8OZkDiXBVxl4KBFQd10Zea+X7mECgUzUCnJ4/j
	 08lE2nDvjzpVL5ZlngU8qZXAJ5ySRkIX7WUBEw8+TYv2HBQO1/ONSkoT552shNpVHRmHl
	 5yAFlY88gOpaN7CS8sPTWKTHdm6hWHBw9QiQQuKXfw2EsfS3EjAjKHBwBUBgomwac5fLZ
	 20IasK9xZRXnf496TQ/R1bq+sJ4NQ/Kf+27pjOHE1DTup9NZgZCfI2LCqaoIHI63SbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912711;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ziU+Cd9Zt94CUJLYTiZvxyBvwtE8o1YDLNeeKnmyUlU=;
	b=P21GacxvmKHGSSmVCMzYK/nUK6zhHjnDEKCl3ymjpokZJm4Tp8eQJFqvtwAmDkSczYbS
	 j3nEsnL9weUGt9DHs/KMMD92RS1XobjMv9hwmRAeFBn5ZklXjeKOFw4r+dviVVcsg81Kz
	 TLhlJClNej2rWs8RQ0p7uWbhDuULseEVYQ0020YbziqUUnlvETaoildpl37u2M5tTDtei
	 TX9f5O4pztdzJKLxdQYg04tErfRTwHeLltTdXZG00hhnOK2nWz6IIPbW8A2BevksJS6DY
	 wNNhdzC8lx3AoBKzEOQJEQYXu02WV/2jSLVdiE9Is6V5ZSMJO1rB7E0oS9xvGSafVxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OAnsNpad;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB4606A31B
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OAnsNpad
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CC41F0089F;
	Thu,  5 Nov 2026 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793912710;
	bh=ziU+Cd9Zt94CUJLYTiZvxyBvwtE8o1YDLNeeKnmyUlU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OAnsNpadEwUyjMorKJ54sUoEVG3bQT0zRTaCNZHfOM2nuy1KxqkD/WIrhgLZcQ2Cl
	 l8iQf42VXu5BrXdvpTlUvMVqL/DPmXL3fr25rO9r4MaDmi/XO+j9iaEGmI4w+ImFt+
	 hk+j/Xg51TKLj95WJL1y86vmnOzj8mwrexU1L8PI1SoXaK6m5/uzrWYVtOC6bHgNxU
	 Ofs7sILcuTcOFJ/W1Kx1kIBDjHMWGwIuYbHCI6//xBkplWEyHSHDoIlSnVp/Xk7kom
	 kAyvrVnm8HekHw+UQa//HiNxWMIiPjnwrQLUVZ5Q+SHf33mDcI+kWeGQs1qPYbgAzi
	 K+6/FiWnOovDQ==
Message-ID: <sashiko-outbox-200182@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] MIPS: Ingenic: Add JZ4780 SMP support to the
 generic platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <f.fainelli@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261105203243.2292647-3-f.fainelli@gmail.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
 <20261105203243.2292647-3-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 21:05:09 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] MIPS: Ingenic: boot BUG_ON in mips_smp_ipi_allocate() on generic k=
ernel
- [High] MIPS: idle: check_wait() selects SMP wait on UP XBurst SoCs in sha=
red kernels
- [High] MIPS: Ingenic: missing cpu_set_core() breaks cache flush IPIs unde=
r MIPS_CPS
- [High] MIPS: Ingenic: invalid lock nesting in jz4780_boot_secondary()
- [High] MIPS: Ingenic: missing cpu_present, hotplug ops, and IPI guard on =
JZ4780
- [Low] MIPS: Ingenic: 64-bit generic kernel build failure in ingenic-smp
--

commit 481937342699e3f6c1c384229fba2460caf28933
Author: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>

MIPS: Ingenic: Add JZ4780 SMP support to the generic platform

This commit ports JZ4780 SMP support to the generic MIPS platform, adding t=
he
secondary CPU reset entry, CP0 mailbox IPI handling, CPU clock bringup, and
SMP operations registration. It also adds an XBurst SMP idle wait routine t=
hat
writes back the private data cache before executing the wait instruction.

Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099

> diff --git a/arch/mips/generic/ingenic-smp-entry.S b/arch/mips/generic/in=
genic-smp-entry.S
> new file mode 100644
> index 0000000000000..828df4687e844
> --- /dev/null
> +++ b/arch/mips/generic/ingenic-smp-entry.S
> @@ -0,0 +1,54 @@

[ ... ]

> +LEAF(jz4780_secondary_cpu_entry)
> +	mtc0	zero, CP0_CAUSE
> +	li	t0, ST0_CU0
> +	mtc0	t0, CP0_STATUS
> +	ehb
> +
> +	/* Invalidate both private caches before entering cached code. */
> +	li	t0, KSEG0
> +	ori	t1, t0, CACHE_SIZE

[Severity: Low]
Can this break the build on a 64-bit generic MIPS kernel configuration?

In arch/mips/Kconfig, CONFIG_MIPS_GENERIC_KERNEL selects
SYS_SUPPORTS_64BIT_KERNEL and SYS_SUPPORTS_MIPS_CPS. In
arch/mips/generic/Kconfig, CONFIG_BOARD_INGENIC depends only on
MIPS_GENERIC_KERNEL without a 32BIT dependency and selects
MACH_INGENIC_GENERIC, which in turn selects MACH_JZ4780. Because
CONFIG_MIPS_INGENIC_SMP in arch/mips/ingenic/Kconfig depends only on
MACH_JZ4780 && SMP, enabling CONFIG_BOARD_INGENIC=3Dy and CONFIG_SMP=3Dy in=
 a
CONFIG_64BIT=3Dy kernel builds arch/mips/generic/ingenic-smp-entry.S and
arch/mips/generic/ingenic-smp.c.

In arch/mips/include/asm/addrspace.h, KSEG0 and KSEG1ADDR are only defined
for !CONFIG_64BIT (whereas CKSEG0 and CKSEG1ADDR are defined for both 32-bit
and 64-bit kernels). Under CONFIG_64BIT=3Dy, jz4780_secondary_cpu_entry fai=
ls
to assemble due to undeclared KSEG0 (and uses 32-bit la/lw instructions to
load the unsigned long globals jz4780_cpu_entry_sp and jz4780_cpu_entry_gp),
and jz4780_smp_setup() in arch/mips/generic/ingenic-smp.c fails to compile
due to undeclared KSEG1ADDR:

    entry =3D KSEG1ADDR((unsigned long)jz4780_secondary_cpu_entry);

Should CONFIG_MIPS_INGENIC_SMP (or CONFIG_BOARD_INGENIC) depend on 32BIT, or
use CKSEG0/CKSEG1ADDR and PTR_LA/LONG_L?

> diff --git a/arch/mips/generic/ingenic-smp.c b/arch/mips/generic/ingenic-=
smp.c
> new file mode 100644
> index 0000000000000..98c1fd7483db5
> --- /dev/null
> +++ b/arch/mips/generic/ingenic-smp.c
> @@ -0,0 +1,240 @@

[ ... ]

> +static void __init jz4780_smp_setup(void)
> +{
> +	struct device_node *np;
> +	u32 entry, reim;
> +	u64 hwid;
> +
> +	for_each_of_cpu_node(np) {
> +		hwid =3D of_get_cpu_hwid(np, 0);
> +		if (hwid >=3D nr_cpu_ids || hwid >=3D JZ4780_NR_CPUS ||
> +		    !of_device_is_available(np))
> +			continue;
> +		__cpu_number_map[hwid] =3D hwid;
> +		__cpu_logical_map[hwid] =3D hwid;
> +		set_cpu_possible(hwid, true);
> +	}

[Severity: High]
Does missing cpu_set_core() here (or in jz4780_init_secondary()) suppress
cross-CPU cache flush IPIs when CONFIG_MIPS_CPS=3Dy is enabled in a generic
kernel?

Generic MIPS kernels (CONFIG_MIPS_GENERIC_KERNEL=3Dy) typically enable
CONFIG_MIPS_CPS=3Dy. On JZ4780, device_tree_init() registers jz4780_smp_ops
via register_ingenic_smp_ops() and returns before register_cps_smp_ops().

During CPU probing on both CPU0 and CPU1, decode_configs() in
arch/mips/kernel/cpu-probe.c skips setting the core ID from EBase.CPUNum
when CONFIG_MIPS_CPS is enabled:

    #ifndef CONFIG_MIPS_CPS
        if (cpu_has_mips_r2_r6) {
            unsigned int core;

            core =3D get_ebase_cpunum();
            if (cpu_has_mipsmt)
                core >>=3D fls(core_nvpes()) - 1;
            cpu_set_core(c, core);
        }
    #endif

Because neither jz4780_smp_setup() nor jz4780_init_secondary() calls
cpu_set_core(&cpu_data[hwid], hwid), both cpu_data[0] and cpu_data[1] retain
core ID 0 (globalnumber =3D=3D 0) and package =3D=3D 0.

When start_secondary() calls calculate_cpu_foreign_map() in
arch/mips/kernel/smp.c, cpus_are_siblings(1, 0) sees matching package and
core numbers and returns true, leaving cpu_foreign_map[0] empty. In
arch/mips/mm/c-r4k.c, r4k_op_needs_ipi() checks:

    return !cpumask_empty(&cpu_foreign_map[0]);

which returns false on all CPUs, so r4k_on_each_cpu() never sends IPIs to
flush the remote core's private 32 KiB L1 I-cache and D-cache during cache
maintenance operations, and populate_cache_leaves() and show_cpuinfo()
report both CPUs as core 0 sharing L1 caches.

[ ... ]

> +static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
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

[Severity: High]
Does calling clk_enable(cpu1_clock) while holding the raw spinlock smp_lock
violate raw_spinlock_t -> spinlock_t lock nesting rules?

When __cpu_up() calls jz4780_boot_secondary(), smp_lock is acquired via
raw_spin_lock_irqsave(&smp_lock, flags) (wait type LD_WAIT_SPIN). While
holding smp_lock, clk_enable(cpu1_clock) runs:

    jz4780_boot_secondary()
      raw_spin_lock_irqsave(&smp_lock, flags)
      clk_enable(cpu1_clock)
        clk_core_enable_lock()
          clk_enable_lock()
            spin_lock_irqsave(&enable_lock, flags)
          clk_core_enable()
            jz4780_core1_enable()
              spin_lock_irqsave(&cgu->lock, flags)

Both enable_lock in drivers/clk/clk.c and cgu->lock in
drivers/clk/ingenic/jz4780-cgu.c are non-raw spinlock_t locks (wait type
LD_WAIT_CONFIG), which triggers a lockdep invalid wait context splat under
CONFIG_PROVE_RAW_LOCK_NESTING and holds smp_lock with interrupts disabled
across the CGU_REG_LCR polling loop of up to 5000 us in
jz4780_core1_enable().

[ ... ]

> +static const struct plat_smp_ops jz4780_smp_ops =3D {
> +	.send_ipi_single =3D jz4780_send_ipi_single,
> +	.send_ipi_mask =3D jz4780_send_ipi_mask,
> +	.init_secondary =3D jz4780_init_secondary,
> +	.smp_finish =3D jz4780_smp_finish,
> +	.boot_secondary =3D jz4780_boot_secondary,
> +	.smp_setup =3D jz4780_smp_setup,
> +	.prepare_cpus =3D jz4780_prepare_cpus,
> +};

[Severity: High]
How does jz4780_smp_ops behave when CONFIG_HOTPLUG_CPU=3Dy is enabled (for
example via CONFIG_MIPS_GENERIC_KERNEL=3Dy with CONFIG_MIPS_CPS=3Dy and
CONFIG_SUSPEND=3Dy)?

First, in arch/mips/kernel/smp.c, smp_prepare_cpus() only copies
cpu_possible_mask to cpu_present_mask when CONFIG_HOTPLUG_CPU is disabled:

    #ifndef CONFIG_HOTPLUG_CPU
        init_cpu_present(cpu_possible_mask);
    #endif

Because neither jz4780_smp_setup() nor jz4780_prepare_cpus() calls
set_cpu_present(), CPU1 is never marked present when CONFIG_HOTPLUG_CPU=3Dy,
preventing bringup_nonboot_cpus() and _cpu_up() from booting CPU1.

Second, under CONFIG_HOTPLUG_CPU=3Dy, __cpu_disable() and __cpu_die() in
arch/mips/include/asm/smp.h unconditionally dereference mp_ops->cpu_disable
and mp_ops->cpu_die without NULL checks, whereas jz4780_smp_ops leaves both
callbacks NULL.

> diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
> index 1d712eac16171..00149bd1e9a97 100644
> --- a/arch/mips/generic/init.c
> +++ b/arch/mips/generic/init.c
> @@ -113,6 +115,8 @@ void __init device_tree_init(void)
>  	unflatten_and_copy_device_tree();
>  	mips_cpc_probe();
> =20
> +	if (!register_ingenic_smp_ops())
> +		return;
>  	if (!register_cps_smp_ops())
>  		return;
>  	if (!register_vsmp_smp_ops())

[Severity: High]
When booting a CONFIG_MIPS_GENERIC_KERNEL=3Dy image with CONFIG_BOARD_INGEN=
IC=3Dy
and CONFIG_SMP=3Dy on a dual-core JZ4780, will mips_smp_ipi_init() trigger a
boot-time BUG_ON() in mips_smp_ipi_allocate()?

In arch/mips/Kconfig, CONFIG_MIPS_GENERIC_KERNEL selects MIPS_GIC as well as
IRQ_MIPS_CPU and SYS_SUPPORTS_MULTITHREADING, which select
CONFIG_GENERIC_IRQ_IPI=3Dy when CONFIG_SMP=3Dy.

During boot on JZ4780, device_tree_init() registers jz4780_smp_ops and
jz4780_smp_setup() marks 2 CPUs as possible. When kernel_init_freeable()
runs do_pre_smp_initcalls(), the early_initcall mips_smp_ipi_init() in
arch/mips/kernel/smp.c sees num_possible_cpus() > 1 and calls
mips_smp_ipi_allocate(cpu_possible_mask):

    static int __init mips_smp_ipi_init(void)
    {
        if (num_possible_cpus() =3D=3D 1)
            return 0;

        mips_smp_ipi_allocate(cpu_possible_mask);

Because JZ4780 uses its own CP0 mailbox IPI callbacks
(jz4780_send_ipi_single and jz4780_send_ipi_mask) rather than a
DOMAIN_BUS_IPI irq_domain, ipidomain is NULL in mips_smp_ipi_allocate():

    if (!ipidomain) {
        BUG_ON(num_present_cpus() > 1);
        return 0;
    }

Whenever num_present_cpus() > 1, this hits BUG_ON(num_present_cpus() > 1).

> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 80e8a04a642e0..6cabdd4825a7b 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -156,10 +174,15 @@ void __init check_wait(void)
>  	case CPU_CAVIUM_OCTEON_PLUS:
>  	case CPU_CAVIUM_OCTEON2:
>  	case CPU_CAVIUM_OCTEON3:
> -	case CPU_XBURST:
>  	case CPU_LOONGSON32:
>  		cpu_wait =3D r4k_wait;
>  		break;
> +	case CPU_XBURST:
> +		if (IS_ENABLED(CONFIG_MIPS_INGENIC_SMP))
> +			cpu_wait =3D ingenic_smp_wait_irqoff;
> +		else
> +			cpu_wait =3D r4k_wait;
> +		break;

[Severity: High]
Does checking IS_ENABLED(CONFIG_MIPS_INGENIC_SMP) at compile time in
check_wait() cause single-core XBurst SoCs in a shared kernel to use
ingenic_smp_wait_irqoff() instead of r4k_wait()?

In arch/mips/ingenic/Kconfig, shared Ingenic configurations
(CONFIG_INGENIC_GENERIC_BOARD or CONFIG_BOARD_INGENIC) select
CONFIG_MACH_INGENIC_GENERIC, which selects MACH_JZ4740, MACH_JZ4725B,
MACH_JZ4770, MACH_JZ4780, MACH_X1000, and MACH_X1830. When CONFIG_SMP=3Dy is
enabled in that shared kernel, CONFIG_MIPS_INGENIC_SMP is unconditionally
enabled at build time.

All of those SoCs set c->cputype =3D CPU_XBURST in cpu_probe_ingenic(). Whe=
n a
shared kernel boots on a uniprocessor XBurst SoC (or on JZ4780 with a single
active CPU), register_ingenic_smp_ops() falls back to register_up_smp_ops(),
leaving num_possible_cpus() =3D=3D 1. However, check_wait() still assigns
cpu_wait =3D ingenic_smp_wait_irqoff because IS_ENABLED(CONFIG_MIPS_INGENIC=
_SMP)
is true.

As a result, every idle transition on single-core XBurst SoCs flushes and
invalidates the entire L1 data cache via r4k_blast_dcache() and executes the
wait instruction with CP0_Status.IE cleared (which also prevents interrupts
from waking MIPS32r1 XBurst cores such as JZ4740 and JZ4725B from wait).
Should check_wait() also check at runtime whether multiple CPUs are present
or possible (for example, num_possible_cpus() > 1)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105203243.2292=
647-1-f.fainelli@gmail.com?part=3D2
