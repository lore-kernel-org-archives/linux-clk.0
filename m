Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912312;
	b=l9Hck4iRnCTFnlttNCiYjAAs/cDLTRAy+rUxAb3hNkcJE4XQSlgK5a3/iBR/0uMua9yM
	 7VMvD+RlRh/vGFT1m3BSPmdj8gua9mR+93CnVAFoh0Z8Zl6b6BlUVbAuEoaJHUEsI5Nxh
	 6dtDCP+znHhTnOADeuQhypjcLcex/T6jsgXDnJGV0fdrq8yjttCIcbTaFa20D2c/p1kta
	 YpeNma1OuppgGbL34wg/XqAivnwxE7CXqTn3taq1eNlS1nszxOCInaDPCyhl7Uv2l+BOi
	 rUcKEx4DO47giOkDyw5PH7i8eK3dTDnEsBt4RicPblv4UneYvPsESITTbd6ew9c0+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912312;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZNhB7RpHvGa7ipwXoO1m0fVEVVKCzSrzFXoLBY8YJas=;
	b=lAfcBwHNrFXc4V6CVH0g8LWeDU10BJBcMQdu6MU+fkppVOfnfEgOz6bfx1Aeq8fTPt54
	 yxQlxCS60tGZEbZnFkXaHd8qj4jXlxHapTDrClmVPI+uQfJfk9yowiYiO9ljykc/I0/Yh
	 FotaZhDljExbbKzGJSVECWei813Cf1Kno+ZxPod9VYjHTjUjO9c668VX3WR9yZRjCTvdz
	 ep5NyCRZvo59V/54YEBEQVB9D4kwJGUl79F42z2Et/QBVATY6VFNnEq/dHLbVy4IJtKko
	 gnw6QYXwTrVfbL5VAF8gOAlw8Isn4qAkdz064xT3XUbmKPyfQTS0gEdWoPQpDN6DQgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvGWuOnK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6EB606A31B
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 20:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvGWuOnK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6881F0089F;
	Thu,  5 Nov 2026 20:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793912311;
	bh=ZNhB7RpHvGa7ipwXoO1m0fVEVVKCzSrzFXoLBY8YJas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dvGWuOnKZvKtWpfI2JIQUjf/9LbZVEOTljEWjNwjYU7rwwWZ++rfrFUZYuDOWlBo6
	 i5CgtVkkb0eKmurGzilLYy8rgYMEnADP7RbuqdnerqBjrMxl7AGYHxpfdnOa+LU787
	 tHO5sifTdTFUlWCY0yWLhPS/OFFjoGOwTjnyoOblTUW3JeOCHqC3TK5g/b06cCecmY
	 cHuAQ3TVt9z8GoMFjXoCtofct1L6xDHkorHMtMJAf6ZEW3K7yA0HCSOLQtZCxJkVaY
	 r+tN0Tkj/SobxliJp/VrgFf3yUAMHXmYGoE3yGhaq4WCGgJ0dbvXBz8qkB/AqPm2tv
	 m2uQCQM9H89vg==
Message-ID: <sashiko-outbox-200170@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] MIPS: CI20: Enable SMP with two CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <f.fainelli@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261105203243.2292647-4-f.fainelli@gmail.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
 <20261105203243.2292647-4-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 20:58:30 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] mips: ingenic: invalid lock nesting in jz4780_boot_secondary()
- [High] mips: ingenic: boot BUG_ON in mips_smp_ipi_allocate() and missing =
present mask
- [High] mips: ingenic: missing cpu_set_core() breaks cache IPIs under CONF=
IG_MIPS_CPS
- [Low] mips: ingenic: 64-bit build failure when CONFIG_MIPS_INGENIC_SMP=3Dy
--

commit 481937342699e3f6c1c384229fba2460caf28933
Author: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>

MIPS: Ingenic: Add JZ4780 SMP support to the generic platform

This commit ports JZ4780 secondary core reset entry and mailbox support to =
the
generic MIPS platform, registering Ingenic multi-processor operations during
device tree initialization.

Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099

> diff --git a/arch/mips/generic/ingenic-smp.c b/arch/mips/generic/ingenic-=
smp.c
> new file mode 100644
> index 0000000000000..98c1fd7483db5
> --- /dev/null
> +++ b/arch/mips/generic/ingenic-smp.c
> @@ -0,0 +1,240 @@

[ ... ]

> +static struct clk *cpu1_clock;
> +static DEFINE_RAW_SPINLOCK(smp_lock);

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
How does this behave when booting a generic kernel image with
CONFIG_MIPS_GENERIC_KERNEL=3Dy and CONFIG_BOARD_INGENIC=3Dy?

In jz4780_smp_setup(), discovered cores are marked possible with
set_cpu_possible(hwid, true), while neither jz4780_smp_setup() nor
jz4780_prepare_cpus() calls set_cpu_present(hwid, true). In
arch/mips/kernel/smp.c, smp_prepare_cpus() only populates cpu_present_mask
when CONFIG_HOTPLUG_CPU is disabled:

    void __init smp_prepare_cpus(unsigned int max_cpus)
    {
        ...
    #ifndef CONFIG_HOTPLUG_CPU
        init_cpu_present(cpu_possible_mask);
    #endif
        cpumask_copy(&cpu_coherent_mask, cpu_possible_mask);
    }

When CONFIG_HOTPLUG_CPU=3Dy (such as in generic_defconfig), the secondary c=
ore
is never marked present and smp_init() will not bring it up.

On the other hand, when the secondary core is marked present,
CONFIG_MIPS_GENERIC_KERNEL selects CONFIG_MIPS_GIC and
CONFIG_SYS_SUPPORTS_MULTITHREADING, which select CONFIG_GENERIC_IRQ_IPI when
CONFIG_SMP=3Dy. During do_pre_smp_initcalls(), mips_smp_ipi_init() calls
mips_smp_ipi_allocate(cpu_possible_mask):

    if (!ipidomain) {
        BUG_ON(num_present_cpus() > 1);
        return 0;
    }

Because JZ4780 uses its own mailbox handlers in jz4780_smp_ops rather than
registering a DOMAIN_BUS_IPI irq_domain, ipidomain is NULL. Won't this trig=
ger
the BUG_ON(num_present_cpus() > 1) check at boot when running a generic ker=
nel
with CONFIG_GENERIC_IRQ_IPI=3Dy?

[Severity: High]
Also in jz4780_smp_setup() (and jz4780_init_secondary()), should
cpu_set_core(&cpu_data[hwid], hwid) be called so each core gets a distinct
core identifier?

In arch/mips/kernel/cpu-probe.c, decode_configs() only populates the core
number when CONFIG_MIPS_CPS is disabled:

    #ifndef CONFIG_MIPS_CPS
        if (cpu_has_mips_r2_r6) {
            unsigned int core;

            core =3D get_ebase_cpunum();
            if (cpu_has_mipsmt)
                core >>=3D fls(core_nvpes()) - 1;
            cpu_set_core(c, core);
        }
    #endif

When CONFIG_MIPS_CPS=3Dy is enabled alongside CONFIG_MIPS_INGENIC_SMP=3Dy (=
for
example in a generic kernel config), neither decode_configs() nor the Ingen=
ic
platform code calls cpu_set_core(). Both cores then keep core number 0 in
cpu_data[cpu].globalnumber, causing cpus_are_siblings(0, 1) to return true
and calculate_cpu_foreign_map() to leave cpu_foreign_map[] empty.

In arch/mips/mm/c-r4k.c, r4k_op_needs_ipi() checks:

    #ifdef CONFIG_SMP
        return !cpumask_empty(&cpu_foreign_map[0]);
    #else
        return false;
    #endif

With cpu_foreign_map[0] empty, won't r4k_on_each_cpu() skip cross-core
instruction and data cache flush calls between the two cores even though th=
ey
have separate non-coherent primary caches?

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
Is it valid to call clk_enable(cpu1_clock) while holding the raw spinlock
smp_lock?

In jz4780_boot_secondary(), smp_lock is a raw_spinlock_t acquired via
raw_spin_lock_irqsave(&smp_lock, flags). Calling clk_enable(cpu1_clock) und=
er
smp_lock enters:

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
drivers/clk/ingenic/jz4780-cgu.c are non-raw spinlock_t locks, and
jz4780_core1_enable() also busy-polls CGU_REG_LCR via
readl_poll_timeout_atomic() for up to 5000 us. Doesn't nesting non-raw
spinlock_t acquisitions inside a raw_spinlock_t critical section violate
lockdep wait-context rules (triggering an invalid wait context warning when
CONFIG_PROVE_RAW_LOCK_NESTING is enabled and sleeping while atomic on
PREEMPT_RT)?

[ ... ]

> diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
> index f595b339a4b84..1dfd0bfd01937 100644
> --- a/arch/mips/ingenic/Kconfig
> +++ b/arch/mips/ingenic/Kconfig
> @@ -64,6 +64,12 @@ config MACH_JZ4780
>  	select MIPS_CPU_SCACHE
>  	select SYS_HAS_CPU_MIPS32_R2
>  	select SYS_SUPPORTS_HIGHMEM
> +	select SYS_SUPPORTS_SMP
> +
> +config MIPS_INGENIC_SMP
> +	def_bool y
> +	depends on MACH_JZ4780 && SMP
> +	select SMP_UP

[Severity: Low]
Can CONFIG_MIPS_INGENIC_SMP be enabled on a 64-bit generic kernel build?

In arch/mips/generic/Kconfig, CONFIG_BOARD_INGENIC can be enabled under
CONFIG_MIPS_GENERIC_KERNEL with CONFIG_64BIT=3Dy, which selects
CONFIG_MACH_INGENIC_GENERIC and CONFIG_MACH_JZ4780. When CONFIG_SMP=3Dy is =
also
enabled, CONFIG_MIPS_INGENIC_SMP is automatically selected.

When CONFIG_64BIT=3Dy, arch/mips/include/asm/addrspace.h does not define
KSEG1ADDR or KSEG0, so building arch/mips/generic/ingenic-smp.c fails in
jz4780_smp_setup():

    entry =3D KSEG1ADDR((unsigned long)jz4780_secondary_cpu_entry);

and assembling arch/mips/generic/ingenic-smp-entry.S fails in
jz4780_secondary_cpu_entry at KSEG0 and at the 32-bit la and lw instructions
used on jz4780_cpu_entry_sp, jz4780_cpu_entry_gp, and smp_bootstrap:

    li	t0, KSEG0
    ...
    la	t0, jz4780_cpu_entry_sp
    lw	sp, 0(t0)
    la	t0, jz4780_cpu_entry_gp
    lw	gp, 0(t0)

    la	t0, smp_bootstrap

Should MIPS_INGENIC_SMP (or BOARD_INGENIC) depend on 32BIT, or use
pointer-sized macros and CKSEG0 / CKSEG1ADDR?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105203243.2292=
647-1-f.fainelli@gmail.com?part=3D3
